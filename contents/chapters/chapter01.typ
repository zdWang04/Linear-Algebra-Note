#import "@preview/theorion:0.6.0": *
#import cosmos.fancy: *

= 向量空间

== $RR^n$和$CC^n$

#note-block[
  本节内容略去，有关复数与实数的代数性质，以及$n$-元组（本书称之为列表）的内容可以在任何一本实分析中找到
]

== 向量空间的定义

#definition[加法和标量乘法][
  对于一个集合$V$，定义
  + 加法：$+ : V times V -> V$，记作$u + v$
  + 标量乘法：$* : FF times V -> V$，记作$lambda v$
]

#definition[向量空间][
  一个配备了加法和标量乘法的集合$V$被称作向量空间，当且仅当满足：
  + 加法交换律：$u + v = v + u forall u, v in V$
  + 结合律：$(u + v) + w = u + (v + w),(a b)v = a (b v), forall u,v,w in V, forall a, b in FF$
  + 加法单位元：$exists 0 in V, forall v in V, v + 0 = v$
  + 加法逆元：$forall v in V, exists w in V, v + w = 0$
  + 乘法单位元：$forall v in V, 1 v = v$
  + 分配率：$a(u + v) = a u + a v, (a + b)u = a u + b u, forall a, b in FF, forall u, v in V$
]

#definition[点与向量][
  向量空间的中的元素成为点或向量
]

#definition[实/复向量空间][
  + 定义在$RR$上的向量空间为实向量空间
  + 定义在$CC$上的向量空间为复向量空间
]

#example[函数空间][
  $S$是一个集合，定义$FF^cal(S) := {f | f: cal(S) -> FF }$，定义加法与标量乘为：
  + $forall f, g in FF^cal(S), (f+g)(x) = f(x) + g(x), forall x in cal(S)$
  + $forall lambda in FF, forall f in FF^cal(S), (lambda f)(x) = lambda f(x), forall x in cal(S)$

  如果$cal(S) != emptyset$，那么$FF^cal(S)$是$F$上的向量空间.
]<example-func-space>


#proof[证明@example-func-space][
  易知$forall f in FF^cal(S), forall x in cal(S), f(x) in FF$，而$FF$是一个向量空间，那么就有
  $ (f+g)(x) = f(x) + g(x) = g(x) + f(x) = (g+f)(x) $同理也有
  $
    ((f+g)+h)(x) & = (f+g)(x) +h(x) \
                 & = f(x) + g(x) +h(x) \
                 & = f(x) + (g+h)(x) = (f + (g+h))(x)
  $
  标量乘的分配率如下
  $
    ((a b)v)(x) = (a b) v(x) = a (b v(x)) = a ((b v)(x))
  $
  定义零函数为$0:cal(S) -> 0$，那么就有
  $
    forall f in FF^cal(S),forall x in cal(S), (0+f)(x) = 0(x) + f(x) = 0 + f(x) = f(x)
  $
  定义$f:cal(S)->FF$的加法逆元为$-f:cal(S)->FF$，满足$forall f in FF^cal(S), forall x in cal(S), (-f)(x) = -f(x)$，那么就有
  $
    forall f in FF^cal(S),forall x in cal(S), (-f + f)(x) = -f(x) + f(x) = -f(x) + f(x) = 0
  $
  定义单位函数为$bb(1):cal(S) -> 1$，那么有$forall f in FF^cal(S), forall x in cal(S), (bb(1) f)(x) = bb(1)(x) f(x) = f(x)$

  有了以上结果，可以推出分配率$ a(u + v)(x) & = a (u(x) + v(x)) = a u(x) + a v(x) \
    (a+b)v(x) & = a v(x) + b v(x) = (a v)(x) + (b v)(x) $
]

#remark[如果$cal(S) = emptyset$，那么$FF^cal(S)$会是的唯一元素是空函数$f:emptyset -> FF$]

#lemma[向量空间加法单位元是唯一的]<lemma:add-unit-unique>
#lemma[向量空间加法逆元是唯一的]<lemma:add-reverse-unique>

#definition[加法逆与减法][
  $v, w in V$，定义
  + $-v$为$v$的加法逆元
  + $w - v := w + (-v)$
]

#remark[@lemma:add-unit-unique 和 @lemma:add-reverse-unique 保证了向量减法是良定义的]

#pagebreak()

== 子空间


#pagebreak()
