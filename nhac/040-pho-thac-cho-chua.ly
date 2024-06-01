% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Phó Thác Cho Chúa"
  poet = ""
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4. g8 fs g |
  g8. e16 d8 b' |
  b4 r8 b |
  c c a a |
  d4. e8 |
  e8. a,16 a8 b |
  b4. b8 |
  c4 a8 d |
  g,2 ~ |
  g8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4. b8 b c |
  a4 a8 b |
  e, d g fs16 (g) |
  b2 |
  c8 c c a |
  a4 d8 d |
  fs8. e16 d8 a |
  g2 ~ |
  g8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Xin làm cho con mọi điều Chúa muốn,
  con phó thác con cho Chúa,
  Chúa muốn làm gì cho con,
  con cũng xin cảm tạ.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Con không lắng lo, không tức giận và không vội vã,
      bất chấp những bồn chồn, những xáo trộn của người đương đại.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Con không lắng lo, không tức giận và không vội vã,
      lướt thắng những cuồng nhiệt, những khiếp sợ trong lòng con người.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Con không lắng lo, không tức giận và không vội vã,
      chống đối những dại dột, dứt khoát loại mọi điều vô dụng.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
