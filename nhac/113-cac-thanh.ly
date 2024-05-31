% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Các Thánh"
  poet = "Ý lời ca: Antoine Chevrier"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b4 |
  b2 |
  g8 a a b |
  c4 c8 a |
  b2 |
  g8 g g b |
  fs8. fs16 fs (g) a8 |
  e4 e8 e |
  g fs16 (g) a8 g |
  d4 d8 d |
  a'4 fs16 (g) a8 |
  g2 ~ |
  g4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 g8 g |
  b2 |
  fs8 fs fs a |
  d,4 g8 a |
  b2 ~ |
  b8 c b b |
  c2 ~ |
  c8 c a c |
  d4 c8 d |
  e4. d8 |
  a d b16 (a) g8 |
  g2 ~ |
  g4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Các Thánh là vinh quang Thiên Chúa giữa trần gian,
  là biểu hiện sống động của bản chất Ngài,
  là niềm vui của các thiên thần, là hạnh phúc của thế nhân.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Một ví Thánh là một người kết hợp cùng Thiên Chúa,
      khát khao Thiên Chúa, nói cùng Thiên Chúa,
      và Thiên Chúa ân cần lắng nghe lời người.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Một vị Thánh là một người nắm quyền của Thiên Chúa,
      kết thân trong Chúa,
      khuấy động dương thế và lôi cuốn muôn sự đến bên cạnh mình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Một vị Thánh là một người chiếm được của châu báu,
      giữ kho Thiên Chúa, dẫy đầy ân phúc
      và phân phát không ngừng đến cho mọi người.
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
