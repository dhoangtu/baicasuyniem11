% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Đến Nhà Mình"
  poet = "Ý lời ca: Christophe Roucou"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a8. a16 a8 d, |
  d4 d8 c |
  c4. a'16 (bf) |
  g4 c8 f, |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a16 (bf) a8 |
  g4. g8 |
  f f f16 (a) g (f) |
  d4 f8 f |
  f4 c8 a' |
  a4. a8 |
  f f bf g |
  c4 r8 c |
  bf a g c |
  f,2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa đã đến nhà mình nhưng người nhà chẳng chịu đón nhận Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúa Giê -- su đi vào lịch sử nhân loại với bóng tối và ánh sáng:
      Có người tìm đến thờ kính, có kẻ truy lùng ám hại.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa Giê -- su đi vào lịch sử nhân loại, với bóng tối và ánh sáng:
      Có người nhờ đấy vùng đứng, có kẻ do vậy gục ngã.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chúa Giê -- su đi vào lịch sử nhân loại với bóng tối và ánh sáng:
      Có vị hoàng đế sợ hãi, có trẻ thơ bị sát hại.
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
    \override Lyrics.LyricSpace.minimum-distance = #3
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
    \override Lyrics.LyricSpace.minimum-distance = #2.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
