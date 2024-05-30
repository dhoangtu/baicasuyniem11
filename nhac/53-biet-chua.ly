% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Biết Chúa"
  poet = "Ý lời ca: Một Đan sĩ GH. Phương Đông"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 8 c8 |
  e e d d |
  f4. d8 |
  g g e e |
  a4 r8 c |
  b b d e |
  e4. e8 |
  d a16 (b) g8 d' |
  c2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  e8 f d (e) |
  c4. g'8 |
  a fs fs g |
  g4 r8 c |
  c c b c |
  d4. e8 |
  d4 r8 e |
  e2 |
  b8 c e, f |
  g4. a8 |
  g4 r8 d |
  g g g b, |
  c2 ~ |
  c4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Dù ra công học về Chúa, dù nghe bao lời dạy dỗ,
  ta thực sự chưa biết Chúa nếu chưa cảm nghiệm trong lòng.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ta biết rõ Ngài như biết một bạn thân chăng?
      Hay như hai người yêu nhau biết nhau?
      Muốn biết như Đấng ngự trong ta biết ta thì hãy cứ đến mà xem.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi đã thấy Ngài, ta hãy tìm ngài luôn luôn,
      ta không ngơi tìm hiểu cho biết thêm,
      mãi tới ngày cuối cùng của ta mới thôi,
      là lúc thấy suốt về Ngài.
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
    \override LyricHyphen.minimum-distance = #1
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
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
