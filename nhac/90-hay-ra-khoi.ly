% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Ra Khơi"
  poet = "Ý lời ca: Đức Phaolô VI"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 c8 a |
  a4 bf8 g |
  a f e a |
  d,2 |
  d16 (e) c8 f g |
  a4. f8 |
  bf g g bf |
  c4. c8 |
  e, g g f |
  f2 ~ |
  f4 r \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 f e e |
  a2 ~ |
  a8 f bf bf |
  d,2 ~ |
  d8 c a'16 (bf) a8 |
  g4 bf8 bf |
  bf d d g, |
  g4. f8 |
  e4 e8 g |
  d4. c8 |
  c f e g |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy ra khơi, hãy đi suốt con đường thánh thiện,
  Hãy trở nên nhân chứng của sức mạnh tình yêu Chúa
  giữa lòng thế giới hôm nay.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Xin ban đầy Thần Khí, Thần Khí sức mạnh,
      Thần Khí khôn ngoan để mọi người khám phá trọn vẹn
      sự thật về chính mình và về ơn gọi chứng nhân.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Xin ban tặng Hội Thánh từng lớp lớp người
      nhiệt huyết ra khơi để biểu thị có Chúa hiện diện,
      hiện diện để cứu độ và làm gian trần cách tân.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
