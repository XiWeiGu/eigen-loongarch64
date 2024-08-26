// This file is part of Eigen, a lightweight C++ template library
// for linear algebra.
//
// Copyright (C) 2024 Charlie Schlosser <cs.schlosser@gmail.com>
//
// This Source Code Form is subject to the terms of the Mozilla
// Public License v. 2.0. If a copy of the MPL was not distributed
// with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

#ifndef EIGEN_INNER_PRODUCT_EVAL_H
#define EIGEN_INNER_PRODUCT_EVAL_H

// IWYU pragma: private
#include "./InternalHeaderCheck.h"

namespace Eigen {

namespace internal {

// recursively searches for the largest simd type that does not exceed Size, or the smallest if no such type exists
template <typename Scalar, int Size, typename Packet = typename packet_traits<Scalar>::type,
          bool Stop =
              (unpacket_traits<Packet>::size <= Size) || is_same<Packet, typename unpacket_traits<Packet>::half>::value>
struct find_inner_product_packet_helper;

template <typename Scalar, int Size, typename Packet>
struct find_inner_product_packet_helper<Scalar, Size, Packet, false> {
  using type = typename find_inner_product_packet_helper<Scalar, Size, typename unpacket_traits<Packet>::half>::type;
};

template <typename Scalar, int Size, typename Packet>
struct find_inner_product_packet_helper<Scalar, Size, Packet, true> {
  using type = Packet;
};

template <typename Scalar, int Size>
struct find_inner_product_packet : find_inner_product_packet_helper<Scalar, Size> {};

template <typename Scalar>
struct find_inner_product_packet<Scalar, Dynamic> {
  using type = typename packet_traits<Scalar>::type;
};

template <typename Lhs, typename Rhs>
struct inner_product_assert {
  EIGEN_STATIC_ASSERT_VECTOR_ONLY(Lhs)
  EIGEN_STATIC_ASSERT_VECTOR_ONLY(Rhs)
  EIGEN_STATIC_ASSERT_SAME_VECTOR_SIZE(Lhs, Rhs)
#ifndef EIGEN_NO_DEBUG
  static EIGEN_DEVICE_FUNC void run(const Lhs& lhs, const Rhs& rhs) {
    eigen_assert((lhs.size() == rhs.size()) && "Inner product: lhs and rhs vectors must have same size");
  }
#else
  static void run(const Lhs&, const Rhs&) {}
#endif
};

template <typename Func, typename Lhs, typename Rhs>
struct inner_product_evaluator {
  static constexpr int LhsFlags = evaluator<Lhs>::Flags, RhsFlags = evaluator<Rhs>::Flags,
                       SizeAtCompileTime = min_size_prefer_fixed(Lhs::SizeAtCompileTime, Rhs::SizeAtCompileTime),
                       LhsAlignment = evaluator<Lhs>::Alignment, RhsAlignment = evaluator<Rhs>::Alignment;

  using Scalar = typename Func::result_type;
  using Packet = typename find_inner_product_packet<Scalar, SizeAtCompileTime>::type;

  static constexpr bool Vectorize = bool(LhsFlags & RhsFlags & PacketAccessBit) && Func::PacketAccess &&
                                    (unpacket_traits<Packet>::size <= SizeAtCompileTime);

  EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE explicit inner_product_evaluator(const Lhs& lhs, const Rhs& rhs,
                                                                         Func func = Func())
      : m_func(func), m_lhs(lhs), m_rhs(rhs), m_size(lhs.size()) {
    inner_product_assert<Lhs, Rhs>::run(lhs, rhs);
  }

  EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Index size() const { return m_size.value(); }

  EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar initialize() const { return m_func.initialize(); }

  EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar coeff(const Scalar& value, Index index) const {
    return m_func.coeff(value, m_lhs.coeff(index), m_rhs.coeff(index));
  }

  template <typename PacketType, int LhsMode = LhsAlignment, int RhsMode = RhsAlignment>
  EIGEN_STRONG_INLINE PacketType packet(PacketType value, Index index) const {
    return m_func.packet(value, m_lhs.template packet<LhsMode, PacketType>(index),
                         m_rhs.template packet<RhsMode, PacketType>(index));
  }

