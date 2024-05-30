% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Sống Theo Thánh Thể"
  poet = "Ý lời ca: Michel Dupuis"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  b4 a8 b |
  g4 fs8 fs |
  fs b e, a |
  g4. fs8 |
  b a a e |
  e4 e8 c' |
  b b c b |
  a4. fs16 (e) |
  d8 a' a g |
  g2 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  g8 g fs4 ~ |
  fs8 c' c b |
  a4. a8 |
  d, d a' fs |
  g4 r8 a |
  g8 fs16 (g) fs8 e |
  b'4 b8 b |
  e,4. fs8 |
  g e16 (fs) a8 a |
  b4 c8 c |
  a4 r8 a |
  g g a a16 (g) |
  e4. fs16 (e) |
  d4 g8 fs |
  g2 ~ |
  g4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Sống theo Thánh Thể là thực sự dứt mình ra
  khỏi cuộc sống riêng tư hạn hẹp,
  hầu lớn lên trong cõi vô biên của sự sống Chúa Ki -- tô.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ta nên một với Chúa Giê -- su, phép lạ hiệp nhất xẩy ra,
      không phải để vô hiệu hóa những khác biệt,
      hay xóa bỏ đi chân tính mỗi cá nhân,
      nhưng để tỏa lan nhân vị của mình trong tình yêu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ta nên một với Chúa Giê -- su,
      Chúa ngự trị cõi lòng ta, ta được sẽ chia sự sống với chính Ngài,
      Do sức mạnh ơn thiêng Chúa giúp sức cho,
      ta hòa nhập trong thân phận mỗi người thân cận ta.
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
    \override LyricHyphen.minimum-distance = #1
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
