% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Cha Chúng Con"
  poet = "Ý lời ca: Lules Bulliard"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b8 b |
  d2 ~ |
  d8 g, b c |
  a4 r8 g |
  c e e e |
  d4 c8 d |
  a4. g8 |
  a fs fs (g) |
  g4 a8 c |
  g a fs g |
  e4 e16 (fs) d8 |
  a'4. g8 |
  g4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 a8 a |
  b4. g8 |
  c b a g |
  a4. g8 |
  fs8 a g a |
  b4. a8 |
  d,8 a' a a |
  g4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Tôn vinh Chúa là Cha chúng con,
  vì Con Chí Ái Chúa ban để gian trần được giao hòa cùng Chúa.
  Người chính là khuôn mặt con người của lòng Chúa yêu thương.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Tôn vinh Chúa vì các tiên tri được sai
      chuẩn bị bao người công chính trông đợi đón Đấng Cứu Tinh.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Tôn vinh Chúa vì thánh Gio -- an Tiền hô
      nhảy mừng trong lòng thân mẫu khi Mẹ Chúa đến viếng thăm.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Tôn vinh Chúa vì tiếng ''Xin vâng''
      Mẹ thưa nhận thực thi lời thiên sứ,
      Ngôi Lời lãnh lấy xác thân.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Tôn vinh Chúa vì lão ông Si -- mê -- on
      đã đợi trông và công bố:
      Đây là ánh sáng thế gian.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
