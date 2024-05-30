% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Cho Con Thấy"
  poet = "Ý lời ca: Boullgand"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 8 e8 |
  e a f e |
  d4. d8 |
  d d c b |
  b4. e8 |
  c4 f8 e |
  d4 r8 d |
  e2 |
  b'8 b b c16 (b) |
  a2 ~ |
  a4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  \partial 8 e8 |
  e a f d |
  d4. d8 |
  b b f' f |
  e4 r8 e |
  c' a4 b8 |
  b4. b8 |
  c c d e |
  a,4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lời cầu xin của mọi người vang lên trong mọi thời đại hướng về Chúa Giê -- su:
  Lạy Ngài xin cho con thấy được.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Mọi người sẵn sàng hành động, nhưng cần nhìn rõ hướng đi,
      cần biết mình đi đâu và đủ khả năng quyết định.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Thực tình hết thảy mù lòa, ta cùng mò mẫm bước đi
      nào biết về nơi đâu và khựng lại khi thất bại.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Người mù Thánh Sử tường thuật:
      khi vừa được biết Chúa kêu,
      chạy đến quỳ van xin:
      Lạy Ngài làm con thấy được.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
