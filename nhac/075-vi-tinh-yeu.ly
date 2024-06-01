% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Vì Tình Yêu"
  poet = "Ý lời ca: Thánh Clément thành Rôma"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4. g8 c, c |
  e4 f8 e |
  d4. e8 |
  c a' a fs |
  g4. f8 |
  d d f f |
  e2 |
  b'8 c c c |
  a4. f8 |
  a g e f |
  d4. d8 |
  a' b a g |
  c2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  c8 e f e |
  d4. a'8 |
  a a fs g |
  g4 r8 g |
  a8 g g e |
  a4. a16 (b) |
  g8 (b) d d |
  c2 ~ |
  c8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chính vì tình yêu, Chúa Giê -- su đã đổ hết máu mình ra
  rửa sạch tội lỗi chúng ta.
  Theo thánh ý Chúa Cha, Ngài hiến dâng sự sống mình
  hầu cho chúng ta được sống.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Tình yêu Chúa Giê -- su với những nét đẹp vô song
      nâng chúng ta lên thật cao,
      kết hợp với Chúa Cha.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Tình yêu sẽ khoan dung xóa hết đố kỵ đua tranh,
      san lấp khinh khi nhỏ nhen,
      tác động sống kết thân.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Vì yêu Chúa Giê -- su, hãy giữ huấn lệnh chuyên chăm:
      thương mến anh em thực tâm sẽ đạt tới phúc vinh.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
