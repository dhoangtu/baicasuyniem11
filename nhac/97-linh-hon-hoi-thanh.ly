% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Linh Hồn Hội Thánh"
  poet = "Ý lời ca: Hồng y Godfried Danneels"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 g8 g |
  c,4. 8 |
  e d f e |
  g2 |
  e8 e g e |
  a4. a8 |
  f g f (e) |
  d2 |
  d8 d f e |
  a b g (a) |
  c4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 g8 g |
  c,4. c8 |
  c e f d |
  g2 ~ |
  g8 e e e |
  f4. e8 |
  e d a' g |
  c4 r8 b |
  b4 b8 b |
  e e a, (c |
  g4) \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa Thánh Thần là linh hồn của Hội Thánh,
  Ngài làm cho Hội Thánh sống và tăng trưởng hoài
  và truyền giảng Lời Chúa tới mọi nơi.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chính Thánh Thần hoạt động trong các nhiệm tích.
      Ngài được cầu khẩn khi ban hành mỗi nhiệm tích,
      đặc biệt là nhiệm tích Thánh Thể.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chính Thánh Thần là nguồn phân phát mọi ơn,
      dù là đặc sủng hay thông thường giữa Hội Thánh,
      đều là vì lợi ích tất cả.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chính Thánh Thần làm mọi xu hướng hiệp nhất,
      làm mọi phần tử chung tay bồi đắp Hội Thánh,
      mọi người chịu một phép Thánh Tẩy.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
