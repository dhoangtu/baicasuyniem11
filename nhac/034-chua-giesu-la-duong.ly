% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Giêsu Là Đường"
  poet = "Ý lời ca: Lean-Pierre Nave"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 g8 e |
  e4. c8 |
  c f f f |
  d2 |
  c8 f d d |
  g4. f8 |
  e4 e8 g |
  a4 r8 g |
  f4 a8 f |
  g g d g |
  c,2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  r8 c c c |
  e e f f |
  d4 r8 e |
  c c f d |
  g4 f8 a |
  d, d e (d) |
  c2 ~ |
  c4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa Giê -- su là đường dẫn tới Chúa Cha,
  Ngài giữu gìn sự sống của người hằng trung tín,
  cho họ thoát khỏi thay quân thù ngỗ nghịch.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài là đường riêng cho mỗi cá nhân,
      đón nhận từng nỗi buồn chán và mỏi mệt của mỗi người.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài từng vượt qua bao bóng tối tăm,
      lúc mọi sự như lạc mất vì ái ngài và nghi ngờ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Nhiều lần Ngài đưa lưng cõng chúng ta,
      chướng ngại ở trên mặt đất, Ngài cũng dọn sạch cả rồi.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
