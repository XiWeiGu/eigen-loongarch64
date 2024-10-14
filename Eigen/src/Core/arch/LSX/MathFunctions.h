// This file is part of Eigen, a lightweight C++ template library
// for linear algebra.
//
// Copyright (C) 2024 XiWei Gu (guxiwei-hf@loongson.cn)
//
// This Source Code Form is subject to the terms of the Mozilla
// Public License v. 2.0. If a copy of the MPL was not distributed
// with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

#ifndef EIGEN_MATH_FUNCTIONS_LSX_H
#define EIGEN_MATH_FUNCTIONS_LSX_H

/* The sin and cos functions of this file are loosely derived from
 * Julien Pommier's sse math library: http://gruntthepeon.free.fr/ssemath/
 */

// IWYU pragma: private
#include "../../InternalHeaderCheck.h"

namespace Eigen {

namespace internal {

EIGEN_DOUBLE_PACKET_FUNCTION(atanh, Packet2d)
EIGEN_DOUBLE_PACKET_FUNCTION(log, Packet2d)
EIGEN_DOUBLE_PACKET_FUNCTION(log2, Packet2d)
EIGEN_DOUBLE_PACKET_FUNCTION(tanh, Packet2d)

EIGEN_FLOAT_PACKET_FUNCTION(atanh, Packet4f)
EIGEN_FLOAT_PACKET_FUNCTION(log, Packet4f)
EIGEN_FLOAT_PACKET_FUNCTION(log2, Packet4f)
EIGEN_FLOAT_PACKET_FUNCTION(tanh, Packet4f)

template <>
EIGEN_STRONG_INLINE EIGEN_DEVICE_FUNC EIGEN_UNUSED Packet2d patan<Packet2d>(const Packet2d& _x) {
  return generic_patan(_x);
}

template <>
EIGEN_STRONG_INLINE EIGEN_DEVICE_FUNC EIGEN_UNUSED Packet4f patan<Packet4f>(const Packet4f& _x) {
  return generic_patan(_x);
}

}  // end namespace internal

}  // end namespace Eigen

#endif  // EIGEN_MATH_FUNCTIONS_LSX_H
