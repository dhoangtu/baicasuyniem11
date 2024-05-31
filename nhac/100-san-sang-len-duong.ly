% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Sẵn Sàng Lên Đường"
  poet = "Ý lời ca: Jean Laplace"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 a8 |
  bf g c c |
  f,2 |
  f8 e16 (f) d8 d |
  c4. f8 |
  f g16 f e (f) a8 |
  a4 r8 g16 g |
  bf8 bf bf g |
  c2 ~ |
  c8 a16 (g) f8 g |
  d (c) g' a |
  f2 ~ |
  f4 r \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  a8 bf a g |
  g4. f8 |
  d c f g |
  a2 |
  a8 bf g c |
  c4. c,8 |
  c c a' (g) |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ai lãnh nhận Chúa Thánh Thần, không chỉ là trung thành tuân theo
  những khuôn khổ có sẵn mà còn phải mở cửa lòng ra
  sẵn sàng lên đường theo ý Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Như Ap -- bra -- ham xưa lên đường tìm quê hương mới,
      không có gì hướng dẫn ngoại trừ lời Chúa truyền.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Như Đức Ma -- ri -- a vâng phục lời của Thiên sứ
      khi biết là ý Chúa dù lòng thực ngỡ ngàng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Như các môn sinh xưa luôn lẹ làng đi theo Chúa,
      không nghĩ ngợi thắc mắc dù cùng cực khó nghèo.
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
