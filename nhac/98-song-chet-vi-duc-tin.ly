% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Sống Chết Vì Đức Tin"
  poet = "Ý lời ca: Hồng y Carlo-Maria Martini"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key bf \major
  \time 2/4
  \partial 4 d4 |
  bf'4. g8 |
  a2 ~ |
  a8 f16 (g) a8 d, |
  g4 r8 a |
  bf a a a |
  a4. a8 |
  d d f, a |
  g4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key bf \major
  \time 2/4
  \partial 4 d4 |
  bf'4. (a8) |
  f f a g |
  g4 f8 g |
  d4. bf'8 |
  a g bf g |
  a4 r8 a16 (bf) |
  f4 g8 d |
  bf' a a c |
  d4 c8 c |
  bf4. a8 |
  c c bf a |
  g4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hội Thánh là dân của những người tin,
  tin Chúa Giê -- su Ki -- tô và sống chết vì đức tin.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hội Thánh là của Chúa Giê -- su,
      là dân tộc vững tin Ngài đã phục sinh,
      Mỗi người luôn làm chứng về niềm tin đó
      theo ân sủng và theo ơn gọi của mình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hội Thánh hiện diện giữa muôn dân,
      cùng thông hiệp những vui mừng, những sầu đau,
      dẫn đường cho trần thế tìm về chân lý,
      mong soi tỏ tình yêu thương của Tin Mừng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Hội Thánh được Lời Chúa sai đi,
      được Thánh Thần sáng soi dạy dỗ chẳng ngơi đến cùng ai nghèo khó,
      cùng cực, cô thế mong an ủi làm vơi đi cảnh ưu sầu.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
