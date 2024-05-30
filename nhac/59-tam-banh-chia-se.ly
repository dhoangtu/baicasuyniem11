% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Tấm Bánh Chia Sẻ"
  poet = "Ý lời ca: René Pageau"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 c4 |
  a' g8 f |
  e4. e8 |
  a a g f |
  bf4 a8 g |
  bf c bf16 (a) d8 |
  d4. c16 (bf) |
  g8 g c c |
  f,2 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  a8 a f4 ~ |
  f8 e a g16 (f) |
  \grace { d16 (e } d4.) c8 |
  f d16 (f) g8 g |
  g2 |
  a8 a f16 (e) a8 |
  d,4 c8 c |
  a'2 |
  bf8 bf e, g |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hiệp Lễ không chỉ là nhận tấm bánh ban sự sống
  nhưng còn là chia sẽ bánh ấy trong tình hiệp thông huynh đệ.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Bánh Thánh Thể là bánh chia sẻ
      làm ta trở nên anh em, bất chấp mọi khác biệt, mọi thù ghét,
      bất chấp mọi cách ngăn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Bánh Thánh Thể là bánh chia sẻ làm ta nhận nơi anh em
      có Chúa ở với họ thật đậm nét cũng giống ở với ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Bánh Thánh Thể là bánh chia sẻ, Ngài trao tặng ta cho nhau,
      Thế giới sẽ thắm đẹp tình bằng hữu kết nối cùng Chúa Cha.
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
