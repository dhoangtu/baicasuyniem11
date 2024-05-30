% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Từ Bỏ Chính Mình"
  poet = "Ý lời ca: Frédéric Manns"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 c8 a |
  bf g a a |
  f8. f16 a8 f |
  c4. f8 |
  e f g a |
  g2 |
  bf8 bf
  \afterGrace bf8 ({
    \override Flag.stroke-style = #"grace"
    c16)}
  \revert Flag.stroke-style
  d8 |
  g,4 g8 g |
  \afterGrace g8 ({
    \override Flag.stroke-style = #"grace"
    bf16)}
  \revert Flag.stroke-style
  c8 e, e |
  f2 ~ |
  f4 r \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 e f g |
  g4. g8 |
  g g g a |
  a2 ~ |
  a8 bf d bf |
  g8. g16 c8 bf |
  a2 |
  g8 a d, e |
  c8. g'16 a8 g |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Muốn dâng hiến cho Chúa những gì mình đã nhận được
  do lòng yêu thương Chúa ban,
  Phải từ bỏ chính mình và từ bỏ hết mọi sự luôn.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi Mẹ Ma -- ri -- a cho Si -- mê -- ôn ẵm Chúa,
      Mẹ biết Con mình là Đấng Thiên Sai
      Nhưng sẽ làm cho Mẹ tan nát gan vàng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Theo Mẹ Ma -- ri -- a đi cho muôn dân biết Chúa,
      Hội Thánh thông hiệp vào lễ hy sinh
      Con Chúa Trời xưa đà trao hiến thân mình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Như phù rể hân hoan khi nghe tân lang cất tiếng,
      Hội Thánh theo Mẹ mừng rỡ reo vui
      khi xóa mình lu mờ cho Chúa tỏ hiện.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
