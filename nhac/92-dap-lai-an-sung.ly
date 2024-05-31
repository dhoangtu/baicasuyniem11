% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đáp Lại Ân Sủng"
  poet = "Ý lời ca: Agnès Lamy"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 4. e8 g c, |
  c4 f8 f |
  d g f e |
  a2 |
  f8 f a f |
  e4 e8 e |
  d4 d16 (f) e8 |
  c a' a a |
  g2 ~ |
  g4 a8 a |
  f g f f |
  e8. e16 a8 d, |
  d4. d8 |
  d d f g |
  c,2 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  g8 (a) f d |
  g8. g16 f8 a |
  d,4 a'8 b |
  c4. b8 |
  e a,4 a8 |
  g2 |
  a8. g16 g8 a |
  e4. e8 |
  a d, d e16 (d) |
  c4. g'8 |
  g2 ~ |
  g8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Trong suốt cuộc đời,
  Chúa Thánh Thần chúng ta nhận lãnh ngày chịu phép Rửa Tội,
  luôn can thiệp để thanh luyện thánh hóa chúng ta.
  Hãy đáp lại ân sủng của Ngài bằng những hành động
  và bằng tình cảm thích hợp.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hãy mở lòng ra cho sự thánh thiện,
      cho ánh sáng và sức mạnh của Ngài,
      Hãy tham gia tích cực vào những hành động của Ngài trong ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Những lỗi lầm ta mau được chữa lành,
      và ánh sáng Ngài chiếu dọi cõi lòng,
      sẽ gia tăng sức mạnh trợ giúp mọi sự yếu nhược nơi ta.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
