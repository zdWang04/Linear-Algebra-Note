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
    $ u = a_1 v_1 + ... + a_m v_m\
    w = b_1 v_1 + ... + b_m v_m\ $所以
    $
      u + w = (a_1 + b_1)v_1 + ... (a_m + b_m)v_m in "span"(v_1,...,v_m)
    $
    此外$forall lambda in FF, u in "span"(v_1,...,v_m)$，就有
    $        u & = a_1 v_1 + ... + a_m v_m \
    lambda u & =lambda a_1 v_1 + ... +lambda a_m v_m $其中$lambda a_1,...,lambda a_m in FF$，所以$lambda u in "span"(v_1,...,v_m)$

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
  $ z^(m+1) = 0 + 0 z + ... + 0 z^m + z^(m+1) $于是$z^(m+1) in cal(P)(FF)$，那么$cal(P)(FF)$最高度数为$m+1$，矛盾，所以$cal(P)(FF)$是无穷维的
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
  $ & a_1 v_1 + ... + a_k v_k = 0, a_k != 0 \
  & => v_k = -(a_1)/(a_k) v_1 - ... - a_(k-1)/a_k v_(k-1) $这说明$v_k in "span"(v_1,...,v_(k-1))$

  由于$v_k in "span"(v_1,...,v_(k-1))$，那么有一组系数$b_1,...,b_(k-1) in FF$，满足
  $
    v_k = b_1 v_1 + ... + b_(k-1)v_(k-1)
  $

  任取元素$w in "span"(v_1,...,v_m)$，有一组系数$a_1,...,a_m$满足
  $ w = a_1 v_1 + ... + a_m v_m $将$v_k$代入就有
  $ w = (a_1 + b_1)v_1 + ... + (a_(k-1) + b_(k-1))v_(k-1) + a_(k+1)v_(k+1) + ... + a_m v_m $这说明$forall v_k in "span"(v_1,...,v_m) => v_k in "span"(v_1,...,v_(k-1),v_(k+1),...,v_m)$

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
]<lem:dependent-len-less-span-len>
#proof[
  $u_1,...,u_m$线性无关，所以$forall i, u_i != 0$，定义一个新列表
  $ u_1, w_1,...,w_n $由于$w_1,...,w_n$张成了$V$，那么新列表是线性相关的，此外$u_1 != 0$，且前面没有任何元素，由@lem:linear-dependent 可以移除某个$w_1,...,w_n$中的元素，剩下的列表也可以张成$V$，此时该列表长度仍为$n$

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
  + 重复以上过程，不断向向量列表中添加向量，并保持线性无关，由于@lem:dependent-len-less-span-len ，线性无关列表的长度总小于等于张成列表的长度，而张成列表长度是有限的，所以线性无关列表的长度也有限，这个线性无关列表总会增长到可以张成$U$为止，于是$U$也是有限维的.
]

#note-block[
  这个证明也只是一个直观说法
]

== 基


#pagebreak()
