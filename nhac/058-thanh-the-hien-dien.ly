% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Thánh Thể Hiện Diện"
  poet = "Ý lời ca: Maurice Zundel"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  e f a d, |
  d4. c8 |
  f e d d |
  g4 g8 f |
  bf8 a g g |
  g4 bf8 d |
  c4 bf8 bf |
  bf bf d (c16 bf) |
  g8 (c) a g |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  e e e f |
  d4 d8 c |
  c2 |
  f8 d d f |
  g4. f8 |
  bf bf bf g |
  c4 e,8 g |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Không gì trên cõi đời này làm chúng ta yên lòng hơn,
  thanh luyện chúng ta sâu xa hơn là lắng nghe
  sự hiện diện của Thánh Thể trong thinh lặng.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ôi sự hiện diện thinh lặng, không ồn ào, nhưng đợi chờ khôn ngơi,
      làm vươn lên trong lòng ta sự thinh lặng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ôi sự hiện diện dung dị nhưng tuyệt vời,
      luôn rạng ngời tỏa lan Tình yêu vô biên của Chúa tự muôn đời.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ôi sự hiện diện sâu nhiệm, bao diệu kỳ,
      ta trầm lặng để nghe từ nơi con tim của Chúa sự thông hiệp.
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
    \override LyricHyphen.minimum-distance = #1
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
