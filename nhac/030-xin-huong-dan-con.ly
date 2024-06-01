% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Hướng Dẫn Con"
  poet = "Ý lời ca: Claude Morel"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 3/4
  f2 d4 |
  c2 g'4 |
  g4. g8 g f |
  a4. f8 bf bf |
  bf4. g8 e4 |
  c2 g'4 |
  f2. \bar "||"
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 3/4
  f4. a8 a f |
  d4. c8 g'4 |
  a2 f4 |
  bf4. bf8 g4 |
  d'2 c4 |
  c4. bf8 g4 |
  g2 e4 |
  c4. g'8 g4 |
  f2. \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi lên tàu ra khơi trên muôn cuồng sóng
      và giữa gió bão của bao điều lắng lo
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
	    Khi trong hồn con nghe hoang mang sợ hãi
	    vì những khốn khó giữa cảnh đời trái ngang,
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
	    Khi cơ cùng, con xin tin yêu bền vững,
	    vì ánh mắt Chúa chẳng khi nào khuất xa.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
	    Khi tin rằng sau bao gian nan kiệt sức,
	    trời mới đất mới đẩy hy vọng vút lên.
    }
  >>
}

loiPhanHai = \lyricmode {
  Con ngước mắt lên trời nguyện xin Chúa:
  Lạy Chúa con lèo lái ra khơi chỉ vì Ngài,
  xin Ngài hướng dẫn con.
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
  page-count = 1
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
