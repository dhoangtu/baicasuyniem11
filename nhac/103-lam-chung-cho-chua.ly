% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Làm Chứng Cho Chúa"
  poet = "Ý lời ca: Hồng y Jean-Pierre Ricard"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  c8 a f g16 (f) |
  d4. c8 |
  a'4 f8 f |
  g4. bf8 |
  a4 r8 f |
  g a d, f |
  e4. e8 |
  a d, g g |
  c4. a8 |
  bf4 g |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  g4 bf8 a |
  a2 ~ |
  a8 bf bf bf |
  g4 r8 a |
  g g f16 (e) a8 |
  a4. bf8 |
  bf4. g8 |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúng ta được kêu mời làm chứng về tình yêu Chúa Cha,
  tình thân hữu của Chúa Con
  và sức mạnh Chúa Thánh Thần cho khắp nhân trần.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Tình yêu Đức Ki -- tô thúc bách chúng ta,
      chúng ta không thể tránh né tiếng Chúa kêu mời.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Học theo Chúa Giê -- su Đấng đến thế gian đã hy sinh
      nhận thánh giá cứu rỗi muôn người.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Được ơn Chúa sai đi, hãy quyết dấn thân chiếu soi
      cho cả thế giới anh sáng Tin Mừng.
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
