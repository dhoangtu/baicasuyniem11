% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Trung Tín Với Chúa"
  poet = "Ý lời ca: Richard M. Gula"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  g g a f |
  bf4. g8 |
  a f4 d8 |
  c2 |
  r8 c' d c |
  c4. a8 |
  bf bf bf (a) |
  g4 g8 g |
  c (bf) g (a) |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 e e (a) |
  d,4. c8 |
  a' a bf bf |
  g2 |
  g8 (a) f bf |
  bf4 bf8 a |
  g g bf c |
  f,4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Làm sao trung tín cùng Chúa trong suốt cả cuộc đời,
  Như Chúa Giê -- su trung tín với Chúa Cha trọn cuộc sống của Người.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Lương thực của Người là vâng theo ý Chúa Cha,
      uống cạn chén đắng để chương trình của Cha liễu thành.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Trên mọi nẻo đường, Người tuyên ngôn với chúng nhân:
      Hãy tìm Nước Chúa, sống công bình và nhân ái hoài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Môn đệ của Người, vì yêu thương hãy dấn thân kết hợp với Chúa
      giúp muôn người tìm vinh phúc thật.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
