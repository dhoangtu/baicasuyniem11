% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Tiến Dâng Thân Mình"
  poet = "Ý lời ca: Joseph Gélineau"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  b8 b a a |
  g2 |
  fs8 fs b b |
  e,4. a8 |
  d,4. d8 |
  g4 a |
  b r8 b |
  g c c c |
  e,4. d16 (e) |
  a4 b16 (a) g8 |
  g2 ~ |
  g4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key g \major
  \time 2/4
  \partial 8 fs8 |
  fs fs fs b |
  b4 g8 g |
  b b c b |
  a4. g8 |
  fs4 b8 e, |
  e2 ~ |
  e8 e
  <<
    {
      \voiceOne
      e8
    }
    \new Voice = "splitpart" {
      \voiceTwo
      \once \override NoteColumn.force-hshift = #-1.5
      \tweak font-size #-2
      \parenthesize
      g8
    }
  >>
  \oneVoice
  d |
  g4 a8 b |
  b2 |
  b8 c a a |
  d4 a8 a |
  g2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy tiến dâng thân mình làm của lễ sống động,
  thánh thiện đẹp lòng Thiên Chúa.
  Đó là cách thức xứng hợp để ta kính thờ Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Nhờ mầu nhiệp và Bí tích, được phục sinh trong Chúa Ki -- tô,
      con người đã nhận được đôi tai để nghe Thiên Chúa nói,
      đôi mắt để nhìn ngắm vinh quang Ngài.
      
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Nhờ mầu nhiệp và Bí tích, được phục sinh trong Chúa Ki -- tô,
      con người đã nhận được tay giơ nhẹ lên kêu khấn Chúa,
      chân sẵn sàng nhịp bước đi theo Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Nhờ mầu nhiệp và Bí tích, được phục sinh trong Chúa Ki -- tô,
      con người đã nhận được đây \markup { \italic \underline "mũi" }
      ngửi hương khi Chúa tới,
      đây lưỡi để cảm nếm bao ngon ngọt.
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
