% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hướng Về Chúa Mọi Lúc"
  poet = "Ý lời ca: Pseudo-Macaire"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  g8 e d b' |
  b4. b8 |
  g g g (a) |
  b g c a |
  d4 r8 e |
  e d d c |
  b4. b8 |
  c a a d |
  g,2 ~ |
  g4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b8 b |
  a a b e, |
  e4. e8 |
  a a fs (e) |
  d4 r8 g |
  g g fs (g) |
  a4 b8 b |
  a a d fs, |
  g2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy khơi động ý chí,
  thúc giục tình cảm hướng về Chúa mọi lúc.
  Hãy vững tâm trông đợi Ngài,
  mau mắn làm đẹp ý Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúa thấy ta mau mắn tìm Ngài,
      Ngài tức khắc xuất hiện,
      ra tay bang trợ ta,
      giúp sức ta vinh thắng địch thù.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa thấy ta yêu mến trọn niềm
      và tín thác nơi Ngài,
      ban ơn thiêng chở che,
      tiến bước đồng hành khắp mọi nơi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chúa thấy ta tuân giữ trọn vẹn mọi huấn giới của Ngài,
      ngay khi ta nguyện xin, Chúa lắng nghe va khấng nhậm lời.
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
