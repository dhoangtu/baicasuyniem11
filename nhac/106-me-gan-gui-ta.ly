% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Mẹ Gần Gũi Ta"
  poet = "Ý lời ca: Đức Bênêdictô XVI"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4. d8 b b |
  b4 g8 a |
  a16 (g) e8 e4 ~ |
  e8 e16 (fs) d8 a' |
  b g g b |
  c4. b8 |
  a d fs, a |
  g2 ~ |
  g4 r \bar "|."
}

nhacPhanHai = \relative c' {
  \key g \major
  \time 2/4
  fs8 fs g a |
  b4 g8 c |
  c b c e |
  a,4 r8 a |
  fs4. fs8 |
  fs g e fs |
  d2 |
  d8 fs a a |
  g2 ~ |
  g8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Đức Ma -- ri -- a được vinh thăng về trời
  ở cùng Thiên Chúa và trong Thiên Chúa
  nên Mẹ rất gần gũi ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Là Mẹ Con Thiên Chúa,
      Mẹ tham gia quyền năng của Ngài,
      thông phần vào lòng nhân hậu của Ngài
      mà thương mến chúng ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngày còn ở dương thế Mẹ thân quen chỉ một ít nguyoiwf,
      Bây giờ được về hiển trị trên trời,
      Mẹ thương hết chúng nhân.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Mẹ dạy ta ghi nhớ và siêng năng tìm hiểu rõ ràng,
      suy niệm từng lời Con Mẹ chỉ dạy
      và tuân giữ tín trung.
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
