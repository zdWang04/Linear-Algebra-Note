#import "@preview/theorion:0.6.0": *
#import cosmos.fancy: *

#import "../../utils/symbols.typ": *

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

#pagebreak()

== 零空间和值域

=== 零空间和单射

#definition[零空间(null space)][
    $T in cal(L)(V,W)$，定义$T$的零空间为
    $
        nullspace T := {v in V: T v = 0, 0 in W}
    $

    $nullspace T$是$V$的子集，有时也称之为核空间
]

#example[一些零空间][
    + $T: V->W$是零映射，易有$forall v in V, T v = 0$，那么$nullspace T = V$
    + $D in cal(L)(cal(P)(RR)), D p = p'$是微分映射，那么
        $
            nullspace D = {D p = p' = 0: forall p in cal(P)(RR)}
        $也即所有常数函数的集合
    + $T in cal(L)(cal(P)(RR)), T p = x^2 p, (T p)(x) = x^2p(x)$，那么
        $
            nullspace T = {x^2p(x) = 0, forall x in RR: forall p in cal(P)(RR)} = {0}
        $
]

#proposition[零空间是定义域的子空间][
    $T in cal(L)(V,W)$，那么$nullspace T$是$V$的子空间
]
#proof[
    由于$T$是线性映射，那么$T(0) = 0$

    任取$u,v in nullspace T$，由定义就有
    $
        T(u+v) = T(u) + T(v) = 0
    $任取$lambda in FF$，就有
    $
        T(lambda v) = lambda T(v) = lambda 0 = 0
    $这说明$forall u, v in nullspace T, forall lambda in FF, (u+v), lambda v in nullspace T$，有加法单位元，对加法和标量乘法封闭，而且易知$nullspace T$是$V$的子集，所以$nullspace T$是$V$的子空间
]

#definition[单射(injective)][
    $T:V->W$称作是单射，当且仅当$T u = T v => u = v$
]

#proposition[
    $T in cal(L)(V,W)$，$T$是单射，当且仅当$nullspace T = {0}$
]<proposition:injective-nullspace-test>
#proof[
    + $=>$\
        $T$是单射，那么$T v = 0$只有唯一一个$v$成立，易知$v = 0$，那么$nullspace T = {0}$

    + $arrow.double.l$\
        $nullspace T = {0} =>exists! v = 0, T v = 0$，任取$u, v in V$，使之满足$T u = T v$，那么就有
        $
            T u - T v = T(u - v) = 0
        $于是就有
        $
            u - v = 0 => u = v
        $所以$T$是单射
]

=== 值域和满射

#definition[值域(range)][
    $T in cal(L)(V, W)$，定义$T$的值域为
    $
        range T = {T v: v in V}
    $$range T$是$W$的子集
]

#example[一些值域][
    + $T:V->W$是零映射，$range T = {T v = 0: v in V} = {0}$
    + $D in cal(L)(cal(P)(RR)), D p = p'$，那么$range D = {p' : p in cal(P)(RR)}$，由于多项式函数的导数仍然是一个多项式函数，所以$range D = cal(P)(RR)$
]

#proposition[值域是一个子空间][
    $T in cal(L)(V,W)$，那么$range T$是$W$的子空间
]
#proof[
    由值域的定义易知$range T subset.eq W$，并且有$T(0) = 0$，任取$u, v in V, lambda in FF$满足$T(u) = w_1, T(v) = w_2$，就有
    $
         w_1 + w_2 & = T(u) + T(v) = T(u + v) in range T \
        lambda w_1 & = lambda T(u) = T(lambda u) in range T
    $于是$range T$是$W$的一个子空间
]

#definition[满射(surjective)][
    $T in cal(L)(V,W)$称作是满射的，当且仅当$range T = W$
]

=== 线性映射基本定理

