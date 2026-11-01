#import "@preview/theorion:0.6.0": *
#import cosmos.fancy: *

= 有限维向量空间

== 张成和线性无关

#note-block[
    接下来一般将没有括号包裹的多个向量记作向量列表，如
    $
        v_1, ..., v_k, ..., v_m
    $
    是一个向量列表，向量列表的说法隐含了这是有限个向量（在上面的例子中有$m$个），同时如无特殊说明，一个向量列表中的所有向量均来自同一个向量空间
]

#definition[线性组合][
    $v_1,...,v_m in V$，这个向量列表的线性组合定义为：
    $ a_1 v_1 + ... + a_m v_m $其中$a_1,...,a_m in FF$
]

#definition[张成空间][
    $v_1,...,v_m in V$，定义该向量列表张成的空间为
    $
        "span"(v_1,...,v_m) = {a_1 v_1+...+a_m v_m: a_1,...,a_m in FF}
    $
    同时规定：$"span"() := "span"(emptyset) := {0}$
]<def:span>

#corollary[张成空间是最小的包含子空间][
    $v_1,...,v_m in V$，那么$"span"(v_1,...,v_m)$是$V$中包含向量$v_1,...,v_m$的最小子空间
]
#proof[
    1. 易知$ forall 1<=k<=m, v_k = a_1 v_1 + ... +a_k v_k + ...+ a_m v_m $
        其中$a_1 = ...=a_(k-1) = a_(k+1) = ...=a_m = 0, a_k = 1$，所以张成空间确实包含所有向量

    2. 当$a_1 = ...=a_m = 0$时，$a_1 v_1 + ... a_m v_m = 0$，所以张成空间中有$0$

        同时张成空间任意元素$u, v$，有
        $
            u = a_1 v_1 + ... + a_m v_m\
            w = b_1 v_1 + ... + b_m v_m\
        $所以
        $
            u + w = (a_1 + b_1)v_1 + ... (a_m + b_m)v_m in "span"(v_1,...,v_m)
        $
        此外$forall lambda in FF, u in "span"(v_1,...,v_m)$，就有
        $
                   u & = a_1 v_1 + ... + a_m v_m \
            lambda u & =lambda a_1 v_1 + ... +lambda a_m v_m
        $其中$lambda a_1,...,lambda a_m in FF$，所以$lambda u in "span"(v_1,...,v_m)$

        综上，$"span"(v_1,...,v_m)$是$V$的一个子空间

    3. 由于子空间对加法和标量乘法封闭，所以每一个包含$v_1,...,v_m$的子空间也包含$"span"(v_1,...,v_m)$，因此$"span"(v_1,...,v_m)$是最小的包含子空间
]
#remark[
    上面证明了(1)张成空间也是一个子空间，(2)张成空间包含所有张成它的向量，(3)张成空间是包含这些向量的最小的子空间
]

#definition[张成][
    如果$V = "span"(v_1,...,v_m)$，那么称$v_1,...,v_m$张成了$V$
]

#remark[
    此处的张成是一个动词，可以理解为一种构造法则，这个法则的构造结果则是@def:span 中的张成空间
]

#definition[有限维向量空间][
    若一个向量空间可以由其中有限个向量张成，则称它为有限维向量空间。
]

#definition[多项式][
    + 一个函数$p: FF->FF$称作是以$FF$为系数的多项式，当且仅当存在$a_0,...,a_m in FF$，满足
        $
            p(z) = a_0 + a_1 z + a_2 z^2 + ... + a_m z^m, forall z in FF
        $
    + 将所有以$FF$为系数的多项式函数的集合记作$cal(P)(FF)$
]

#tip-block[
    $cal(P)(FF)$是一个在$FF$上的向量空间，同时也是$FF^FF$的子空间
]

#definition[多项式的度数][
    + $p in cal(P)(FF)$，称$p$的度数为$m$，当且仅当存在系数$a_1,...,a_m in FF and a_m != 0$，满足
        $
            p = a_0 + a_1 z + ... + a_m z^m, forall z in FF
        $
    + 多项式$p$的度数记作$deg p$
    + 规定：$deg 0 = -infinity$
]

#definition[度数最多为$m$的多项式集合][
    $m$为非负整数，定义度数最多为$m$的多项式集合为：
    $
        cal(P)_m (FF) := {p in cal(P)(FF): deg p <= m}
    $
]

#definition[无穷维向量空间][
    一个向量空间被称作是无穷维的，当且仅当该向量空间不是有限维度的
]

#example[$cal(P)(FF)$是无穷维的]
#proof[
    假设$cal(P)(FF)$是有限维度的，令$m$为其最高度数，但是有
    $
        z^(m+1) = 0 + 0 z + ... + 0 z^m + z^(m+1)
    $于是$z^(m+1) in cal(P)(FF)$，那么$cal(P)(FF)$最高度数为$m+1$，矛盾，所以$cal(P)(FF)$是无穷维的
]

