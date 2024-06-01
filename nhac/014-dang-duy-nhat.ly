% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đấng Duy Nhất"
  poet = "Ý lời ca: A. Chouraqui"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 c4 |
  a'4. f8 |
  a bf4 a8 |
  g4 r8 f |
  c' d bf4 ~ |
  bf8 bf g g |
  c4. g8 |
  a4 c,8 g' |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 a |
  bf4. g8 |
  f e e (g) |
  a4. f8 |
  d d f g |
  c,4 r8 g' |
  a f a bf |
  bf4. c8 |
  bf g g e |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lạy Chúa là Thiên Chúa của con,
  Ngài thương xót con,
  Chỉ Ngài là Đấng Duy Nhất và chân thật.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Sự Duy Nhất không thể nào dò thấu,
      không định hình, không giới hạn,
      không bắt đầu, không kết thúc,
      không khởi nguyên, không tận cùng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Sự Duy Nhất không thể nào hiểu thấu,
      không điều gì so sánh được,
      không lẫn lộn, không kết nối,
      không thể chia ly biệt phân.
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
