% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Gợi Lên Lời Ngợi Ca"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  a'4 g8 (a) | f2 ~ |
  f8 e16 (f) g8 g |
  a4 f8 d |
  g4 r8 g |
  f bf g bf |
  c4 bf8 d |
  c c a16 (g) f8 |
  g2 ~ |
  g8 d16 (g) e8 d |
  c8. a'16 bf8 g |
  a4. g8 |
  g g e e |
  f2 ~ |
  f8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4. e8 f d |
  c4. c8 |
  a' f a bf16 (a) |
  g2 |
  f8 g g f16 (g) |
  a2 ~ |
  a8 f a g16 (f) |
  d2 ~ |
  d8 d d16 (f) d8 |
  c4. f8 |
  e e16 (f) d8 g |
  a4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lạy Chúa Thánh Thần, Chủ nhân thiêng thánh của hồn con,
  Xin gợi lên lời ngợi ca từ trái tim đến môi miệng con
  để con ca tụng Thiên Chúa tình yêu trong tương quan và hiệp thông.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Xin chúc tụng Ngài, lạy Chúa là Cha chúng con,
      vì Con Cha đã đến ở giữa nhân loại
      hiện tỏ khuôn mặt con người của tình âu yếm.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Xin chúc tụng Ngài, lạy Chúa là Cha chúng con
      vì Cha tuôn đổ xuống ơn Thánh Linh Ngài
      đầy các tâm hồn soi gọi trở về bên Chúa.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Xin chúc tụng Ngài, lạy Chúa là Cha chúng con
      vì bao nhiêu lộc phúc đà lãnh nhận
      từ Hội Thánh của Ngài hay từ những thần dân Chúa.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Xin chúc tụng Ngài, lạy Chúa là Cha chúng con
      vì tương quan tình mến Ngài đã khơi dậy
      thực rất diệu kỳ đang đợi những lời trả đáp.
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
