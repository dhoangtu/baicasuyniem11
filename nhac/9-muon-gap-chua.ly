% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Muốn Gặp Chúa"
  poet = "Ý lời ca: Bernadette Escaffre"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  e8 c4 e8 |
  f4 f8 f |
  d a' a g |
  e4 r8 c' |
  a a a c |
  g4. e8 |
  e e4 e8 |
  a4 r8 d, |
  d4 g8 c, |
  c2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  c8 f d g |
  a2 |
  g8 g4 a8 |
  c4 r8 b |
  b c a c |
  g2 |
  r8 e e g |
  a4. g8 |
  d' d4 b8 |
  c2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Muốn gặp Thiên Chúa, ta đâu cần ngước mắt lên trời,
  hãy nhìn vào lòng mỗi người,
  Ngài hiện diện ở đó,
  vì Ngài đã làm người.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài ở cùng Thiên Chúa, Ngài là Thiên Chúa.
      Vạn vật do Ngài tác thành,
      Ngài là sự sống, là ánh sáng trần gian.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài chiếu dọi đêm tối,
      tạo niềm vui sống và dẹp tan mọi bóng sầu,
      Nhờ Ngài ta sẽ gặp ý nghĩa đời ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
      \set stanza = "3."
      Ngài đã mặc thân xác, làm người dương thế,
      đồng hành bên cạnh mỗi người,
      Chỉ đường soi lối vầ Đất Hứa bình an.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
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
