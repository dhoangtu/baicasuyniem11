% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Cần Biết Đánh Liều"
  poet = "Ý lời ca: Lm. Adolphe Gesché"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  a4. bf8 |
  g f d f |
  g2 ~ |
  g8 g g a |
  f8. e16 d8 d |
  g4 f8 e |
  a4 r8 d |
  d bf bf d |
  g,8. g16 g8 c |
  f,2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 f g f |
  e4. d8 |
  d d g a |
  a4 r8 g |
  f8 a g e |
  d4 d8 g |
  c,2 |
  a'8 g f bf |
  bf4. a8 |
  a c bf16 (c) d8 |
  g,4. c,8 |
  c c a' (g) |
  f2 ~ |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Đức Tin giúp ta dự phòng tương lai,
  nhưng không tránh khỏi quy luật tự nhiên của cuộc sống:
  Nếu muốn phiêu lưu sáng tạo thì cần đánh liều.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Mọi hành vi con người đều nhằm tạo ra cái mới,
      nhưng nào có chi tân kỳ hoặc vĩ đại nếu không được phát xuất từ
      sự can đảm sáng tạo và từ sự đánh liều.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Cuộc đời sẽ chôn vùi và dần triệt tiêu sức sống
      khi từ chối nuôi hy vọng và đánh liều,
      nếu không liều tiến bước và lòng tin tưởng vững vàng
      dù đường dài tối mù.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
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
