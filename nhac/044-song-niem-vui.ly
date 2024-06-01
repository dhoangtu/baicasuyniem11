% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Sống Niềm Vui"
  poet = "Ý lời ca: Patrice Gourrier"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b16 (c) b8 |
  a4. fs8 |
  fs a c a |
  b4. a8 |
  a g g a16 (g) |
  e4 d8 d |
  a'4 g8 c |
  c4 d8 d |
  d, d fs g |
  g2 ~ |
  g4 r \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  b8 d b16 (a) g8 |
  a4 g8 a16 (g) |
  e8 c' a a |
  b4 g8 a16 (g) |
  e4. e16 (g) |
  d8 d d g |
  a4. c8 |
  a4 b8 a |
  g2 ~ |
  g4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa Giê -- su mời gọi ta sống hạnh phúc trong vui mừng và hy vọng,
  vì niềm vui là dấu chứng Chúa Thánh Thần hoạt động trong ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ta sống trong niềm vui vì tin vào huấn lệnh của Chúa,
      Niềm vui này trở thành mạch bình an, giúp ta sống quân bình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi sống trong niềm vui là thông truyền
      đến cùng người khác niềm hoan lạc,
      bời từng hành động của ta sáng lên phúc an bình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Đây Chúa kêu mời ta hãy vui mừng hướng trọn về Chúa,
      nhờ Thánh Thần chẳng ngừng hoạt động trong ta
      khiến ta vững tin Ngài.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
