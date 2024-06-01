% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Về Nơi Bản Thân"
  poet = "Ý lời ca: Marie Eugène de l'Enfant Jesus"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 g8 fs16 (g) |
  e8 g fs16 (g) a8 |
  a4. g16 (a) |
  b8 b b c16 (b) |
  a4 r8 g |
  fs4. b8 |
  e,8. a16 a8 a |
  d,4. d8 |
  a'8. g16 fs8 g |
  g2 ~ |
  g4 r \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  g8. b16 e,8 g |
  a4. g8 |
  fs fs g b |
  e,4. d8 |
  b' g c b |
  a2 ~ |
  a8 a a a |
  c4 d8 d |
  g,2 ~ |
  g4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Khi trở về trong bản thân ta để xem ta đang ở đâu,
  tiên vàn hãy tìm đến Chúa Thánh Thần,
  Ngài vẫn đang ngự trong ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài vẫn ngự trong ta như một người bạn chí tình
      và như vị khách thân thương
      đồng hành cùng ta mỗi bước đường.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài vẫn ngự trong ta trong từng nhịp thở sống động
      và qua từng phút suy tư,
      tràn đầy tình yêu xuống trí lòng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ngài vẫn ngự trong ta qua từng lời của Giáo Hội
      và qua từng tiếng lương tâm
      chỉ dạy để ta sống đích thực.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài vẫn ngự trong ta,
      ta hãy cầu khẩn với Ngài,
      Ngài sẽ dọi sáng ta luôn,
      vực dậy hồn ta lúc lỗi lầm.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
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
