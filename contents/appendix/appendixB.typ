#import "@preview/theorion:0.6.0": *
#import "../../utils/utils.typ": appendix-heading-numbering, notation-table

#counter(heading).update(0)
#set heading(numbering: appendix-heading-numbering("B"))
#set-theorion-numbering("B.1")

= 记号表

#notation-table((
  ([$NN$], [自然数集合]),
  ([$ZZ$], [整数集合]),
  ([$QQ$], [有理数集合]),
  ([$RR$], [实数集合]),
  ([$CC$], [复数集合]),
  ([$FF$], [实数或复数集合]),
  ([$V$], [向量空间]),
  ([$emptyset$], [空集]),
  ([$v_1,...,v_m$], [有限向量列表]),
  ([$"span"(v_1,...,v_m)$], [$v_1,...,v_m$张成的空间]),
  ([$p$], [多项式]),
  ([$cal(P)(FF)$], [定义在$FF$上的多项式的集合]),
  ([$cal(P)_m (FF)$], [度数不大于$m$的多项式集合]),
  ([$U + W$], [子空间$U$和子空间$W$的和]),
  ([$U xor W$], [子空间$U$和子空间$W$的直和]),
))

#pagebreak()
