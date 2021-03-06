\version "2.12.0"

#(set-global-staff-size 16)

\include "parts.ly"

\paper {
  between-system-padding = #0.1
}

\layout {
  \context {
    \Staff
    \override VerticalAxisGroup #'minimum-Y-extent = #'(-3 . 4)
  }
  \context {
    \Lyrics
    \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 0)
  }
}

\score {
  \new Score \with {
    \override VerticalAlignment #'max-stretch = #ly:align-interface::calc-max-stretch
  } <<
    \new StaffGroup \with {
      \consists "Instrument_name_engraver"
      instrumentName = #"Violinos"
    } <<
      \new Staff \with {
        \override InstrumentName #'self-alignment-X = #RIGHT
        instrumentName = #"I"
      } \violinoOne
      \new Staff \with {
        \override InstrumentName #'self-alignment-X = #RIGHT
        instrumentName = #"II"
        % keep some distance
        \override VerticalAxisGroup #'minimum-Y-extent = #'(-5 . 3)
      } \violinoTwo
    >>
    \choirPart
    \new PianoStaff \with {
      instrumentName = \markup \center-column { Basso continuo }
    } <<
      \new Staff \with {
        % keep some distance
        \override VerticalAxisGroup #'minimum-Y-extent = #'(-3 . 5)
        % smaller staff and small notes
        fontSize = #-3
        \override StaffSymbol #'staff-space = #(magstep -1)
        \override TimeSignature #'font-size = #2
      } \organo
      \new Staff { \clef bass \dynamicUp \continuo }
    >>
  >>
}
