% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Cần Chúa Thánh Thần"
  poet = "Ý lời ca: Marie Eugène"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 f |
  d f g g |
  c,4. c8 |
  d f bf bf |
  a2 ~ |
  a8 f g a |
  g4 f8 f |
  f bf g (bf) |
  c4. bf8 |
  bf4 bf8 bf |
  d bf c (bf) |
  g2 ~ |
  g8 e f a |
  g4. g8 |
  c,4 d8 g |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 f |
  d4. d8 |
  f c f (g) |
  a2 |
  f8. bf16 bf8 bf |
  g4. g8 |
  g (bf) c d |
  a2 ~ |
  a8 bf g g |
  g (a) f g16 (f) |
  d4. c8 |
  c c e g |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy dâng mình cho Chúa Thánh Thần để Ngài dạy dỗ chúng ta
  và qua chúng ta, Ngài thực hiện trong Hội Thánh
  mọi việc Ngài dự kiến từ muôn đời,
  điều mà Chúa Cha trông đợi nơi chúng ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Muốn trở thành người tông đồ cùa Chúa,
      Cần có Chúa Thánh Thần hiện diện trong chúng ta
      để Ngài làm chủ mọi công việc và nguyện cầu trong chúng ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Muốn trở thành người tông đồ cùa Chúa,
      Cần có Chúa Thánh Thần hoạt động nơi chúng ta
      để Ngài điều khiển và ta là dụng cụ Ngài thao tác thôi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Muốn trở thành người tông đồ cùa Chúa,
      Cần có Chúa Thánh Thần dạy bảo ta sơm hôm
      để ngày càng hiểu mà thông truyền nhiệm mầu tình yêu Chúa liên.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
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
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
