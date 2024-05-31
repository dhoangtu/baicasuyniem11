% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Làm Sao Hát"
  poet = "Ý lời ca: Thánh Cyrille d'Alexandie"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 c8 d |
  f4. e8 |
  e g g g |
  a4 f8 f |
  f4. f8 |
  bf8 a g bf |
  c4. d16 (c) |
  a4 r8 g |
  c, c a' (g) |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 e8. g16 |
  g8 f f g |
  a2 |
  g8 f f a |
  bf4. g8 |
  g bf a g |
  c2 |
  c8 bf d (c16 bf) |
  g4. g8 |
  e (d) g c, |
  c4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Làm sao hát bài ngợi ca cho cân xứng,
  Vì nhờ Mẹ toàn thể địa cầu hỷ hoan nhảy mừng,
  Ôi lạy Mẹ Chúa Trời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Mẹ sinh ra mặt trời công chính,
      vương trượng của chân lý,
      Đền thờ không thể tàn phá,
      Ôi Mẹ Chúa Trời, chúng con kính chào Mẹ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Nhờ qua tay Mẹ mà Con Chúa tiêu diệt mọi tăm tối,
      rạng ngời chiếu soi trần thế.
      Ôi Mẹ Chúa Trời, chúng con kính chào Mẹ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Kía bao tông đồ Mẹ thôi thúc loan truyền cùng muôn nước
      đợi chờ phúc ân giải thoát.
      Ôi Mẹ Chúa Trời, chúng con kính chào Mẹ.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
