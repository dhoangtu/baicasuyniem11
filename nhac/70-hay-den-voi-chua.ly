% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hãy Đến Với Chúa"
  poet = "Ý lời ca: Anseim Grun"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 b8 |
  c4. c8 |
  c8. c16 c8 a |
  d2 |
  d8 b c b |
  a4. fs16 (e) |
  d8 b' a g |
  c4 a8 a |
  g2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key g \major
  \time 2/4
  fs8. fs16 fs8 g |
  a b ~ b4 |
  c8 g b e,16 (g) |
  a4. b8 |
  a8. a16 b8 g |
  e d4 b'8 |
  g c b a |
  d4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ai khát hãy đến với Chúa mà uống.
  Thánh Tâm Chúa Giê -- su tuôn tràn nước ban sự sống cho nhân trần.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Từ cạnh sườn bị đâm thấu, máu cùng nước chảy ra
      xóa tan cơn khát của nhân trần,
      đó là khát khao được sống.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Nhận thập tự để hy tế với ngàn nỗi khổ đau
      xóa đi bao lỗi tội nhân trần mở đường tới quê hạnh phúc.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Rầy ngày ngày lại trao hiến chính Thịt Máu hiển vinh
      dưỡng nuôi con cái cả gian trần đến hiệp nhất trong tình mến.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
