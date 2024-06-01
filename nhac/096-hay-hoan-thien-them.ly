% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Hoàn Thiện Thêm"
  poet = "Ý lời ca: Jacques-Bénigne Bossuet"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f16 (g) c,8 d f |
  g4 r8 a |
  g g d d16 (c) |
  d4 a'8 a |
  f4. bf8 |
  bf a g g |
  c4. bf8 |
  g g c e, |
  f2 ~ |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  c a a16 (g) f8 |
  g4. g8 |
  a d, d4 ~ |
  d8 d f (g) |
  c,4 g'8 a |
  f f bf d |
  g,4. e8 |
  e16 (g) e (d) c4 ~ |
  c8 c c (d) |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy hoàn thiện thêm luôn, hãy yêu thương ngày một nhiều.
  Chúa Thánh Thần sẽ thắp lên ngọn lửa mới để ta yêu mến nhiều hơn.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hãy lớn lên trong tình yêu trong suốt hành trình cuộc sống này.
      Ai giới hạn tình yêu của mình thì chẳng hiểu gì về tình yêu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Gắng sức ra công học theo gương mẫu hoàn thiện của Chúa Trời,
      trong suốt cuộc đời dương thế này thật chẳng ai người đạt được đâu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Mến Chúa, yêu thương cận nhân, chu tất trọn vẹn luật Chúa truyền,
      ta sẽ trở thành con cái Ngài và cảm nghiệm được trọn niềm vui.
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
