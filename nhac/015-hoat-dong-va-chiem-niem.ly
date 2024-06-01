% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hoạt Động Và Chiêm Niệm"
  poet = "Ý lời ca: Thầy Roger Schutz"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8g8 |
  g4 g8 a |
  e4. g8 |
  d d g (a) |
  b4. b8 |
  g4 c8 b |
  a4 d8 d |
  fs,4. fs8 |
  g4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 g8 g |
  a4 a16 (g) e8 |
  e4 d8 d |
  a'4 b8 c |
  b a a a |
  d4. b8 |
  a4 a8 b |
  g2 ~ |
  g4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Hoạt động và chiêm niệm có cùng một nguồn suối,
  Đó là Đức Ki -- tô, Đấng chính là Tình Yêu.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Vì Tình Yêu ta cầu nguyện,
      vì Tình Yêu ta đấu tranh tra lại phẩm chất cho người bị bóc lột.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Vì Tình Yêu ta hoạt động,
      vì Tình Yêu ta giúp muôn người phụng thờ Chúa,
      tin Ngài gần gũi họ
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Vì Tình Yêu ta liều mạng,
      vì Tình Yêu ta dấn thân tạo dựng cuộc sống y hệt lời Chúa truyền.
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
