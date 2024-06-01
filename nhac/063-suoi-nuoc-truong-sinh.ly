% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Suối Nước Trường Sinh"
  poet = "Ý lời ca: Jean Galot"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key bf \major
  \time 2/4
  f8 g d f |
  g2 |
  bf8 a bf a |
  a4. a16 (bf) |
  a4 g |
  <<
    {
      d'4. bf16 (c) |
      d8 c bf a |
      g4 f8 g |
      d2
    }
    {
      fs4. g16 (a) |
      bf8 a g f |
      ef4 d8 c |
      bf2
    }
  >>
  <<
    {
      \voiceOne
      a'8 _(bf)
    }
    \new Voice = "splitpart" {
      \voiceTwo
      c,4
    }
  >>
  \oneVoice
  <<
    {
      f4 |
      g2 ~ |
      g4 r \bar "|."
    }
    {
      d4 |
      bf2 ~ |
      bf4 r
    }
  >>
}

nhacPhanHai = \relative c'' {
  \key bf \major
  \time 2/4
  g8 g d bf' |
  a4. bf16 (c) |
  d4 g,8 bf |
  a4. bf8 |
  g g a f16 (g) |
  d4. d8 |
  g4 bf |
  a4. a8 |
  a c c d |
  a2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Bị lưỡi đòng đâm thâu,
  Trái tim Chúa Giê -- su trở nên mạch suối của những con sông
  tuôn trào cho vũ trụ Nước trường sinh.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi đâm vào trái tim của Đấng chịu đóng đinh,
      lưỡi đòng đà chứng tỏ rằng:
      Tình yêu Chúa đây là tình yêu đi đến cùng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngay khi từ trái tim chảy máu và nước ra,
      phúc lộc thự đã khởi nguồn,
      Và ai tới đây đều nhận ân thiêng cứu độ.
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
