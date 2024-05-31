% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đêm Giáng Sinh"
  poet = "Ý lời ca: Tommy Scholtès"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key bf \major
  \time 2/4
  f8 g d (g) |
  a4. bf8 |
  bf a g c |
  c2 |
  bf8 a d d |
  d4. ef16 (d) |
  c4 r8 bf |
  c c a d |
  g,2 ~ |
  g4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key bf \major
  \time 2/4
  \partial 4 g8 a |
  g4 g8 d |
  bf' bf bf g |
  a2 ~ |
  a8 g a f |
  f g16 g d8 d |
  bf'4 r8 c |
  bf bf d g, |
  a8. f16 g8 g |
  d4. c16 (d) |
  a'8 a f g |
  g2 ~ |
  g4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hài Nhi nhỏ bé đã giáng sinh tại Be -- lem,
  Tỏ hiện giữa bóng tối thế gian và trong tâm hồn mỗi người.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Đêm Giáng Sinh, ta quỳ gối trước Chúa Hài Nhi,
      theo các mục đồng, theo ba nhà đạo sĩ.
      Nhưng đừng dừng mãi ở đây mà mau lên đường
      tỏa sáng với lòng hân hoan.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Đêm Giáng Sinh, đêm hồng phúc chiếu sáng mọi nơi,
      đêm thánh tuyệt vời, đêm giao hòa trời đất,
      Tin Mừng của Chúa tình thương giục ta
      lên đường quảng bá tới người muôn phương.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Đêm Giáng Sinh, khi được ánh sáng Chúa rạng soi,
      ta hãy mở lòng cho Tin Mừng nhuần thấm,
      cho từng động thái đời ta
      đều in sâu đậm khoảnh khắc đất trời giao duyên.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
