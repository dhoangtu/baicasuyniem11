% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chỉ Có Thần Khí"
  poet = "Ý lời ca: Hồng y Golfied Daneells"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 4 e16 (f) e8 |
  c'2 |
  c8 b d b |
  b4 b16 (c) g8 |
  a4 r8 a |
  e'2 |
  c8 d16 (d) b8 b |
  b4 e,8 c' |
  c4. b8 |
  b b16 (c) d8 e |
  a,2 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  g8 a c, (d) |
  e4 c'8 b |
  b4. b8 |
  b c c c16 (b) |
  a4 r8 d |
  d c b b |
  b4 g8 a |
  e4. e8 |
  f e c' c16 (b) |
  a4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chỉ Thần Khí mới đưa Chúa Giê -- su đến gần ta.
  Thần Khí làm cho Người hiện diện,
  Thần Khí tới mọi sự trở nên rõ ràng.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Không có Thần Khí, Chúa Giê -- su luôn xa cách đối với ta,
      ta không hiểu được lời Người,
      và Tin Mừng là những từ ngữ chết thôi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Không có Thần Khí, xuống trên ta, ai đâu sẽ nhắc nhớ ta
      cho ta thể hiện lời Người,
      và ai nào hằng chuyển cầu hướng dẫn ta?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Không có Thần Khí, khắp dương gian u mê,
      đắm đuối tối tăm,
      nơi nơi phủ đặc hận thù,
      tình huynh đệ tìm chẳng được đất phát huy.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
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
