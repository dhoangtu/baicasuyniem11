% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Trong Chén Thánh"
  poet = "Ý lời ca: Anseim Grun"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 g8 a |
  a4. a8 |
  fs d g a |
  b4. g8 |
  a8. b16 a8 g |
  e (g) e d |
  a'4 g8 c |
  c4. c8 |
  c c a c |
  d4. b8 |
  c c c b |
  a4 fs8 fs |
  a4. b16 (a) |
  g2 ~ |
  g4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b8 b |
  b a16 (g) e8 g |
  a4 a8 a |
  a b16 (a) g8 g |
  c4 r8 c |
  e d16 (c) a8 d |
  b4. a16 (b) |
  e,8 d a' b16 (a) |
  g4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Trong chén thánh, chúng ta cùng dâng lên Chúa rượu nho với bao đau khổ,
  bao niềm vui của thế giới để mọi sự được đổi mới
  trong Máu Thánh Chúa Giê -- su và tình yêu của Người.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Với chén thánh đang cầm trong tay,
      nâng cao lên với trọn hồn xác
      cùng với bao là ước trông hưởng một tình yêu thắm hồng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Với Thánh lễ mỗi ngày hiệp dâng,
      mong dương gian mỗi ngày đổi mới,
      nguyện ước cả đời chúng con
      Thánh Thể còn ghi dấu hoài.
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
    \override LyricHyphen.minimum-distance = #1
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
