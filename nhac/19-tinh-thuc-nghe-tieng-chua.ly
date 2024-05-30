% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Tỉnh Thức Nghe Tiếng Chúa"
  poet = "Ý lời ca: Chân Phước Elisabeth Chúa Ba Ngôi"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 4 c8 e |
  f8. f16 d8 e |
  b'2 ~ |
  b8 b b c |
  a8. a16 c8 c |
  d4. d8 |
  e8. a,16 a8 a |
  c4 a8 a |
  c (b) a (b) |
  e,8. d16 e8 e |
  c' (b) a (b) |
  a2 ~ |
  a8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  \partial 4. a8 g g |
  g4 f8 g |
  e4. c8 |
  f (e) a b |
  b2 ~ |
  b8 e d d |
  e4 c8 d |
  b8. c16 e,8 c' |
  c (b) a b |
  a2 ~ |
  a4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Này tôi đứng trước của mà gõ,
  Ai nghe tiếng tôi mà mở của ra,
  tôi sẽ vào nhà người ấy và dùng bữa với họ
  và họ dùng bữa với tôi.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Phúc thay đôi tai của tâm hồn tỉnh thức nghe tiếng Chúa,
      Phúc thay đôi mắt của tâm hồn thấy được Chúa đến trong đức tin.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa luôn mang theo những kho tàng tặng kẻ trông Chúa đến,
      Chúa luôn mau đến và khơi lại những giờ, những phút vui sống liên.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chính nơi thâm sâu của tâm hồn thành khẩn xin Chúa đến,
      Chúa ban ân phúc và an bình, khiến hồn với Chúa thân thiết luôn.
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
