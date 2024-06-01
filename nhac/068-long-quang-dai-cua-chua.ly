% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Lòng Quảng Đại Của Chúa"
  poet = "Ý lời ca: Jean Galot"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 \grace f16 (a8) |
  d,4. f8 |
  bf a bf a |
  g2 |
  bf8 bf bf \grace bf16 (d8) |
  g,4 f8 e |
  g4. g8 |
  a4 f8 bf |
  a a g (bf) |
  c4. c8 |
  a16 (g) c8 e, g |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  e g g f |
  a4 f8 g |
  g g e16 (d) g8 |
  c,2 ~ |
  c8 f f g |
  a4 f8 bf |
  g a e g |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lòng quảng đại của Thánh Tâm Chúa Giê -- su
  biểu lộ lòng quảng đại của tình yêu Thiên Chúa,
  là lý do không chuyển lay khiến ta vững lòng trông cậy.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi bị treo tên thập giá, Người xin tha cho bọn lý hình,
      biện hộ cho chúng: vì chúng không biết việc chúng làm.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi bị treo trên thập giá, vừa khi nghe tên trộm khấn cầu
      là Người đoan hứa rằng sẽ chung phúc lộc thiên đàng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Khi bị treo trên thập giá, nhìn môn sinh bên Hiền Mẫu Người
      là lời trăng trối, từ đó ta trở thành con Mẹ.
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
