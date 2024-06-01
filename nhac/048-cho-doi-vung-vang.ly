% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chờ Đợi Vững Vàng"
  poet = "Ý lời ca: Thánh Hilariô"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 b16 b |
  a8 a b g |
  c4. c16 b |
  a8 d fs, a |
  g4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 b8 |
  a g16 fs fs8 fs |
  fs4. fs16 fs |
  fs8 b e, a |
  b4 r8 b |
  b g c b |
  a4 r8 a |
  b g16 (fs) a8 b |
  e,4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Mắt chúng ta luôn hướng về Chúa tới khi Ngài đoái tình xót thương.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Đức Tin phải là sự chờ đợi,
      sự chờ đợi vững vàng sâu sắc,
      Tín thác lòng Chúa yêu thương,
      không chán nản, không ngã lòng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Nhớ luôn: phải một lòng một dạ,
      vì nhiều lần Chúa đành khoan giãn
      mới biết mình có kiên trung luôn thức tỉnh,
      luôn sẵn sàng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ngước lên để miệt mài cầu nguyện
      và bền lòng đón chờ ơn Chúa,
      hướng tới hạnh phúc mai sau,
      tay Chúa chở che dắt dìu.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
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
