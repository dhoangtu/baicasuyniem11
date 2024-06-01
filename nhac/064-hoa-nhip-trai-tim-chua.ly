% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Hòa Nhịp Trái Tim Chúa"
  poet = "Ý lời ca: René Pageau"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4
  <<
    {
      a8 a |
      a4 bf8 bf |
      g g f4 |
      a8 a f d |
      e4 r8
    }
    {
      f8 f |
      f4 g8 g |
      e e d4 |
      f8 f d bf |
      a4 r8
    }
  >>
  d8 |
  <<
    {
      a'2 |
      a8 a bf a |
      g4. e8 |
      e a a e |
    }
    {
      f2 |
      f8 f g f |
      e4. d8 |
      cs cs cs cs
    }
  >>
  d2 ~ |
  d4 r \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  d8 c c f |
  e4 e16 (f) d8 |
  d4 e16 (f) d8 |
  g f f g |
  a (bf) a g |
  a2 |
  g8 f g16 (f) e8 |
  e4. f8 |
  a, f' e c |
  d4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Xin cho con biết khát khao hy vọng,
  biết khát khao tình yêu,
  Lạy Chúa, Xin cho trái tim con hòa nhịp với trái tim Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Con dừng lại phút giây để tìm gặp,
      để nhận ra hành động của Chúa trong đời con,
      Bao lần con tuyệt vọng Chúa dọi sáng lên niềm tin.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Con dừng lại phút giây để cảm nghiệm,
      để ngợi ca vẻ đẹp của Chúa linh diệu thay,
      Cho hồn vang vọng lại tiếng gọi Chúa thân tình thay.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Con dừng lại phút giây khởi hành lại,
      để lần theo điều Ngài dự kiến cho đời con,
      Không còn lo sợ gì bởi Ngài vẫn song hành luôn.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
