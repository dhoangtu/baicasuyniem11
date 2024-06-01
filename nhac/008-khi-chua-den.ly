% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Khi Chúa Đến"
  composer = "Lm. Kim Long"
  poet = "Ý lời ca: Bênađô"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  e8 f f d |
  d4. d8 |
  a' a g fs |
  g4 g8 e |
  d4 c8 d |
  f (e) d g |
  a4. g8 |
  e2 ~ |
  e8 e e e |
  f4. d8 |
  b' a b g |
  c4 r8 \bar "||"
}

nhacPhanHai = \relative c'' {
  \key c \major
  \time 2/4
  \partial 8 c8 |
  g g g a |
  f4 e8 d |
  g4 r8 g |
  f d e4 |
  d8 d d g |
  c,4. e8 |
  d d f a |
  g4 r8 c |
  b c c c |
  g4 (a) |
  f8 f f g |
  e4 e8 e |
  f d g b, |
  c4 \bar "|."
}

% Lời
loiPhanMot = \lyricmode {
  <<
    {
      \set stanza = "1."
      Khi Chúa đến trong con,
      Ngài đánh thức tâm hồn con đang ngủ vùi.
      Ngài mổ xẻ, Ngài lay mắt,
      xoa mềm con tim đau yếu và cứng như đá của con.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
	    Khi Chúa đến trong con,
	    Ngài đã khởi công nhổ đi hay tiêu diệt,
	    Ngài cắt xén ngài vun tưới, xây dựng.
	    Nơi đâu tăm tối, Ngài chiếu cho sáng rực lên.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
	    Khi Chúa đến trong con,
	    Ngài tưới ướt cho mềm ra nơi khô cằn,
	    Vùng giá buốt Ngài hong ấm, hun nồng.
	    Quanh co, nhô lõm, Ngài uốn ngay, lấp bằng luôn.
    }
  >>
}

loiPhanHai = \lyricmode {
  Chúa không cho con dấu chỉ khi Ngài đến,
  con chỉ nhận ra sự hiện diện của Ngài qua nhịp đập của trái tim.
  Ôi sự khôn ngoan sâu thẳm, lòng dịu dàng nhân hậu
  khi thay đổi nhịp sống của con.
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
  page-count = 1
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
