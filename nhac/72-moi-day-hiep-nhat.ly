% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Mối Dây Hiệp Nhất"
  poet = "Ý lời ca: Thánh Cyrilô Alexanria"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b8 g |
  b g c b |
  a4. a8 |
  g4 fs8 a |
  b2 |
  g8 a16 (g) e8 g |
  fs4. fs8 |
  g fs e a |
  g4. g8 |
  fs e a b |
  b4 g8 b |
  c4 (b8) fs |
  fs a g fs |
  b4 d,8 fs |
  e4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 b8 |
  fs4. fs8 |
  b b b b |
  e,2 |
  a8 a g a |
  b2 ~ |
  b8 b b b |
  g4 a8 g |
  fs4. e8 |
  d d e fs |
  b4 g8 fs |
  e a g a |
  b4. b8 |
  fs4 d8 fs |
  e4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúng ta lãnh nhận Chúa Giê -- su nguyên vẹn và duy nhất
  vào thân thể chúng ta nên đã trở thành chi thể của thân mình duy nhất đó
  và qua đó Ngài là mối dây hiệp nhất của chúng ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Mỗi người đều có cá tính khác biệt,
      nhưng Con Một Thiên Chúa thánh hóa những kẻ tin ở Ngài
      trong sự hiệp thông bí nhiệm biến họ thành thân thể duy nhất
      với Ngài và với nhau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Mỗi người đều khép kín với cá biệt,
      nhưng khi được nuôi dưỡng đã sống chính bởi thân thể Ngài
      nên đã hòa tan kết tụ, đã trở thành thân thể duy nhất,
      Thánh Thần hiệp nhất nên.
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
