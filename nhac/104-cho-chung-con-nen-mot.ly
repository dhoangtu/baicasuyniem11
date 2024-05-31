% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Cho Chúng Con Nên Một"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  f g d d |
  c4. c8 |
  <<
    {
      a'16 (bf) a8 g g |
      g4 r8 a |
      a bf g g |
    }
    {
      f16 (g) f8 e d |
      c4 r8 f |
      f g f e |
    }
  >>
  f2 ~ |
  f8 f e e |
  a4.
  <<
    {
      a8 |
      f4 bf8 bf |
      g4. g8 |
      c c g
    }
    {
      c,8 |
      d4 g8 f |
      e4. d8 |
      e e e
    }
  >>
  <<
    {
      \voiceOne
      a16 (g)
    }
    \new Voice = "splitpart" {
      \voiceTwo
      e8
    }
  >>
  \oneVoice
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 g8. a16 |
  a8 f g d |
  c4. c8 |
  f g16 (f) e8 e |
  a4 r8 c |
  bf4 bf |
  g g8. g16 |
  a8 f g d |
  c2 ~ |
  c8 f e g |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Xin cho chúng con nên một, lạy Chúa Giê -- su Ki -- tô,
  Xin cho chúng con nên một
  Như sự hiệp nhất giữa Ngài với Chúa Cha
  và giữa Chúa Cha với Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Như tấm bánh đặt trên bàn thờ làm nên bởi nhiều hạt lúa,
      Chúng con tuy nhiều nhưng xin Chúa làm cho nên một
      trong tình Chúa yêu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Dâng Chúa chén rượu nho thơm nồng được tinh kết từ nhiều trái,
      Chúng con tuy nhiều,
      Nhưng trong Chúa nguyện luôn tâm thành thông hiệp với nhau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Do tấm bánh cùng nhau thông hiệp và do uống cùng một chén,
      Chúng con tuy nhiều,
      Nhưng Chúa lấy tình yêu quy tụ trong một Chúa thôi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Xin Thánh Mẫu từ nhân độ trì,
      đoàn con vững bền hiệp nhất,
      Ngước trông lên Mẹ,
      Xin theo bước Mẹ luôn trọn niềm vâng phục Chúa liên.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
