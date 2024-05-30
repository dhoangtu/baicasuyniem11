% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Biết Lắng Nghe"
  poet = "Ý lời ca: Philippe de Roten"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4. a8 bf a |
  a4 bf8 bf |
  g f a f |
  e2 |
  a8 bf a g |
  g4. g8 |
  e f d g |
  c,2 |
  a'8 bf bf bf |
  g8. e16 f8 g |
  a2 ~ |
  a8 bf a g |
  bf4 c8 c |
  f,2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 a |
  d,2 |
  c8 c f g |
  a8. a16 d,8 f |
  g4. a8 |
  bf a d, d |
  d4 r8 c |
  f e f g |
  a4 a8 bf |
  g g c c |
  f,2 ~ |
  f8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ta hãy xin ơn biết lắng nghe và biết trả lời
  như Đức Ma -- ri -- a trong từng công việc mỗi ngày.
  Ta sẽ khám phá ra Tình yêu Thiên Chúa giúp ta tự do tới mức nào.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúa Thánh Thần là Tình yêu Thiên Chúa tác động trong ta,
      thôi thúc ta làm việc lành,
      và ta tự do chu tất khi ý mình hợp ý Chúa thật.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Lãnh trách nhiệm từng việc ta theo Chúa đã thực hiện đây,
      luôn nghĩ trong lòng mình rằng:
      việc ta vừa thi công đó nhưng rõ là việc chính Chúa làm.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chớ nghĩ rằng là thực thi theo Chúa sẽ triệt tiêu ta,
      Ơn Chúa không hề ràng buộc,
      mà soi dọi cho ta biết suy xét chọn điều tốt xấu thật.
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
