% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Vì Được Thanh Tẩy"
  poet = "Ý lời ca: Michel Hubaut"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b8 b |
  e,4. e8 |
  e16 (fs) d8 g a |
  b2 |
  c8 c c fs, |
  fs4 e8 d |
  g2 |
  b8 b g c |
  c4. c8 |
  b4 a8 d |
  d4 d8 g, |
  g g a a16 (g) |
  e4. g8 |
  a2 |
  b8 g a fs |
  fs e d4 ~ |
  d8 d fs a |
  g2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key g \major
  \time 2/4
  fs8 g e g |
  \grace { d16 (e } d2) ~ |
  d8 d d g |
  e8 e16 (g) a8 b |
  g4 c8 a |
  d2 |
  r8 c16 (e) d8 c |
  d4 d16 (c) a8 |
  a2 |
  r8 a16 (c) b8 e, |
  a8. a16 d8 d |
  g,4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa Thánh Thần, Ngọn Lửa tình yêu Thiên Chúa
  sẽ thống nhất trọn vẹn con người ta,
  sẽ thấm nhập ý chí, trí khôn và con tim,
  thấm nhập mọi khả năng nhân loại của ta,
  khiến ta biết yêu thương sâu đậm và phong phú hơn.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Vì đã được thanh tẩy, cuộc đời ta
      phải biểu dương sống động cho tình yêu:
      biểu dương tình yêu qua cầu nguyện,
      biểu dương tình yêu qua mỗi tác động.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Vì đã được thanh tẩy,
      thực sự ta vượt khỏi bao chướng ngại ngăn tình yêu,
      bởi ta được ơn sinh lại rồi,
      để ta trở nên con cái Chúa thật.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Vì đã được thanh tẩy, là Thần Linh điều khiển
      khi tác động trong lòng ta bởi ơn đặc trưng cho từng người,
      bởi công hiệu chung là thánh hiến họ.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
