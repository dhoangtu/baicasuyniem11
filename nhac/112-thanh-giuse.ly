% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Thánh Giuse"
  poet = "Ý lời ca: Jean Pierre Nave"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 c8 a |
  g4. e8 |
  e f e d |
  d4 r8 d |
  c c c g' |
  a2 ~ |
  a8 g g c |
  c4. a8 |
  a d4 b8 |
  c2 ~ |
  c4 r \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  g8 g fs g |
  e2 |
  e8 f e e |
  d4 d8 g |
  c,2 |
  c8 c c f |
  f4. e8 |
  d g g g |
  f4. e8 |
  e a4 g8 |
  c2 ~ |
  c4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Thánh Giu -- se, Hôn Phu Đức Ma -- ri -- a
  luôn đồng hành cùng Thiên Chúa,
  hoàn toàn tín thác vào lời Chúa truyền ban.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Đây con người thinh lặng, Tân Ước không ghi lại câu nói nào.
      Mọi sự đều diễ tiến trong một lương tâm ngay thẳng,
      hằng được Chúa thăm viếng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi nghe lời thiên thần cho biết tin vui mừng trong giấc mộng,
      Người thực hiện ý Chúa khi làm cha nuôi Con Trẻ,
      làm bạn Đức Trinh Nữ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Khi thi hành vuông tròn thiên chức cha nuôi mà Người lãnh nhận,
      Người trọn vẹn cống hiến không từ nan,
      không mong mỏi được đền đáp chi hết.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \override LyricHyphen.minimum-distance = #1.2
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
