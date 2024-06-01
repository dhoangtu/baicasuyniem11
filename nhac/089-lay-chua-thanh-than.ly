% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Lạy Chúa Thánh Thần"
  poet = "Ý lời ca: Thánh Bênedita"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  a' (bf) g (a) |
  f4 r8 f |
  g4 g16 (a g f) |
  \grace { c16 (d} c2) |
  c'8. d16 d8 bf |
  bf4. d8 |
  g, (bf) c4 |
  c2 ~ |
  c8 a bf bf |
  bf4 g8 e |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8f8 |
  a (bf) a4 |
  g4. f8 |
  g g d16 (f) d8 |
  c2 |
  f8 f e16 (f) a8 |
  g2 ~ |
  g8 d e16 (d) c8 |
  a'4. bf8 |
  e,4 f8 f |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lạy Chúa Thánh Thần, Tình Yêu vĩnh cửu,
  Xin ánh sáng của Ngài chiếu tỏa trên con,
  soi sáng bóng tối tâm hồn con.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài dẫn con đi bằng đôi tay của mẹ hiền.
      Con không thể bước đi dù chỉ một bước nếu Ngài buông tay con.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài chở che con một không gian phủ tư bề.
      Con sa chìm thẳm sâu trong cõi mờ tối nếu Ngài xua con đi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ngài ở bên con gần con hơn cả con này.
      Ôi sâu thẳm biết bao, con chẳng dò thấu,
      kín nhiệm hơn tâm can.
    }
  >>
}

% Dàn trang
\paper {
  #(set-paper-size "a5")
  top-margin = 3\mm
  bottom-margin = 3\mm
  left-margin = 3\mm
  right-margin = 3\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Deja Vu Serif Condensed"
	 		       "Deja Vu Serif Condensed"
			       "Deja Vu Serif Condensed"
			       (/ 20 20)))
  print-page-number = ##f
}

\score {
  <<
    \new Staff <<
        \clef treble
        \new Voice = beSop {
          \nhacPhanMot
        }
      \new Lyrics \lyricsto beSop \loiPhanMot
    >>
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}

\score {
  <<
    \new Staff <<
        \clef treble
        \new Voice = beSop {
          \nhacPhanHai
        }
      \new Lyrics \lyricsto beSop \loiPhanHai
    >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