#definition[线性无关][
    $v_1,...,v_m in V$被称作是线性无关的，当且仅当满足
    $
        a_1 v_1 + ... + a_m v_m = 0 => forall 1<=k<=m, a_k = 0
    $
]

#definition[线性相关][
    $v_1,...,v_m in V$被称作是线性相关的，当且仅当满足
    $
        exists 1<=k<=m, a_k != 0, a_1 v_1 + ... + a_m v_m = 0
    $
]

#lemma[线性相关引理][
    $v_1,...,v_m in V$是线性相关的，那么存在$1<=k<=m$，满足
    $
        v_k in "span"(v_1,...,v_(k-1))
    $

    进一步的，如果$k$满足上述条件，那么有$"span"(v_1,...,v_(k-1),v_(k+1),...,v_m) = "span"(v_1,...,v_m)$
]<lem:linear-dependent>
#proof[
    由于$v_1,...,v_m in V$是线性相关的，那么存在$1<=k<=m$，使得$a_k != 0$，并且满足
    $
        a_1 v_1 + ... + a_m v_m = 0
    $
    记$k$为满足$a_k!=0$的最大角标，因此$a_(k+1) = ... = a_m = 0$，所以就有
    $
        & a_1 v_1 + ... + a_k v_k = 0, a_k != 0 \
        & => v_k = -(a_1)/(a_k) v_1 - ... - a_(k-1)/a_k v_(k-1)
    $这说明$v_k in "span"(v_1,...,v_(k-1))$

    由于$v_k in "span"(v_1,...,v_(k-1))$，那么有一组系数$b_1,...,b_(k-1) in FF$，满足
    $
        v_k = b_1 v_1 + ... + b_(k-1)v_(k-1)
    $

    任取元素$w in "span"(v_1,...,v_m)$，有一组系数$a_1,...,a_m$满足
    $ w = a_1 v_1 + ... + a_m v_m $将$v_k$代入就有
    $
        w = (a_1 + b_1)v_1 + ... + (a_(k-1) + b_(k-1))v_(k-1) + a_(k+1)v_(k+1) + ... + a_m v_m
    $这说明$forall v_k in "span"(v_1,...,v_m) => v_k in "span"(v_1,...,v_(k-1),v_(k+1),...,v_m)$

    另一方面，对于任意$w in "span"(v_1,...,v_(k-1),v_(k+1),...,v_m)$，显然可以写成$v_1,...,v_m$的线性组合，所以就有
    $
        "span"(v_1,...,v_(k-1),v_(k+1),...,v_m) = "span"(v_1,...,v_m)
    $
]
#note-block[
    注意当$k=1$时，$v_1 in "span"(emptyset) => v_1 = 0$，所以也有$"span"(0) = {0} = "span"(emptyset)$，因此和证明的结论没有不一致的地方，只不过当$k=1$时需要修改证明
]

#corollary[线性无关列表的长度小于等于张成列表的长度][
    $u_1,...,u_m in V$线性无关，$"span"(w_1,...,w_n) = V$，那么总有$m <= n$
]<coro:dependent-len-less-span-len>
#proof[
    $u_1,...,u_m$线性无关，所以$forall i, u_i != 0$，定义一个新列表
    $
        u_1, w_1,...,w_n
    $由于$w_1,...,w_n$张成了$V$，那么新列表是线性相关的，此外$u_1 != 0$，且前面没有任何元素，由@lem:linear-dependent 可以移除某个$w_1,...,w_n$中的元素，剩下的列表也可以张成$V$，此时该列表长度仍为$n$

    重复以上过程$k$次，就有新列表前面部分为$u_1,...,u_k$，后面为移除后的剩余的$w_1,...,w_n$中的元素，此时长度仍然为$n$
    $
        u_1,...,u_k, "some w_i"
    $

    重复到第$m$次后，所有的$u_1,...,u_m$被放入了新列表，也移除了$m$个$w_i$元素，@lem:linear-dependent 总保证新列表也是张成$V$的，如果此时没有$w_i$留下，则$m = n$，如果还有$w_i$留下，就有$m < n$，总之$m <= n$
]
#note-block[
    上面的证明是一个直观说法
]

