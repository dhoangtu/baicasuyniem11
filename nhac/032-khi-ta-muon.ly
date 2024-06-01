% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Khi Ta Muốn"
  poet = "Ý lời ca: Albert-Marie Bessard"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4. a8 f f |
  bf4 g8 e |
  e g f d |
  c2 ~ |
  c8 d bf' bf |
  \grace g16 (a4) g8 f |
  e g g f |
  a4 r8 g |
  g d' c bf |
  a2 |
  a8 c f, f16 (g) |
  d4. d8 |
  c e g e |
  f2 ~ |
  f4 r \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  a8 e f g |
  a2 |
  g8 e16 (f) g8 d |
  c8. a'16 bf8 bf |
  g4 c8 a |
  c f, f16 (a) d,8 |
  g4 g8 a |
  a c, e (g) |
  f2 ~ |
  f8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa đề nghị trước nhưng chờ đợi chúng ta mở lòng,
  Ngài đến gõ cửa, nhưng chỉ vào khi ta chào đón,
  Ngài gọi chúng ta theo Ngài,
  nhưng chỉ thực hiện được khi nào ta muốn mà thôi.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúa mạc khải chân lý, nhưng chỉ đón nhận được khi có đức tin,
      Đức tin chính là mở lòng ra xin Chúa đến gặp gỡ ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa tràn đổ ân phúc, nhưng chỉ thấm nhập vào ai có đức tin,
      Đức tin chiếu dọi cả trần gian cho đức ái vượt trổi lên.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chúa mời gọi ta tới, nhưng chỉ bước theo Ngài khi có đức tin,
      Đức tin giống hạt cả mà thôi dư sức chuyển rời núi non.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
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
