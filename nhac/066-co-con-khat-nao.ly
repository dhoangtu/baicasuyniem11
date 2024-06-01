% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Có Cơn Khát Nào"
  poet = "Ý lời ca: Daniel Dideberg"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 a8 |
  g a d,8. f16 |
  g8 g ~ g4 ~ |
  g c8 a |
  bf4 bf8 g |
  a2 ~ |
  a8 a g g |
  a8. a16 c,8 g' |
  f2 ~ |
  f4 r8 a |
  a g a8. d,16 |
  g8 g4 bf8 |
  g c c8. c16 |
  c8 f, ~ f4 ~ |
  f \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 e8 e |
  e8. f16 g8 g |
  f a4 e8 |
  g f4 d8 |
  c4. a'8 |
  f g e8. e16 |
  g8 a4 bf8 |
  a g4 c8 |
  f,4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Có cơn khát nào trong ta không?
  Khát chân lý, khát tình yêu, khát ơn tha thứ,
  khát lòng xót thương.
  Nếu thấy cơn khát nào trong ta hãy tìm đến suối Đấng Cứu Độ.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Từ cạnh sườn mở ra trên thập giá,
      nguồn thánh ân tuôn tràn
      đã làm êm dịu lại cơn khát của muôn ngàn thế hệ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Tựa là gậy của Môi -- sen đập đá và nước chảy tuôn tràn
      đã làm dân Người dịu cơn khát giữa sa mạc nắng nồng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Nhìn đền thờ tự nhiên đâu dòng nước từ bên phải tuôn tràn,
      nước này lan về là ai nấy đón ân lộc cứu độ.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
