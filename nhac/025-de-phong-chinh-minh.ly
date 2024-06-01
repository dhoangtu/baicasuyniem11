% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đề Phòng Chính Mình"
  poet = "Ý lời ca: Enzo Blanchi"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a8 d, d g |
  c,2 |
  c8 f d f |
  g4 e8 (f) |
  g bf g a |
  a4. a8 |
  g f f g |
  e4. e8 |
  a d, d g |
  c,4. c8 |
  g'4 e8 e |
  f4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 a |
  a4. f8 |
  e e a d, |
  g4. a8 |
  c4 f,8 e |
  d bf' g g |
  a2 ~ |
  a8 f g a |
  d,4. c8 |
  g'16 (a) g8 g g |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy đề phòng chính mình vì kẻ thù của ta ở trong chính bản thân ta,
  chứ không phải ở bên ngoài.
  Vậy hãy đề phòng chính mình và hãy cầu nguyện liên.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hãy chiến đấu bảo vệ đời sống nội tâm của mình,
      để không bị thế gian lôi cuốn,
      và không té nhào vì những lo âu trong đời.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Hãy chiến đấu để đừng lười biếng và vô trách nhiệm,
      hãy như đầy tớ luôn canh thức đợi trông Nước Trời,
      tạo mối tương quan thân tình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Hãy gắng sức để nhập cuộc sẵn sàng theo sứ mệnh,
      mãi chuyên cần dấn thân kiên chí
      hầu mong đón nhận sự sống phong nhiêu viên toàn.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
