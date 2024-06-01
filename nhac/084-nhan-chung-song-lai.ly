% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Nhân Chứng Sống Lại"
  poet = "Ý lời ca: Mgr Michel Sabbah"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a8 bf a f |
  g4 f8 g |
  a d, g g |
  c,2 |
  g'8 a g f |
  e4 e8 a |
  a a f f |
  bf4. bf8 |
  g g c g |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 g |
  a e a a |
  d,4. d8 |
  f f c c |
  g'4. a8 |
  bf a a bf |
  c4 bf8 bf |
  d g, a (g) |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Như các Tông Đồ xưa là nhân chứng việc Chúa sống lại,
  Nay chúng ta đã được nhận lãnh Chúa Thánh Thần ngự xuống,
  hãy nên nhân chứng của Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Là nhân chứng việc Chúa sống lại,
      mau ngước mắt về trời cao
      chiêm ngưỡng vinh quang Thiên Chúa để hiểu rõ ràng ý Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Là nhân chứng việc Chúa sống lại,
      mau ngước mắt về trời cao,
      minh chứng ta luôn vui sống vì được Chúa hằng ở cùng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Là nhân chứng việc Chúa sống lại,
      mau ngước mắt về trời cao
      cho khắp nơi nơi hay biết lòng mình đang sáng ngời hy vọng.
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
