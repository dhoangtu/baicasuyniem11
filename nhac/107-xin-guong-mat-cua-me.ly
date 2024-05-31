% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Gương Mặt Của Mẹ"
  poet = "Ý lời ca: Pierre Pythoud"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  c8 c g' g |
  g4 g8 g |
  f f a f |
  e4. a8 |
  f d d df |
  c4 f8 a |
  g4 r8 b |
  c c b c |
  a4 c8 c |
  g g f a |
  g4. g8 |
  a f d c |
  c2 ~ |
  c4 r \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  e8 f d e |
  e2 |
  f8 g d d |
  d4 d16 (e) d8 |
  c4 r8 d |
  c c f d |
  g4. f8 |
  a a f e |
  d2 ~ |
  d4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lạy Mẹ Ma -- ri -- a, xin gương mặt rạng rỡ của Mẹ
  biến đổi bộ mặt u sầu của chúng con.
  Xin nắm lấy tay chúng con, giúp chúng con liên hệ với nhau
  trên khắp mọi nẻo đường đời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngay dưới chân Thánh giá khi chấp thuận làm Mẹ của nhân loại
      Gương mặt Mẹ vẫn rạng rỡ,
      đầy sức sống của Con mình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Xin giúp con cái Chúa mau xóa tận tuyệt được những ti tiện,
      mở lòng nhận lãnh sự sống hầu kết mối dây huynh đệ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Vui sống trong đức ái, chung góp phần tạo dưng thế gian này,
      đảo lộn vì bao thù oán, tìm kết ước trong thân tình.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.7
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
