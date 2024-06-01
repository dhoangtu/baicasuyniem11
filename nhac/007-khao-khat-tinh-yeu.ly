% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Khao Khát Tình Yêu"
  poet = "Ý lời ca: Đức Bênêđitô XVI"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 b8 a |
  b a g b |
  e,2 |
  e8 e fs a |
  d, d g (a) |
  b2 ~ |
  b8 b g b |
  e,4 e8 g |
  a2 ~ |
  a8 a fs 16 (e) a8 |
  d,4 a'8 a |
  b fs g g |
  g4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4
  \afterGrace g8 ({
    \override Flag.stroke-style = #"grace"
    a16)}
  \revert Flag.stroke-style
  d,8 |
  a' fs g (a) |
  b4. g8 |
  g a b4 |
  c8 b a c |
  d4. d8 |
  b b a16 (d) b (a) |
  g4 b8 a16 (g) |
  e4. e8 |
  d g fs16 (a) fs8 |
  g4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hãy khao khát cho đời sống mình một tình yêu tốt đẹp và mạnh mẽ,
  biến cuộc sống thành một hành vi hiến tặng chính mình cho Thiên Chúa
  và cho anh em.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Muốn đạt mức tình yêu đó cần sự nâng đỡ của ân sủng Thiên Chúa
      giúp ta can đảm thi hành
      những công việc con người không tưởng tượng ra.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Muốn đạt được mức tình yêu đó:
      cầu nguyện hôm sớm,
      với tâm tình khiêm tốn
      khiến cho ta hiểu ra rằng:
      bản thân mình vô dụng nên chẳng là chi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
      \set stanza = "3."
      Muốn đạt được mức tình yêu đó:
      nhiệt thành dâng lễ,
      lắng nghe lời Con Chúa,
      sắt son tin tưởng tôn thờ Thánh tâm Người,
      ân tình sâu thẳm dường bao.
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
