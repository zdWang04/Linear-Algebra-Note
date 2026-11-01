#import "@preview/theorion:0.6.0": *
#import "../../utils/utils.typ": (
    appendix-heading-numbering, make_appendix_corollary,
    make_appendix_definition, make_appendix_lemma, make_appendix_property,
    make_appendix_theorion,
)

#counter(heading).update(0)
#set heading(numbering: appendix-heading-numbering("A"))
#set-theorion-numbering("A.1")

= 速查表

== 定义

#make_appendix_definition

== 定理

#make_appendix_theorion

== 引理

#make_appendix_lemma

== 推论

#make_appendix_corollary

== 性质

#make_appendix_property

#pagebreak()
