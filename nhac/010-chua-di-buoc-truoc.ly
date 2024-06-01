% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Đi Bước Trước"
  poet = "Ý lời ca: Michel Hubant"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  c8 g g a |
  a4. c,8 |
  f4. f8 |
  f e d a' |
  g4. g8 |
  d' d16 (c) a8 g |
  a2 |
  f8 g a g16 (f) |
  d4. c8 |
  c e g g |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  e2 |
  e8 f16 (a) g8 f |
  d4. d8 |
  d d g e16 (d) |
  c4 f8 f |
  e d a' g |
  g4. g8 |
  f e e a |
  a2 |
  r8 g a f |
  e2 |
  d8 c d f |
  g4. f8 |
  bf a a g |
  c2 ~ |
  c4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa luôn đi bước trước,
  Ngài đến gõ khẽ cửa lòng chúng ta
  gợi ý xác định cuộc hẹn rồi lên tiếng kêu gọi
  vì Ngài thương mến chúng ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ơn gọi cần trải qua giai đoạn một cuộc gặp gỡ thân tình.
      Ta không thể gặp Chúa Ki -- tô như gặp người bạn giữa phố,
      nhưng có thể là một cảm nghiệm tâm linh
      cùng Chúa Ki -- tô hằng sống.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ơn gọi cần trải qua giai đoạn một cuộc gặp gỡ thân tình,
      nhưng khơi dậy từ những trung gian,
      lay động nhẹ nhàng kín đáo do Chúa khởi sự,
      do hoạt động bên trong,
      Thần Khí linh thiêng gợi hứng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
      \set stanza = "3."
      Ơn gọi cần trải qua giai đoạn một cuộc gặp gỡ thân tình:
      Ta tin tưởng là Chúa Ki -- tô luôn mở đường và bước trước,
      tuy biết tỏ tường: ta nào thực trung trinh,
      Ngài vẫn yêu thương chào đón.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.8
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
    \override Lyrics.LyricSpace.minimum-distance = #0.8
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
