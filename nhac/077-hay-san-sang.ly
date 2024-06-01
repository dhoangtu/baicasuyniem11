% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Sẵn Sàng"
  poet = "Ý lời ca: Philippe Baud"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4 a8 a |
  f8. a16 d,8 f |
  e4 c'8 c |
  a8. a16 c8 a |
  b4 b8 d |
  e4. e8 |
  c8. e16 c (b) a8 |
  b4. e,8 |
  c' (b) g g |
  a2 ~ |
  a4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  \partial 4 e8 a |
  f4 (e8 a) |
  b4 b8 b |
  b8. c16 b8 a |
  g4 d'8 d |
  d8. c16 d8 e |
  a,4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy sẵn sàng, hãy tỉnh thức liên,
  hãy đứng dậy hãy ngẩng đầu lên,
  vì Thiên Chúa có thể đến trong đời ta mọi lúc và mọi nơi.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài có thể đến ngay ban đêm cũng như ban ngày,
      khi hân hoan hoặc khi bất hạnh.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài có thể đến, khi phong lưu, có khi cơ cùng,
      khi vô tâm hoặc khi sẵn sàng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ngài có thể đến khi tuyên ngôn, có khi thinh lwajng,
      nơi kinh doanh hoặc trong thánh đường.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài có thể đến khi ta không nghĩ suy trông đợi
      qua bao nhiêu phục trang khác biệt.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