  const Func m_func;
  const evaluator<Lhs> m_lhs;
  const evaluator<Rhs> m_rhs;
  const variable_if_dynamic<Index, SizeAtCompileTime> m_size;
};

// scalar loop
template <typename Evaluator, int Index, int Size>
struct inner_product_scalar_unroller {
  using Scalar = typename Evaluator::Scalar;
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar run(const Evaluator& eval, Scalar& accum) {
    accum = eval.coeff(accum, Index);
    return inner_product_scalar_unroller<Evaluator, Index + 1, Size>::run(eval, accum);
  }
};
// scalar loop finalization
template <typename Evaluator, int Size>
struct inner_product_scalar_unroller<Evaluator, Size, Size> {
  using Scalar = typename Evaluator::Scalar;
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar run(const Evaluator&, const Scalar& accum) { return accum; }
};
// vector loop
template <typename Evaluator, typename Packet, int Index, int End, int Size>
struct inner_product_vector_unroller {
  using Scalar = typename Evaluator::Scalar;
  static constexpr int PacketSize = unpacket_traits<Packet>::size;
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar run(const Evaluator& eval, Packet& accum) {
    accum = eval.packet(accum, Index);
    return inner_product_vector_unroller<Evaluator, Packet, Index + PacketSize, End, Size>::run(eval, accum);
  }
};
// vector loop finalization
template <typename Evaluator, typename Packet, int Size>
struct inner_product_vector_unroller<Evaluator, Packet, Size, Size, Size> {
  using Scalar = typename Evaluator::Scalar;
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar run(const Evaluator&, const Packet& accum) {
    return predux(accum);
  }
};
// transition from vector to scalar loop
template <typename Evaluator, typename Packet, int End, int Size>
struct inner_product_vector_unroller<Evaluator, Packet, End, End, Size> {
  using Scalar = typename Evaluator::Scalar;
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar run(const Evaluator& eval, const Packet& accum) {
    Scalar scalarAccum = predux(accum);
    return inner_product_scalar_unroller<Evaluator, End, Size>::run(eval, scalarAccum);
  }
};

template <typename Evaluator, bool Unroll = (Evaluator::SizeAtCompileTime <= 32), bool Vectorize = Evaluator::Vectorize>
struct inner_product_impl;

// unrolled scalar
template <typename Evaluator>
struct inner_product_impl<Evaluator, true, false> {
  using Scalar = typename Evaluator::Scalar;
  static constexpr int Size = Evaluator::SizeAtCompileTime;
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar run(const Evaluator& eval) {
    Scalar scalarAccum = Scalar(0);
    return inner_product_scalar_unroller<Evaluator, 0, Size>::run(eval, scalarAccum);
  }
};
// unrolled simd
template <typename Evaluator>
struct inner_product_impl<Evaluator, true, true> {
  using Scalar = typename Evaluator::Scalar;
  using Packet = typename Evaluator::Packet;
  static constexpr int Size = Evaluator::SizeAtCompileTime, PacketSize = unpacket_traits<Packet>::size,
                       PacketEnd = numext::round_down(Size, PacketSize);
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar run(const Evaluator& eval) {
    Packet packetAccum = pzero(Packet());
    return inner_product_vector_unroller<Evaluator, Packet, 0, PacketEnd, Size>::run(eval, packetAccum);
  }
};
// dynamic scalar
template <typename Evaluator>
struct inner_product_impl<Evaluator, false, false> {
  using Scalar = typename Evaluator::Scalar;
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar run(const Evaluator& eval) {
    const Index size = eval.size();
    Scalar scalarAccum = Scalar(0);
    for (Index k = 0; k < size; k++) scalarAccum = eval.coeff(scalarAccum, k);
    return scalarAccum;
  }
};
// dynamic simd
template <typename Evaluator>
struct inner_product_impl<Evaluator, false, true> {
  using Scalar = typename Evaluator::Scalar;
  using Packet = typename Evaluator::Packet;
  static constexpr int PacketSize = unpacket_traits<Packet>::size;
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar run(const Evaluator& eval) {
    const Index size = eval.size();
    const Index packetEnd = numext::round_down(size, PacketSize);
    Packet packetAccum = pzero(Packet());
    for (Index k = 0; k < packetEnd; k += PacketSize) packetAccum = eval.packet(packetAccum, k);
    Scalar scalarAccum = predux(packetAccum);
    for (Index k = packetEnd; k < size; k++) scalarAccum = eval.coeff(scalarAccum, k);
    return scalarAccum;
  }
};

template <typename Scalar, bool Conj>
struct conditional_conj;

template <typename Scalar>
struct conditional_conj<Scalar, true> {
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar coeff(const Scalar& a) { return numext::conj(a); }
  template <typename Packet>
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Packet packet(const Packet& a) {
    return pconj(a);
  }
};

template <typename Scalar>
struct conditional_conj<Scalar, false> {
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar coeff(const Scalar& a) { return a; }
  template <typename Packet>
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Packet packet(const Packet& a) {
    return a;
  }
};

template <typename LhsScalar, typename RhsScalar, bool Conj>
struct scalar_inner_product_op {
  using result_type = typename ScalarBinaryOpTraits<LhsScalar, RhsScalar>::ReturnType;
  using conj_helper = conditional_conj<LhsScalar, Conj>;
  EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE result_type coeff(const result_type& accum, const LhsScalar& a,
                                                          const RhsScalar& b) const {
    return (conj_helper::coeff(a) * b) + accum;
  }
  static constexpr bool PacketAccess = false;
};

template <typename Scalar, bool Conj>
struct scalar_inner_product_op<Scalar, Scalar, Conj> {
  using result_type = Scalar;
  using conj_helper = conditional_conj<Scalar, Conj>;
  EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Scalar coeff(const Scalar& accum, const Scalar& a, const Scalar& b) const {
    return pmadd(conj_helper::coeff(a), b, accum);
  }
  template <typename Packet>
  EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE Packet packet(const Packet& accum, const Packet& a, const Packet& b) const {
    return pmadd(conj_helper::packet(a), b, accum);
  }
  static constexpr bool PacketAccess = packet_traits<Scalar>::HasMul && packet_traits<Scalar>::HasAdd;
};

template <typename Lhs, typename Rhs, bool Conj>
struct default_inner_product_impl {
  using LhsScalar = typename traits<Lhs>::Scalar;
  using RhsScalar = typename traits<Rhs>::Scalar;
  using Op = scalar_inner_product_op<LhsScalar, RhsScalar, Conj>;
  using Evaluator = inner_product_evaluator<Op, Lhs, Rhs>;
  using result_type = typename Evaluator::Scalar;
  static EIGEN_DEVICE_FUNC EIGEN_STRONG_INLINE result_type run(const MatrixBase<Lhs>& a, const MatrixBase<Rhs>& b) {
    Evaluator eval(a.derived(), b.derived(), Op());
    return inner_product_impl<Evaluator>::run(eval);
  }
};

template <typename Lhs, typename Rhs>
struct dot_impl : default_inner_product_impl<Lhs, Rhs, true> {};

}  // namespace internal
}  // namespace Eigen

#endif  // EIGEN_INNER_PRODUCT_EVAL_H
