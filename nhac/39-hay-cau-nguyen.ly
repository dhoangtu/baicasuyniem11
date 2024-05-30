% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Cầu Nguyện"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a8 f f g |
  d4 g8 c, |
  c4 r8 f |
  f e d (g) |
  a4 f8 f |
  bf4. bf8 |
  bf4. c8 |
  f, g d4 ~ |
  d c8 g' |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 e |
  d g g g |
  a4. f8 |
  bf bf bf (a) |
  g4 r8 a |
  g f g g16 (f) |
  d4. c8 |
  g' f e g |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Muốn luyện tập hy vọng, hãy cầu nguyện.
  Biết lắng nghe lời Chúa và truyện vãn với Chúa
  sẽ làm hy vọng bừng sáng lên.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Nếu không còn ai nghe tôi nữa
      thì Chúa vẫn lắng nghe.
      Nếu không còn ai tâm sự thì Chúa luôn chờ ủi an.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Nếu không còn mong ai nâng đỡ vì quẫn bách lớn lao:
      Chúa luôn đầy dư uy lực và nhất tâm trợ giúp ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Những khi cô dơn muôn nỗi, tìm đến Chúa khấn xin,
      Chúa đâu mặc ta đơn độc, Ngài thắp hy vọng sáng lên.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
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
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
