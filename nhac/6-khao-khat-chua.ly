% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Khao Khát Chúa"
  poet = "Ý lời ca: Thánh Augustinô"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 f |
  g4. e8 |
  e g f d |
  c2 |
  r8 a' a bf |
  bf2 ~ |
  bf8 g g a |
  a2 |
  f8 a g f |
  e4. f8 |
  g g e f |
  d4. d8 |
  f d c e |
  g4 g8 e |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  g e a a |
  g4. f8 |
  f a g f |
  e4 d8 g |
  a4 r8 a |
  bf4 (a8) f |
  g a f d |
  g2 ~ |
  g8 g16 (bf) d8 g,16 (bf) |
  c4 a16 (g) c8 |
  f,2 ~ |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Trót đời ta là niềm khát khao vô tận:
  Ta khao khát Chúa, nhưng chưa thấy Chúa.
  Nhờ khát khao vô tận, ta xứng đáng được mãn nguyện
  khi Đấng ta cần chiêm ngưỡng đến cùng ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi Chúa chậm đến với ta
      là Ngài muốn ta mở rộng lòng khao khát,
      do đó lòng ta cũng mở rộng ra
      để có khả năng vui đón Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi đã định rót thứ chi vào bình chưa cho bảo toàn thật tinh chất,
      là hãy liệu sao xúc rửa sạch trơn
      để chất đổ vô tinh khiết thật.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