#corollary[有限维向量空间的子空间是有限维的]
#proof[
    $V$是有限维向量空间，$U$是$V$的子空间

    + 如果$U = {0}$，那么显然是有限维的，如果$U != {0}$，那么取$u_1 in U and u_1 != 0$
    + 如果$U = "span"(u_1,...,u_(k-1))$，那么显然是有限维的，如果$U != "span"(u_1,...,u_(k-1))$，那么取$u_k in U, u_k in.not "span"(u_1,...,u_(k-1))$
    + 重复以上过程，不断向向量列表中添加向量，并保持线性无关，由于@coro:dependent-len-less-span-len ，线性无关列表的长度总小于等于张成列表的长度，而张成列表长度是有限的，所以线性无关列表的长度也有限，这个线性无关列表总会增长到可以张成$U$为止，于是$U$也是有限维的.
]

#note-block[
    这个证明也只是一个直观说法
]

== 基
#definition[基][
    向量列表$v_1,...,v_m$称作是$V$的基，当且仅当
    + $"span"(v_1,...,v_m) = V$
    + $v_1,...,v_m$线性无关
]

#lemma[基的判断条件][
    $v_1,...,v_m$是$V$的基，当且仅当对于任意$v in V$，存在唯一一组系数$a_1,...,a_m in FF$，满足
    $
        v = a_1 v_1 + ... + a_m v_m
    $
]
#proof[
    + $=>$\
        任取$v in V$，由于$v_1,...,v_m$是$V$的基，那么就有
        $ v = a_1 v_1 + ... + a_m v_m $假设$v$还可表示为
        $ v = b_1 v_1 + ... + b_m v_m $于是
        $
            v - v = 0 = (a_1 - b_1)v_1+...+(a_m - b_m)v_m
        $由于$v_1,...,v_m$线性无关，所以$forall 1<=i<=m, a_i = b_i$，也即任意$v in V$，其表示是唯一的
    + $arrow.double.l$\
        如果任意$v in V$可以被$v_1,...,v_m$唯一表示，那么$"span"(v_1,...,v_m) = V$，特别的，当$v = 0$时就有
        $
            0 = a_1 v_1 + ... + a_m v_m
        $这意味这$v_1 = ... = v_m = 0$，于是$v_1,...,v_m$是线性无关的，所以$v_1,...,v_m$是$V$的一个基
]
#pagebreak()
#corollary[每个张成列表都包含基][
    每个向量空间的张成列表都可以约化为向量空间的基
]<coro:span-contains-bases>
#proof[
    $v_1,...,v_m$是$V$的张成列表，$v_1,...,v_n$是$V$的一个基由@coro:dependent-len-less-span-len ，$n <= m$，所以可以不断移除张成列表中的元素直至长度为$n$，此时剩余的向量列表是线性无关的，且张成$V$，所以是一个基
]
#note-block[
    只是一个直观说法
]

#corollary[每个有限维向量空间都有基]
#proof[
    由定义知，有限维向量空间总有有限长度的张成列表，由@coro:span-contains-bases 可知基一定存在于张成列表中，得证
]

#corollary[线性无关集可以扩展为基][
    有限维向量空间的每个线性无关列表都可以被扩展为该向量空间的一个基
]<coro:linear-independent-extend-base>
#proof[
    $v_1,...,v_n$是线性无关列表，$w_1,...,w_m$是张成列表，构造新列表
    $
        v_1,...,v_n,w_1,...,w_m
    $易知新列表张成$V$，利用@coro:span-contains-bases 可知其中一定包含$V$一个基，得证

]

#theorem[每个$V$的子空间是产生$V$的直和的一部分][
    $V$是一个有限维向量空间，$U$是$V$的子空间，那么存在子空间$W$，满足
    $
        U xor W = V
    $
]
#proof[
    $U$是$V$的子空间，令其基为$u_1,...,u_m$，这是线性无关的，由@coro:linear-independent-extend-base ，可以将其扩展为$V$的一个基，扩展后的新列表为
    $
        u_1,...,u_m,w_1,...,w_n
    $其中$W = "span"(w_1,...,w_n)$，那么任意$v in V$就有
    $
        v & = a_1 u_1 + ... a_m v_m + b_1 w_1 + ... b_n w_n \
          & = u + w
    $其中$u in U, w in W$，所以$V = W + U$，接下来证明$W inter U = {0}$，取$v in U inter W$，就有
    $
        & v = a_1 u_1 + ... a_m u_m \
        & v = b_1 w_1 + ... b_n w_n \
        & => a_1 u_1 + ... + a_m u_m - b_1 w_1 - ... - b_n w_n = 0
    $由于$u_1,...,u_m,w_1,...,w_n$是$V$的一个基，那么$a_1 = ... = a_m = b_1 = ... = b_n = 0$，于是$v = 0 => U inter W = {0}$

    综上，确实存在子空间$W$与$U$的直和构成向量空间$V$
]

#remark[
    这个定理说明，可以将一个向量空间拆分为若干子空间的和
]

== 维度
#definition[维度][
    有限维向量空间$V$的维度为$n$，当且仅当其基列表长度为$n$，记作$dim V = n$
]

