% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Nếu Không Thần Khí"
  poet = "Ý lời ca: Hồng y Godfried Danneels"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 4. e8 a g |
  f8. e16 e8 e |
  a8 a4. ~ |
  a8 b a c |
  c8. c16 b8 a |
  d d4 d8 |
  c4 d8 c |
  b8. b16 c8 a |
  b b4 e8 |
  c8. c16 b8 b |
  a2 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  a8 g c, (d) |
  e4 c'8 b |
  c8. a16 a8 b |
  e,4. a8 |
  b4 b8 b |
  c8. b16 g8 a16 (b) |
  e,4. c'8 |
  b e a, g |
  a2 ~ |
  a8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Thần Khí không chỉ là ngọn đèn
  chiếu sáng con đường phía trước chúng ta cần đi theo,
  nhưng Ngài luôn ân cần thôi thúc từ sau lưng trợ giúp ta đăng trình.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Nếu không Thần Khí, Phúc Âm sẽ là một gánh nặng ghê gớm,
      Ki -- tô giáo như một tổng hợp những định chế về lề luật.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Nếu không Thần Khí, ách ta lãnh đời nào sẽ thành êm ái,
      đôi quang gánh trĩu nặng vai gầy khi nào sẽ thành nhẹ nhàng?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chính do Thần Khí giúp ta biết việc mình phải làm chu tất,
      luôn tăng sức khi làm mỗi việc cho bền vững và hoàn thành.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
