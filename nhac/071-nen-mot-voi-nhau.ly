% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Nên Một Với Nhau"
  poet = "Ý lời ca: Thánh Gioan Kim Khẩu"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f4. e8 |
  a2 ~ |
  a8 g d f |
  e (f) bf a |
  g4 f8 g |
  f (e4) g8 |
  a2 |
  r8 g d d |
  f4. f8 |
  d g e a |
  a2 |
  g16 (bf) g8 a g |
  f4. a8 |
  e4 r8 e |
  a e c e |
  d4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 a8 |
  d,4. f8 |
  e4. e8 |
  g f e g |
  a4. bf8 |
  a f g f |
  e4 r8 d |
  f e d a' |
  a4. a,8 |
  e' e f c |
  d2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Khi hiệp lễ ta thành thân thể Chúa Ki -- tô, một thân thể duy nhất.
  Như nhiều hạt lúa kết thành nên một tấm bánh,
  chẳng còn chi phân biệt mỗi hạt vì đã nên một với nhau.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Tất cả chúng ta cùng tham dự một tấm bánh,
      đã nên một thân thể rồi,
      hãy có chung một đức ái làm dây liên kết bền lâu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Mỗi người chúng ta đều đã nhiệm hiệp trong Chúa
      hãy luôn cùng nhau nên một,
      Đã uống chung một chén thánh, đừng phân ly cách biệt nhau.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Tín đồ Chúa xưa một trái tim, một tâm trí
      khiến bao người luôn cảm phục,
      Rầy hãy chung lòng, nhất trí làm vinh danh Chúa mọi nơi.
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