#lemma[子空间的维度][
    如果$U$是有限维向量空间$V$的子空间，那么$dim U <= dim V$
]
#proof[
    $U subset.eq V$，那么$U$的基列表是$V$中的一个线性无关列表，由@coro:dependent-len-less-span-len 可知，这个线性无关列表的长度小于等于$V$的张成列表的长度，而$V$的基正是一个张成列表，于是就有$dim U <= dim V$
]

#proposition[
    $V$是有限维向量空间，$V$中每一个长度为$dim V$的线性无关列表都是$V$的一组基
]<proposition:linear-independent-dimV-is-bases>
#proof[
    假设$dim V = n$，$v_1,...,v_n$是$V$中的一组线性无关向量，由@coro:linear-independent-extend-base 可知，这组向量可以扩展为$V$的基，但是由于长度已经为$n$了，而且由@coro:dependent-len-less-span-len 可知不可能大于$dim V$，那么$v_1,...,v_n$只能是$V$的一组基
]

#proposition[
    $V$是有限维向量空间，$U$是$V$的子空间，如果$dim U = dim V$，那么有$U = V$
]
#proof[
    假设$dim U = n$，$u_1,...,u_n$是$U$的一组基，那么这组线性无关向量也是$V$中的一组线性无关列表，并且由于$dim U = dim V$，那么由@proposition:linear-independent-dimV-is-bases 可知$u_1,...,u_n$也是$V$的基，那么就有$U = V$
]

#proposition[
    $V$是有限维向量空间，每个长度为$dim V$的张成集都是$V$的一组基
]
#proof[
    假设$dim V = n$，$v_1,...,v_n$张成$V$，那么由@coro:span-contains-bases 可知$v_1,...,v_n$可以被约化为$V$的一组基，然而$V$的基列表长度为$n$，和该张成集等长，无法再约化，$v_1,...,v_2$只能是$V$的一组基地
]

#proposition[
    $V_1, V_2$都是有限维向量空间，那么有
    $
        dim(V_1 + V_2) = dim V_1 + dim V_2 - dim(V_1 inter V_2)
    $
]
#proof[
    令$V_1 inter V_2$的基是$v_1,...,v_n$，由于$V_1 inter V_2 subset.eq V_1, V_2$，那么$v_1,...,v_2$是$V_1, V_2$中的一个线性无关集合，将其分别扩充为$V_1, V_2$的基，令$dim V_1 = n + j$，于是$v_1,...,v_n, w_1,...,w_j$是$V_1$的基；令$dim V_2 = n + k$，于是$v_1,...,v_n, u_1,...,u_k$是$V_2$的基，接下来需要证明
    $
        w_1,..., w_j, v_1,..., v_n, u_1, ..., u_k
    $是$V_1 + V_2$的基

    显然上述向量列表可以张成$V_1 union V_2$，进而也可以张成$V_1 + V_2$，还需证明是线性无关的，令线性组合为$0$，就有
    $
        a_1 w_1 + ... + a_j w_j + b_1 v_1 + ... + b_n v_n + c_1 u_1 + ... + c_k u_k = 0
    $于是
    $
        a_1 w_1 + ... + a_j w_j = -(b_1 v_1 + ... + b_n v_n + c_1 u_1 + ... + c_k u_k)
    $那么说明
    $
        a_1 w_1 + ... + a_j w_j in V_1 and a_1 w_1 + ... + a_j w_j in V_2 => a_1 w_1 + ... + a_j w_j in V_1 inter V_2
    $于是可以被表示为$v_1,...,v_n$的线性组合，也即
    $
        a_1 w_1 + ... + a_j w_j = d_1 v_1 + ... + d_n v_n
    $$w_1,...w_j,v_1,...,v_n$是$V_1$的基，那么是线性无关的，也即
    $
        a_1 = ... = a_j = 0 = d_1 =...=d_n
    $这说明
    $
        b_1 v_1 + ... b_n v_n + c_1 u_1 + ... + c_k u_k = 0
    $同时$v_1,...,v_n, u_1,...,u_k$是$V_2$的基，因此是线性无关的，所以就有
    $
        b_1 = ... = b_n = c_1 = ... = c_k = 0
    $综上，$w_1,..., w_j, v_1,..., v_n, u_1, ..., u_k$线性无关，是$V_1 + V_2$的基

    于是就有
    $
        dim(V_1 + V_2) & = j + n + k \
                       & = j + n + k + n - n \
                       & = dim(V_1) + dim(V_2) - dim(V_1 inter V_2)
    $
]

#note-block[
    集合与向量空间有许多可以类比的地方
    #figure(
        image("../../assets/chap2_set_vectorspace_comparison.png"),
        caption: "集合-向量空间概念对比",
    )
]










#pagebreak()
