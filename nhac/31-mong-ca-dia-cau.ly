% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Mong Cả Địa Cầu"
  poet = "Ý lời ca: Paul Claudel"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  \partial 8 c8 |
  d b b c |
  g4 c8 c |
  a4 g8 e |
  e f d a' |
  g4 d'8 e |
  e a, d e |
  c2 ~ |
  c4 r \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  g8 a f e |
  d4. d16 (e) |
  c8 c a' a |
  a2 |
  c8 c b c |
  d4. b8 |
  a g d' e |
  c4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Thiên Chúa tỏ lòng nhân lành với chúng ta,
  Khuôn mặt Ngài tỏ bày khắp nơi trong ánh sáng và muôn phúc lành.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Mong khắp cả địa cầu trở thành đường dẫn tới Chúa,
      Mong sao mọi dân nước thông hiệp tìm ơn cứu độ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Mong hết mọi dân tộc mở miệng đều nói tới Chúa,
      Mong muôn người muôn lối rụng động vì công lý Ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Mong khắp mọi nẻo đường nở rộ tình nghĩa thắm thiết,
      Mong sao tình yêu Chúa điểm tô mặt con cái ngài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Mong ước hiển danh Ngài sẽ ngàn đời chiếu sáng mãi,
      Mong an bình của Chúa sẽ lan tràn dương thế này.
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
