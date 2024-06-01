% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chỉ Người Nào Yêu"
  poet = "Ý lời ca: Francois Varillon"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f16 (g) a8 d, d |
  g2 ~ |
  g8 a a f |
  bf4 r8 bf |
  bf bf d g, |
  a4 bf8 g |
  c2 ~ |
  c8 e, e g |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 bf8 a |
  a2 ~ |
  a8 a bf bf |
  g4. g8 |
  a f f16 (a) d,8 |
  e2 |
  g8. f16 g8 a |
  bf2 ~ |
  bf8 c e, e |
  f2 ~ |
  f4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chỉ có người nào yêu mới đang hiện hữu,
  vì chỉ người ấy tự do,
  chỉ người ấy là một con người.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúa Giê -- su yêu mến Chúa Cha
      nên đã tự hủy mình đi, vâng lời cho đến chết,
      chết vì tình yêu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa Giê -- su yêu mến thiết tha
      nên thắng vượt tử thần luôn,
      Xuôi người gieo ân phúc chỉ vì tình yêu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chúa Giê -- su thương mến chúng ta
      nên đã nhập thể vì ta,
      cam chịu bao đau đớn chết đền tội ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Đến phiên ta, yêu mến Chúa không?
      Mau hãy từ bỏ mình đi,
      vui lòng mang thánh giá bước cùng Ngài luôn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Chúng ta mang bao thứ vấn vương,
      đâu có được hưởng tự do,
      nên thực ta đâu biết mỹ vị tình yêu.
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
