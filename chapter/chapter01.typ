#import "@preview/euler-math:0.1.0": *
#import "../utils/utils.typ": *

= 向量空间

== $R^n$和$C^n$

=== 复数

#definition[复数的定义][
  复数是一个有序对$(a, b) in RR times RR$组成的，写作$a + b i$，所有复数的集合记作$CC = {a+b i: (a, b) in RR times RR}$
]

#definition[复数加法和乘法][
  $a, b, c, d in RR$
  $
    & (a + b i)+(c + d i) = (a + c) + (b + d)i \
    & (a + b i)(c + d i) = (a c - b d) + (a d + b c)i \
  $
]

#definition[$i^2=-1$]

#theorem[复数代数运算][
  $alpha, beta, lambda in CC$
  + 交换律$alpha + beta = beta + alpha$
  + 加法结合律$alpha + (beta + lambda) = (alpha + beta) + lambda$
  + 乘法结合律$(alpha beta) lambda= alpha (beta lambda)$
  + 单位元$lambda + 0 = lambda, lambda 1 = lambda$
  + 加法的逆$forall alpha in CC, exists beta in CC, alpha + beta = 0$
  + 乘法的逆$forall alpha in CC and alpha != 0, exists beta in CC, alpha beta = 1$
  + 分配率$lambda (alpha + beta) = lambda alpha + lambda + beta$
]
