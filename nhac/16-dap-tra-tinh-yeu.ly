% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đáp Trả Tình Yêu"
  poet = "Ý lời ca: Patrick Chauvet"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 a8 |
  f d g g |
  a4 c,8 f |
  d8. d16 f8 a |
  g4. f8 |
  g g d g |
  c,4. g'8 |
  g4 c8 g |
  f2 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  a8 g g g16 (f) |
  d4. d8 |
  f f f g |
  c,2 |
  f8 e d g |
  a4 a8 a |
  g g c a16 (g) |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Đáp trả tình yêu Thiên Chúa là để Ngài tràn ngập chúng ta,
  là yêu thương cùng với Ngài, yêu thương giống như Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Muốn yêu thương kiên trì và yêu thương không giới hạn,
      ta phải được Thiên Chúa cho tham dự sự sống của Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa yêu thương muôn người, liều thân hy sinh chính mình,
      mong mọi người theo bước yêu thương thật tuyệt đỉnh như Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chúa luôn luôn yêu cầu là ta yêu thương giống Ngài:
      yêu kẻ thù ta nữa thân thương mọi người dẫu xa lạ.
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
