% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ngôi Lời Mặc Xác Phàm"
  poet = "Ý lời ca: René Pageau"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  e e a a |
  d,4 r8 e |
  f4. c8 |
  c4 c8 c |
  a' g16 (a) bf8 a |
  f4. f16 (a) |
  g4. c,8 |
  g'16 (a) g8 g \grace g16 (c8) |
  f,2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a16 (bf) a8 |
  g4 g8 e16 (f) |
  g8 d d16 (e) c8 |
  f4 c8 g' |
  a4. a8 |
  f f bf a |
  g4 g8 e16 (f) |
  g4 g8 c |
  c e, g a16 (g) |
  f2 ~ |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ngôi Lời mặc lấy xác phàm: Thiên Chúa làm người.
  Người mặc lấy bản tính nhân loại của tôi và đến thăm tôi mỗi ngày.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ở Be -- lem, thân trẻ thơ, Người chẳng làm chi,
      Mà ai đến cũng nhìn nhận Đấng Thiên Sai,
      tin tưởng luôn và cất tiếng truyền rao lẫy lừng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa trông mong nơi thẳm sâu tận cõi lòng tôi,
      Người thăm viếng giống ngày nào ở Be -- lem,
      êm ả thôi mà cứ thắm nồng thêm mỗi ngày.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Đức Ki -- tô đang ở trong lịch sử đời tôi,
      Người mang lấy gánh nặng của xác thân tôi,
      bao phủ tôi bằng ánh sáng thần thiêng của Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Quá cao siêu, tôi chẳng khi nào hiểu được đâu:
      Tình yêu Chúa quá nhiệm mầu đến vô biên,
      tôi chỉ xin được tín thác mà suy gẫm hoài.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.8
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
