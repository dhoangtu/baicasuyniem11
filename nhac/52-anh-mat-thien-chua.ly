% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ánh Mắt Thiên Chúa"
  poet = "Ý lời ca: Nt Véronique Thíebaut"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4. g8 g e |
  f4 d8 a' |
  g4. c,8 |
  f d g a |
  a4 r8 a |
  e' b c d |
  g,4. a8 |
  d, f e d |
  c2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  c8 c f f |
  d4 a'8 g |
  g4 r8 f |
  a g e f |
  \grace { d16 (e } d4) c8 c |
  f8 e d d |
  g4. g8 |
  a16 (b) a8 a g |
  c2 ~ |
  c8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ánh mắt Thiên Chúa nhìn chúng ta,
  Ngài thấy mà không xét đoán,
  Ngài thấy và lên tiếng gọi mỗi người chúng ta lên đường.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài liều lĩnh đánh cuộc với tương lai,
      dành chỗ cho sự biến đổi,
      Ngài cời trói cho sự tự do và dẫn ta đi thật xa.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Điều gì thấy tốt đẹp ở nơi ta, ngài đã khơi dậy tất cả,
      vì Ngài những hy vọng vào ta và mãi yêu thương nhìn ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Học Ngài ánh mắt nhìn với anh em luôn thiết tha và mẫn cảm,
      từng người Chúa trao thuộc về ta,
      hãy ngắm trông trong tình yêu.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
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
