% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ai Yêu Sự Sống Mình"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key bf \major
  \time 2/4
  g8 g f g |
  d4 d8 bf' |
  bf (a) g
  <<
    {
      d' |
      d4 r8 bf |
      a a d g, |
      c4. d8 |
      bf c4 a8 |
    }
    {
      g8 |
      fs4 r8 g |
      fs fs fs f! |
      ef4. d8 |
      g e!4 fs8 |
    }
  >>
  g4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key bf \major
  \time 2/4
  \partial 8 d8 |
  bf'8. bf16 g8 g |
  d'4 d8 ef16 (d) |
  c4. d8 |
  d c bf a |
  a4 r8 d, |
  bf'4 bf8 g |
  d'2 |
  d8 bf c c |
  a4. bf8 |
  g2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ai yêu sự sống mình thì sẽ mất, thì sẽ mất.
  Ai liều mạng sống vì Ta sẽ được sống muôn đời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hạt lúa gieo vào lòng đất không thối đi sẽ mãi trơ trọi một mình.
      Còn nếu nó mục nát sẽ trổ sinh bông hạt muôn nghìn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Người muốn dấn bước mà đến đi với Ta,
      hãy gắng quên bỏ phận mình, và vác lấy thập giá,
      hãy cùng Ta cam chị khổ hình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Người muốn cứu lấy mạng sống nơi thế gian,
      bám lấy danh vọng đời này,
      thì sẽ mất phần phúc Chúa dành cho môn đệ của Ngài.
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
