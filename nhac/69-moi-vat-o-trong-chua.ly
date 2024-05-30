% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Mọi Vật Ở Trong Chúa"
  poet = "Ý lời ca: Hồng y Robert Coffy"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 4 e4 |
  f2 |
  d8 d16 (e) c8 a' |
  a4 f8 f |
  f f f16 (a) g8 |
  e4 \breathe c |
  a'2 |
  f8 f a c |
  b4 a8 c |
  g4 a8 a |
  g d f g |
  c,2 ~ |
  c4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 g8 a |
  f4 g8 a |
  f f g d |
  d4 e8 c |
  c4. f8 |
  d d d d |
  \grace f16 (g2) ~ |
  g8 a d, d |
  f4 f8 g |
  a4. a8 |
  d, g e (d) |
  c2 ~ |
  c4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Thiên Chúa không ở ngoài thế giới,
  vì mọi tạo vật ở trong Ngài,
  Ngài đến để ở giữa chúng ta,
  trong chúng ta, biến chúng ta thành con cái Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Trong Thánh Thể, qua dấu chỉ của bánh và rượu,
      Chúa hiện diện, kéo dài mầu nhiệm nhập thể,
      chính là mầu nhiệm một Thiên Chúa muốn ở với nhân loại.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Qua Thánh Thể đây Chúa thực sư muốn hiện diện với mọi người,
      kết hiệp họ thành nhiệm thể, chính Ngài là đầu,
      được nuôi dưỡng bởi Thịt Máu của Ngài.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
