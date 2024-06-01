% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Lòng Xót Thương Của Chúa"
  poet = "Ý lời ca: Alfred Beogner"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 g8 |
  c a g (a) |
  b4. fs8 |
  g4 g8 a |
  e4. e8 |
  e d g b |
  a4 r8 b |
  b c a b |
  b4. g8 |
  b g fs e |
  e4. d8 |
  a' a a b16 (a) |
  g4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key g \major
  \time 2/4
  \partial 4 fs8 fs |
  b4. a8 |
  b g4 e8 |
  d4 d8 d |
  d4. b'8 |
  c a4 a8 |
  a4 g8 a |
  b4. b8 |
  c a4 d8 |
  d4 d,8 d |
  b'4. a8 |
  b a4 a8 |
  g4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lòng xót thương của Chúa dành cho con cái Ngài
  không khi cùng, không đổi thay.
  Xin cho chúng con tín thác và nếm hưởng sự ngọt ngào
  tình yêu vô biên của Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài tỉnh thức khi chúng con ngủ vùi,
      Ngài hành động khi chúng con khoanh tay,
      Ngài nghe thấu khi chúng con điếc lác,
      Ngài nhìn rõ khi chúng con đui mù.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Lời trần thế rên xiết khi cơ cùng,
      Ngài cảm nhận trong trái tim thương yêu.
      Từ bao tiếng than vãn trong nước mắt
      ngài gặt hái bao lúa thơm tươi mầu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Giờ giải thoát xin Chúa cho khởi đầu
      và biểu lộ vinh sáng ra nơi nơi,
      Thời viên mãn xin Chúa thương đến gấp
      và hiệp nhất con cái muôn phương trời.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
