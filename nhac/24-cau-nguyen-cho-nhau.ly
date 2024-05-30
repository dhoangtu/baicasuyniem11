% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Cầu Nguyện Cho Nhau"
  poet = "Ý lời ca: Henry Nouwen"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4. c8 c f |
  f4. a8 |
  a4 f8 g |
  a4. f8 |
  f bf bf g |
  c4 r8 c |
  a4 f8 f |
  g4 g8 g |
  a4 e8 f |
  g c, g' g |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 e |
  e4. g8 |
  a a a f |
  d4 d8 c |
  c a' bf g |
  g4 g8 g |
  c a16 (g) d8 f |
  g4. a16 (g) |
  f2 ~ |
  f8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Cầu nguyện cho nhau,
  trước hết và trên hết là nhận biết trước mặt Chúa:
  Chúng ta là anh em trong tư cách là con cái một Cha trên trời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi cầu nguyện ta mới khám phá ra rằng:
      ta càng gần Thiên Chúa bao nhiêu,
      càng gần gũi anh chị em ta bấy nhiêu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi cầu nguyện ta thấy có Chúa trong lòng
      nên nhận thực nơi mỗi anh em
      đều được Chúa thương ngự luôn trong cõi lòng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Khi cầu nguyện nghe tiếng Chúa nói thân tình
      nên hiểu rằng qua khắp không gian
      lời Ngài vẫn luôn thầm vang trong mỗi người.
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
