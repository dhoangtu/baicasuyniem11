% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Yêu Mến Hội Thánh"
  poet = "Ý lời ca: Đc Denis Wiede"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  b16 (c) a8 b g |
  c4 a8 a |
  d2 |
  c8 c c d16 (e) |
  a,4. fs16 (e) |
  d8 d b' a |
  c4. e,8 |
  e e g a |
  d,4 fs16 (a) g8 |
  g2 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  b8 g4 fs8 |
  b4 b16 (c) b8 |
  a4 g8 g |
  c4. c8 |
  c b a c |
  d2 ~ |
  d8 a16 (c) b8 g |
  a4. c8 |
  a b g fs |
  b4. b8 |
  d, fs fs a |
  g2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy yêu mến Hội Thánh,
  vì Hội Thánh là người mẹ mở đường dẫn vào sự sống của Chúa
  và vào tình yêu đích thực của anh em.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hãy để Hội Thánh mến thương ta,
      vì Hội Thánh có những kho tàng phong phú
      để ban tặng ta nếu ta đến cùng Hội Thánh với lòng đơn sơ biết ơn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chính bởi Hội Thánh
      chúng ta đây nhận sự sống đã phát sinh từ Thiên Chúa
      mỗi khi hiệp thông với ân phúc bởi nhiệm tích,
      với lời ban qua Phúc Âm.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Hoán cải đời sống, hãy canh tân,
      và ngồi xuống đúng chỗ trong nhà Thiên Chúa đã quy định cho,
      những con cái của Hội Thánh vẫn hằng luôn trông ngóng ta.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
