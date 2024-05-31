% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hiệp Thông Trong Thánh Thần"
  poet = "Ý lời ca: René Pageau"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b8 b |
  g2 |
  a8 a b a16 (g) |
  e4. c'8 |
  c a d cs |
  d2 ~ |
  d4 b8 d |
  c2 |
  a8 a c c |
  b2 ~ |
  b8 a fs fs |
  g2 ~ |
  g4 r \bar "|."
}

nhacPhanHai = \relative c' {
  \key g \major
  \time 2/4
  fs8 g b g |
  e2 ~ |
  e8 e fs d |
  g4 g8 g |
  fs g b e, |
  a4. a8 |
  d,2 |
  d'8 c c c |
  a8. b16 d8 g, |
  a4. a8 |
  a g e g |
  a8. d,16 g8 fs |
  g2 ~ |
  g4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa Thánh Thần cho ta những phương tiện để trở thành anh chị em.
  Ngài quy tụ và gìn giữ chúng ta trong tình hiệp thông.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài cho phép ta gọi Thiên Chúa là Cha,
      nhưng ta gọi Thiên Chúa là Cha sao được
      nếu không trao danh vị cho những thành viên
      ngay trong cộng đoàn của ta là anh chị em.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài liên kết ta thành một thân mình thôi,
      cho ta cùng vui sống, cùng chung hy vọng,
      Phái ta đem Tin Mừng cho khắp trần gian suy vọng,
      hận thù, tan hoang được mau hiệp thông.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
