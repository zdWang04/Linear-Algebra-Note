#import "@preview/theorion:0.6.0": *
#import cosmos.fancy: *

= 线性映射

== 向量空间的线性映射

=== 定义和例子

#definition[线性映射][
    线性映射两个向量空间之间的函数$T : V -> W$，满足如下特性

    - $T(u + v) = T u + T v, forall u,v in U$
    - $T(lambda v) = lambda T(v), forall lambda in FF, v in V$

    从$V$到$W$的所有线性映射组成的集合记作$cal(L)(V, W)$，特别的，如果$W = V$则记作$cal(L)(V, V)$或$cal(L)(V)$
]

#example[线性映射][
    1. 零映射\
        $0: V -> W, 0v = 0 in W$，等式右边的$0$是$W$中的加法单位元
    2. 恒等映射\
        $I: V->V, forall v in V, I v = v in V$
    3. 微分\
        $D in cal(L)(cal(P)(RR)),forall p in cal(P)(RR), D p = p'$，显然有
        $
               D (p + q) & = p' + q' \
            D (lambda p) & = lambda D p = lambda p'
        $
    4. 积分\
        $T in cal(L)(cal(P)(RR), RR), T p = integral_(0)^1 p$
    5. 乘以$x^2$\
        $T in cal(L)(cal(RR)), (T p)(x) = x^2 p(x)$
    6. 位移\
        $T in cal(L)(FF^infinity), T (x_1,x_2,x_3,...) = (x_2, x_3, ...)$
    7. 从$FF^n$到$FF^m$\
        $m, n in ZZ^+$，$A_(j, k) in FF, j = {1,...,m}, k = {1,...,n}, T in cal(L)(FF^n, FF^m)$，映射定义为
        $
            T vec(x_1, ..., x_n) = vec(A_(1,1)x_1 + ... + A_(1, n)x_n, ..., A_(m,1)x_1 + ... + A_(m, n)x_n)
        $
    8. 复合\
        给定$q in cal(P)(RR), T in cal(L)(cal(P)(RR))$，就有
        $
            (T p)(x) = p compose q
        $
]

#lemma[线性映射引理][
    $v_1,...,v_n$是$V$的基，$w_1,...,w_n in W$，唯一存在一个线性映射$T: V->W$满足
    $
        T v_k = w_k, forall k in {1,...,n}
    $
]
#proof[
    假设存在一个映射$T:V->W$满足
    $
        T(c_1 v_1 + c_n v_n) = c_1 w_1 + ... + c_n w_n
    $由于$v_1,...,v_n in V, w_1, ... w_n in W$，所以这确实是$V->W$的映射，任选$c_k = 1$，其他系数为$0$，就有$T v_k = w_k$，任选$u = a_1 v_1 + ... a_n v_n, v = c_1 v_1 + ... c_n v_n$，那么就有
    $
        T(u + v) & = T((a_1 + c_1)v_1 + ... + (a_n + c_n)v_n) \
                 & = (a_1 + c_1)w_1 + ... + (a_n + c_n)w_n \
                 & = (a_1 w_1 + ... + a_n w_n) + (c_1 w_1 + ... + c_n w_n) \
                 & = T u + T v
    $$lambda in FF$，那么就有
    $
        T(lambda v) & = T(lambda c_1 v_1 + ... + lambda c_n v_n) \
                    & = lambda c_1 w_1 + ... + lambda c_n w_n \
                    & = lambda (c_1 w_1 + ... + c_n w_n) \
                    & = lambda T v
    $因此$T$是一个线性映射

    接下来证明唯一性，取$T in cal(L)(V, W)$，满足$T v_k = w_k$，那么就有$T(c_k v_k) = c_k T(v_k) = c_k w_k$，接着有
    $
        T(c_1 v_1 + ... + c_n v_n) = c_1 w_1 + ... + c_n w_n
    $所以$T$被$v_1,...,v_n$所唯一确定
]

=== 线性映射空间上的运算

#definition[$cal(L)(V, W)$上的加减法][
    $S, T in cal(L)(V,W), lambda in FF$，那么定义
    $
           (S + T)(v) & = S v + T v \
        (lambda S)(v) & = lambda (S v)
    $
]

#lemma[
    $cal(L)(V,W)$也是向量空间
]

#definition[线性映射的乘积是复合][
    $T in cal(L)(U, V), S in cal(L)(V, W)$，定义$S T in cal(L)(U, W)$为
    $
        (S T)(u) = S(T u)
    $
]

#property[线性映射乘积的代数运算][
    + $(T_1 T_2)T_3 = T_1 (T_2 T_3)$
    + $T I = I T = T$，两个恒等映射不一样
    + $(S_1 + S_2)T = S_1 T + S_2 T$
    + $S(T_1 + T_2) = S T_1 + S T_2$
]

#corollary[
    $T in cal(L)(V,W), T(0) = 0$
]
#proof[
    $T(0) = T(0 + 0) = T(0) + T(0) => T(0) = 0$
]


== 零空间和值域























#pagebreak()
