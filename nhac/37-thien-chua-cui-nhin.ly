% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Thiên Chúa Cúi Nhìn"
  poet = "Ý lời ca: Roger Bichelberger"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 a8 |
  bf bf g c |
  f,4. f8 |
  a e e16 (f) d8 |
  c2 ~ |
  c8 c a' a |
  e4 g8 g |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 d |
  c4. c8 |
  f e f (g) |
  a4. bf8 |
  g g g (c) |
  f,2 ~ |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Thiên Chúa cúi mình xuống tận sự yếu hèn của con người,
  Ngài cất tiếng gọi:
  Hãy tiến lên.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Tiến lên nào,
      người đang bị phỉ báng,
      Nước Trời là của bạn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Tiến lên nào, người đang bị bỏ đói,
      sẽ no nê thỏa lòng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Tiến lên nào, người vương lệ đỏ mắt,
      sẽ hân hoan mỉm cười.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Tiến lên nào, người mang nặng khổ giá,
      phúc vinh quang sẵn chờ.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
