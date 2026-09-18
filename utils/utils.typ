#import "@preview/theorion:0.6.0": *

#let make_appendix_theorion = theorion-restate(
  filter: it => it.outlined and it.identifier == "theorem",
  render: it => it.render,
)

#let make_appendix_definition = theorion-restate(
  filter: it => it.outlined and it.identifier == "definition",
  render: it => it.render,
)

#let make_appendix_corollary = theorion-restate(
  filter: it => it.outlined and it.identifier == "corollary",
  render: it => it.render,
)

#let make_appendix_lemma = theorion-restate(
  filter: it => it.outlined and it.identifier == "lemma",
  render: it => it.render,
)

#let make_appendix_property = theorion-restate(
  filter: it => it.outlined and it.identifier == "property",
  render: it => it.render,
)


#let note-cover(
  title: "",
  subtitle: none,
  author: "",
  date: datetime
    .today()
    .display(
      "[year]年[month]月[day]日",
    ),
  cover_path: "../assets/瑞鹤图.png",
) = {
  page(
    background: box(
      width: 100%,
      height: 100%,
      image(cover_path, width: 100%, height: 100%, fit: "cover"),
    ),
  )[

    #v(2.20fr)
    #align(center)[

      #text(size: 32pt, weight: "bold", fill: rgb("#f9f6ed"))[#title]

      #line(length: 40%, stroke: 2.0pt + rgb("#e5c17d"))
      #v(0.8em)

      #if subtitle != none {
        text(size: 15pt, weight: "bold", style: "italic", fill: rgb("#f9f6ed"))[#subtitle]
      }
    ]

    #align(center)[

      #grid(
        columns: 1,
        row-gutter: 0.8em,
        align: center,
        text(size: 15pt, weight: "bold", fill: rgb("#f9f6ed"))[#author #v(0.5em)],
        text(weight: "bold", size: 15pt, fill: rgb("#f9f6ed"))[#date],
      )
    ]

    #v(1.5fr)

  ]
  // pagebreak()
}
