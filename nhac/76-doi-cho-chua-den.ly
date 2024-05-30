% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đợi Chờ Chúa Đến"
  poet = "Ý lời ca: Yves Congar"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 g8 |
  a a g e |
  d4. d8 |
  <<
    {
      b'8 c c a |
      d4 d8 b |
      c2 |
      a8 a a d |
    }
    {
      g,8 a a g |
      fs4 fs8 g |
      e2 |
      fs8 fs fs fs
    }
  >>
  g2 ~ |
  g4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key g \major
  \time 2/4
  \partial 8 d8 |
  b'2 ~ |
  b8 c c b |
  a4 fs8 fs |
  fs g g (a) |
  d,2 |
  d8 b' b16 (c) b8 |
  a4. a8 |
  gs a4 d8 |
  d2 ~ |
  d4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ta hãy sống trong đợi chờ và khao khát Chúa lại đến
  với công lý và triều đại của Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngày ấy, Chúa sẽ lau khô mọi giọt lệ hoen mắt buồn,
      và xé tấm khăn tang bao trùm trên thế giới.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngày ấy Chúa sẽ oai phong chà đạp quyền uy tử thần,
      Sự sống mới khai sinh, tuôn tràn ơn cứu rỗi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ngày ấy, thế giới nơi nơi hội tụ lại trong Giáo Hội,
      Cùng cất tiếng ca vang: Vinh hiển thay Nước Chúa.
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
    \override Lyrics.LyricSpace.minimum-distance = #3
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
