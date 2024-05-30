% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Nhận Bánh Này"
  poet = "Ý lời ca: Sebastian de Horozco"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 3/4
  a2 f4 |
  d4. c8 e (g) |
  f2. |
  f4. bf8 bf g |
  c2 d4 |
  bf4. d8
  <<
    {
      \voiceOne
      \once \stemDown d4
    }
    \new Voice = "splitpart" {
      \voiceTwo
      \once \override NoteColumn.force-hshift = #1.5
      \tweak font-size #-2
      \parenthesize
      c
    }
  >>
  \oneVoice
  g2 g4 |
  g e c |
  f2 g4 |
  a2. \bar "||"
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 3/4
  f2 d4 |
  c4. f8 \grace e16 (f8)
  <<
    {
      a8 |
      g2 c4 |
      d4. d8 d bf |
      bf4. c8 d4 |
      g,2 a4 |
      a f d |
      g2
    }
    {
      f8 |
      c2 a'4 |
      bf4. bf8 bf f |
      g4. a8 f4 |
      e2 f4 |
      f d c |
      b!2
    }
  >>
  <<
    {
      \voiceOne
      g'8 _(a)
    }
    \new Voice = "splitpart" {
      \voiceTwo
      b,4
    }
  >>
  \oneVoice
  c2. |
  c4 (d)
  <<
    {
      e4 |
      g2 g4 |
      f2. \bar "|."
    }
    {
      c4 |
      bf2 bf4 |
      a2.
    }
  >>
}

% Lời
loiPhanMot = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hỡi con người, hãy nói đi,
      Bạn có muốn được sống,
      Hãy nhận tấm bánh này,
      Bánh có vị ngọt của Thiên Chúa.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
	    Bánh bởi trời được khấng ban
	    hầu cứu sống tội nhân.
	    Dưới mầu trắng \markup { \underline \italic "tinh" } tuyền
	    Giấu kín mầu nhiệm thật ca quý.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
	    Suốt cả đời trần thế đây,
	    Người sốt sắng nhận lãnh với lòng xứng đáng thật
	    sẽ sống muôn đời thật vinh phúc.
    }
  >>
}

loiPhanHai = \lyricmode {
  Ôi mầu nhiệm cả cả biết bao:
  Thiên Chúa đã muốn ở lại trong bánh này
  Với tất cả quyền uy của Ngài để nuôi sống chúng ta.
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
  page-count = 1
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
