#import "thai.typ": thai, thnum

#let gov(body) = {
  // TODO: Add comma
  set enum(numbering: n => thnum(n) + ".")
  set par(first-line-indent: 2.5cm, justify: true, leading: 0.6em)
  show par: set block(spacing: 1em)
  set page(
    "a4",
    margin: (
      top: 2.5cm,
      left: 3cm,
      right: 2cm,
      bottom: 2cm,
    ),
  )

  thai(body)
}

#let center-left(body) = {
  style(styles => {
    let size = measure(body, styles)
    align(center, move(dx: size.width/2, body))
  })
}

#let stamp(body) = {
  text(red, size: 36pt, weight: "bold", body)
}

#let govhead(
  secrecy: "",
  urgency: "",
  id: "",
  address: "",
  date: "",
  title: "",
  attention: "",
  refer-to: "",
  attachments: (),
) = thai({
  {
    grid(
      columns: (2fr, auto, 2fr),
      column-gutter: 1.2cm,

      align(left + bottom, [
        #if urgency.len() > 0 {
          block(stamp(urgency))
        }
        ที่#h(0.3cm)#thnum(id)
      ]),
      align(center + top, {
        if secrecy.len() > 0 {
          place(top + center, dy: -2em,  stamp(secrecy))
        }
        block(image("garuda.svg", height: 3cm))
      }),
      align(left + bottom, address)
    )

    v(6pt)

    // Date is aligned to Garuda's leg. We measure the center of page then go from there
    center-left({
      h(1cm)
      date
    })

    if title.len() > 0 {
      block([เรื่อง#h(0.3cm)#title])
    }

    if attention.len() > 0 {
      block([เรียน#h(0.3cm)#attention])
    }

    if refer-to.len() > 0 {
      block([อ้างถึง#h(0.3cm)#refer-to])
    }

    if attachments.len() > 0 {
      grid(
        columns: 2,
        column-gutter: 0.3cm,
        [ สิ่งที่ส่งมาด้วย ],
        {
          for attachment in attachments [
            + #attachment
          ]
        },
      )
    }

    parbreak()
  }
})

#let govsign(
  signoff: "ขอแสดงความนับถือ",
  name: "",
  position: "",
) = {
  set par(first-line-indent: 0cm)
  set block(breakable: false)

  v(16pt)
  center-left([
    #signoff
    #v(44pt)
    
    (#name)\
    #position
  ])
}

#let govsender(body) = {
  set par(first-line-indent: 0cm)
  
  v(16pt*4)
  block(breakable: false, body)
}
