% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ơn Cứu Độ Bởi Chúa"
  poet = "Ý lời ca: Suzanne de Dietrich"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 8 g8 |
  c, c f f |
  e4 e8 e |
  e e d g |
  c,4 f8 a |
  g2 |
  f8 e e a |
  a4 b8 c |
  g4. g8 |
  f f d f |
  e4 r8 a |
  g g a (b) |
  c4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  \partial 8 g8 |
  g g e f |
  d4 r8 f |
  e d d g |
  c,4 r8 e |
  f d a' a |
  g4. g8 |
  a a g e |
  d2 |
  e8 f d g |
  f4. f8 |
  a a g (b) |
  c4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa đặt ngọn đuốc Đức Tin trong đôi tay nhân loại yếu hèn của chúng ta
  Để người người thấy rõ: Ơn Cứu Độ không phải bởi từ chúng ta,
  nhưng thực sự bởi Chúa.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúa muốn sức mạnh của mình tỏa ra từ sự yếu hèn,
      Thân thể Hội Thánh nát tan, liên đới với bao tội tình,
      nhưng vẫn là thân thể của Chúa sẽ hiển vinh.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Lúc có ước vọng kiếm tìm những chi làm rạng rỡ mình,
      khi óc bè phái phát sinh, ta xé nát thân thể Ngài,
      nên cớ làm ngăn trở kẻ muốn đến hiệp thông.
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
