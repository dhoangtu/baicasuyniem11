% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Mọi Người Là Anh Em"
  poet = "Ý lời ca: Joseph Wresinski"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a16 (bf) a8 g g |
  a4. d,8 |
  d d d f |
  g4 r8 e |
  g f g a |
  a4. f8 |
  bf g bf bf |
  c4. bf8 |
  d bf c c16 (bf) |
  g2 ~ |
  g8 e16 (d) g8 g |
  c8. a16 a8 a |
  g4 g8 c |
  f,4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a4 |
  a4. d,8 |
  d d16 (f) c8 f |
  g4 bf8 bf |
  a4 \breathe a8 c |
  g4 a8 f |
  g8 g16 (f) d8 d |
  d4 r8 c |
  g'2 |
  e8 e g g |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa Giê -- su công bố:
  Mọi người đều là anh em.
  Tình huynh đệ theo ý Chúa được xây dựng trong Thiên Chúa
  dệt bởi lạc quan, hy vọng vì xác tín rằng:
  Ta đang trên đường về Nước Trời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Có Chúa là nền tảng sự hiệp thông giữa chúng ta,
      nên chúng ta sẽ thành công trong hành trình này,
      Vì Chúa hằng trìu mến chúng ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Bất chấp bao gian khổ và hiểm nguy, cứ tiến lên,
      luôn vững tin Chúa và ta thân tình đồng hành,
      Tình Chúa bền chặt nối kết ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chính Chúa hằng bồi bổ và canh tân mỗi chúng ta,
      cho chúng ta hưởng niềm vui khi thuộc về Ngài,
      hạnh phúc truyền tụng khắp đó đây.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
