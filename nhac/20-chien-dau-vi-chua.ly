% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chiến Đấu Vì Chúa"
  poet = "Ý lời ca: Thánh Gioan Kim Khẩu"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 c |
  c f, bf a |
  g4 f8 f |
  d g c, f16 (g) |
  a4 r8 bf |
  bf bf a d |
  g,4. c8 |
  c g g e |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 f |
  f4 f8 \grace g16 (a8) |
  d, f f d |
  c4 c8 c |
  c4 a'8 bf |
  bf g e g |
  f4 \bar "||"
  
}

% Lời
loiPhanMot = \lyricmode {
  Ta chiến đầu vì Chúa Ki -- tô nên can trường chấp nhận thử thách,
  Hăng say xông vào chiến trận mà lòng chất ngất niềm vui.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi ăn chay ta nhảy mừng như đi dự tiệc,
      bị nhục mạ, ta hát xướng như được chúc khen.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Khi cho đi, ta mãn nguyện như khi được nhận,
      bị thiệt thòi, ta thích thú như được lãnh hơn.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Khi thương đau môi vẫn nở tươi bao nụ cười,
      bị hành hạ, ta khấn Chúa vui lòng thứ tha.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Nơi nhân gian ta vẫn bị coi như dại khờ,
      mà kỳ thực ta sáng suốt theo đường Chúa đi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Khi ra đi ta nức nở gieo trong lệ sầu,
      mùa gặt về, vui sướng lúa thơm nặng trĩu vai.
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
