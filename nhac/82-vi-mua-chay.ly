% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Vì Mùa Chay"
  poet = "Ý lời ca: Abbé Jules Builard"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 c8 (d) |
  a'4. bf8 |
  g g f (g) |
  a4. f8 |
  f g e f |
  d4 d8 e16 (d) |
  c4. a'8 |
  g4 a8 f |
  bf g16 (bf) d8 c |
  c4. d8 |
  d bf bf bf |
  g4. c8 |
  f,2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  r8 f4 e8 |
  a4 g8 a |
  f g e f |
  d4 d8 c |
  f4. e8 |
  d d g a |
  a2 ~ |
  a4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lạy Chúa, chúng con ca tụng Chúa vì thời gian Mùa Chay này,
  là con đường dẫn lên lễ Vượt Qua của Đức Ki -- tô
  tiến đến vinh quang chung cuộc của Người.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Vinh tụng Chúa không cắt bỏ cây sậy đã giập,
      không dập tắt tim đèn còn vương chút khói.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Vinh tụng Chúa không nỡ nhỏ cây cằn khô rồi,
      nhưng đợi nó may còn trổ hoa kết trái.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Vinh tụng Chúa luôn nhẫn nại không đành xua từ
      cho dù thấy công nghiệp đoàn con quát ít.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Vinh tụng Chúa ban phát thời gian hồng phúc này
      tiêu diệt hết bao tội lụy, bao tính xấu.
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
