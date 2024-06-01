% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ca Tụng Chúa"
  poet = "Ý lời ca: Lules Bulliard"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 a8 g |
  c4 (b8) g |
  g a a f |
  e4 e8 c |
  f e d d |
  a'4 g8 a |
  f g e f |
  d4 f8 f |
  f (e) a c |
  b4 d8 c16 (d) |
  e4 e8 d |
  c (b) g (b) |
  a4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  \partial 4 e8 c |
  f4. e8 |
  f d f f |
  e2 |
  a8 e e16 (a) c8 |
  b4 b8 d |
  e e d16 (c) g8 |
  a2 ~ |
  a4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ca tụng Chúa vì sự khôn ngoan của Ngài,
  không dập tắt tim đèn còn khói,
  không cắt bỏ cây sậy đã giập,
  chẳng nhổ bỏ cây đã khô,
  nhưng để nó có cơ hội nở hoa.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ca tụng Chúa luôn nhẫn nại với chúng con,
      không ruồng bỏ chúng con dù hoa trái chung con mọn hèn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ca tụng Chúa ban tháng ngày quý báu đây
      xin hồi tưởng nghĩ suy, thành tâm thống hối bao tội tình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ca tụng Chúa luôn chấp nhận tiếng khấn xin
      thanh luyện để chúng con cùng Con Chúa tiến lên rạng ngời.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
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
