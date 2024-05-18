% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Lạy Đấng Khôn Ngoan"
  poet = "Ý lời ca: Thánh Tôma Aquinô"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4. c8 a'16 (bf) a8 |
  g4 f8 g |
  d4. c8 |
  c c g' e |
  f2 ~ |
  f8 c a'16 (bf) a8 |
  g4. g8 |
  f f f d' |
  d4. c8 |
  c bf g g |
  g4 e8 c |
  g' (a g4 ~ |
  g8) g e f |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 f |
  f4. f8 |
  e e f d |
  c4 r8 a' |
  bf bf a f |
  g4. g8 |
  a e f g |
  \grace { d16 (f } d4.) d8 |
  c a' g a16 (g) |
  f2 ~ |
  f8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lạy Chúa Giê -- su, niềm hoan lạc và là sự sống của con.
  Thần trí con đây luôn nhiệt thành tìm kiếm Chúa,
  luôn mong mỏi gặp được Ngài,
  Ôi lạy Đấng rất mực khôn ngoan.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Xin cho con không cầu kỳ trong khiêm hạ,
      không phóng túng trong niềm vui,
      không cứng cỏi khi khắc khổ,
      không ủ rũ trong nỗi buồn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Xin cho con không tuyệt vọng khi lo sợ,
      luôn nói rõ không vòng vo,
      khi dẫn dụ không nóng nảy,
      trong sạch chẳng vương vết nhơ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
      \set stanza = "3."
      Xin cho con trong đạo hành không khoe mình,
      đau đớn cũng không thở than,
      thương mến thật không dối giả,
      vâng lời chẳng tranh cãi gì.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Xin cho con không ủ dột khi chay tịnh,
      khi bố thí không thổi loa,
      khi khấn cầu luôn kín cửa,
      mong mình Chúa hay biết thôi.
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