#theorem[线性映射基本定理][
    $V$是有限维向量空间，$T in cal(L)(V,W)$，那么$range T$也是有限维的，且有
    $
        dim V = dim nullspace T + dim range T
    $
]<theorem:linear-mapping-fundamental-theorem>
#proof[
    $u_1,...,u_m$是$nullspace T$的基，那么$dim nullspace T = m$，那么可以将线性无关列表$u_1,...,u_m$扩充为$V$的基
    $
        u_1,...,u_m, v_1,...,v_n
    $那么$dim V = m + n$，那么需要证明$dim range T = n$

    任选$v in V$，那么有
    $
        v = a_1 u_1 + ... + a_m u_m + b_1 v_1 + ... + b_n v_n
    $于是有
    $
        T v & = a_1 T(u_1) + ... + a_m T(u_m) + b_1 T(v_1) + ... + b_n T(v_n) \
            & = 0 + ... + 0 + 0 + b_1 T(v_1) + ... + b_n T(v_n) \
            & = b_1 T(v_1) + ... + b_n T(v_n)
    $可以看到$v_1,...,v_n$张成了$range T$，接下来需要证明$v_1,...,v_n$是线性无关的

    令
    $
        c_1 T(v_1) + ... + c_n T(v_n) = 0 => T(c_1 v_1 + ... + c_n v_n) = 0
    $这说明$c_1 v_1 + ... + c_n v_n in nullspace T$，于是该向量也可以被写为$u_1,...,u_m$的线性表示，于是有
    $
        c_1 v_1 + ... + c_n v_n = d_1 u_1 + ... + d_m u_m
    $又因为$v_1,...,v_n, u_1,...,u_m$是$V$的基，因而是线性无关的，所以就有$c_1 = ...=c_n = d_1 = ... = d_m = 0$，这说明$v_1,...,v_n$是线性无关的，所以也是$range T$的基

    综上就有
    $
        dim V = dim nullspace T + dim range T
    $
]

#corollary[向低维映射的线性映射一定不是单射][
    $dim V > dim W$，那么$forall T in cal(L)(V, W), T$不是单射
]
#proof[
    $forall T in cal(L)(V, W)$，根据@theorem:linear-mapping-fundamental-theorem 就有
    $
        dim V = dim nullspace T + dim range T => dim nullspace T = dim V - dim range T
    $由于$range T$是$W$的子空间，就有$dim range T <= dim W$，于是就有
    $
        dim nullspace T >= dim V - dim W > 0
    $所以$nullspace T$中不只有$0$，由@proposition:injective-nullspace-test 可知$T$不是单射
]


#corollary[向高维映射的线性映射一定不是满射][
    $dim V < dim W$，那么$forall T in cal(L)(V,W), T$不是满射
]
#proof[
    任选$T in cal(F)(V, W)$，根据@theorem:linear-mapping-fundamental-theorem 就有
    $
        dim V = dim nullspace T + dim range T => dim range T = dim V - dim nullspace T
    $于是接着有
    $
        dim range T <= dim V <= dim W
    $于是$range T != W$，因此$T$不是满射
]

#proposition[变量数比方程数多的线性齐次方程组肯定有非零解]
#proof[
    考虑某个有$n$个未知数，$m$个方程的线性齐次方程组
    $
        sum_(k=1)^n A_(1,k) x_k & = 0 \
                                & ... \
        sum_(k=1)^n A_(m,k) x_k & = 0 \
    $
    写为线性映射的形式
    $
        T vec(x_1, ..., x_n) = vec(sum_(k=1)^n A_(1,k) x_k, ..., sum_(k=1)^n A_(m,k) x_k) = vec(0, ..., 0) in FF^m
    $由于变量数比方程数多，那么$n > m$，所以$T$是一个向低维映射的线性映射，所以$T$一定不是单射，也即$exists v !=0, v in nullspace T$，所以方程组$T(x) = 0$一定有非零解
]

#proposition[方程数比变量数更多的非齐次线性方程组并不总有解]
#proof[

    考虑某个有$n$个未知数，$m$个方程的非齐次线性方程组
    $
        sum_(k=1)^n A_(1,k) x_k & = c_1 \
                                & ... \
        sum_(k=1)^n A_(m,k) x_k & = c_m \
    $
    写为线性映射的形式
    $
        T vec(x_1, ..., x_n) = vec(sum_(k=1)^n A_(1,k) x_k, ..., sum_(k=1)^n A_(m,k) x_k) = vec(c_1, ..., c_m) in FF^m
    $
    由于方程数多于变量数，那么$n < m$，所以$T$是一个向高维映射的线性映射，所以$T$不是满射，于是$exists c in FF^m, c in.not range T$
]

#note-block[*TODO* 尝试完成习题3B 7\~33]
#pagebreak()

== 矩阵


#pagebreak()
