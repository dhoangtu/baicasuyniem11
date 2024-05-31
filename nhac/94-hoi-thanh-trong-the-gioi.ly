% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hội Thánh Trong Thế Giới"
  poet = "Ý lời ca: Louis Lochet"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 d8 a |
  a4 a8 g |
  b4 g8 g |
  fs fs a b |
  e,4 d8 d |
  b'4 g8 c |
  c4. c8 |
  d a a16 (b) a8 |
  g4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key g \major
  \time 2/4
  \partial 8 fs8 |
  b2 |
  b8 c c b |
  a4 g8 g16 (a) |
  b4 e,8 g16 (a) |
  d,4 d8 d |
  e (g) fs b |
  b4 g8 a16 (b) |
  a4 fs8 g |
  g4. a8 |
  d,2 ~ |
  d8 d' c16 (a) d8 |
  g,4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa Ki -- tô trong Hội Thánh tử nạn và phục sinh mỗi ngày,
  bị nghiền nát và chiến thắng: Niềm hy vọng của gian trần.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hội Thánh trong thế giới hôm nay vừa nhỏ bé, vừa vĩ đại,
      là hạt cải là nhúm muối, là nắm men,
      vì yêu thương Chúa dùng biến đổi vũ trụ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hội Thánh trong thế giới hôm nay bị đuổi bắt,
      bị bách hại, bị chà đạp, bị cấm cách, bị tấn công
      mà luôn luôn sống động, vẫn rạng rỡ hoài.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Hội Thánh trong thế giới hôm nay hằng để ý,
      hằng đỡ đần người nghèo khổ, người yếu thế, người ốm đau
      và cao rao sứ điệp: Chúa thương mến họ.
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
