% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Tiếng Chúa"
  poet = "Ý lời ca: Francois-Xavier Amherdt"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  f d c g' |
  a4. f8 |
  c' c c c |
  a a bf bf |
  g4 f8 g |
  d d f g |
  c,2 |
  g'8 g g f |
  bf4. a8 |
  g g c e, |
  f2 ~ |
  f4 r \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  bf8 bf g a |
  a4. f8 |
  e e g a |
  d,2 |
  d8 d c c |
  a'4. bf8 |
  a a bf bf |
  g4. g8 |
  bf8 bf4 c8 |
  f,4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Tiếng nói Con Một Thiên Chúa hợp với tiếng nói Chúa Cha
  trong Chúa Thánh Thần tạo nên một hợp âm trắc tuyệt,
  Ba âm thanh hòa lẫn trong bài hợp xướng tuyệt luân.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hãy lắng nghe tiếng Chúa để được hiệp thông với Người.
      Thanh âm từ lời Chúa toát ra
      âm sắc thánh thiêng làm say mê cõi lòng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Tiếng Chúa xưa đã phán phải được lừng vang đất trời,
      Mong ta cùng hợp tác tiếp âm
      cho khắp đó đây cùng hân hoan đón nhận.
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
