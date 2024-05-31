% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Mẹ Ơn Thinh Lặng"
  poet = "Ý lời ca: Michel Hubaut"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 a |
  g f g a |
  f4. e8 |
  d4 d8 d |
  c g' g g |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 f |
  e4. e8 |
  g a f f |
  bf4. bf8 |
  bf d g,4 |
  f8 f e g |
  a2 ~ |
  a8 g g g |
  g4 g8 g |
  f f a g16 (f) |
  d2 |
  d8 d f e |
  \grace { e16 (f } g4.) g8 |
  g16 (a) d,8 e16 (g) c,8 |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Tín thác nơi tình yêu Mẫu tử của Mẹ,
  con xin Mẹ ban ơn thinh lặng.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Trong thinh lặng Mẹ nhận sức mạnh Thần Khí
      để tạo xác thịt cho Ngôi Lời Thiên Chúa.
      Xin ban cho con ơn thinh lặng của đức khiêm nhường,
      để tình yêu nhập thể, trong mỗi động thái đời con.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Trong thinh lặng Mẹ quỳ ngắm nhìn Hài Nhi nằm ở máng lừa
      trong đêm mùa đông ấy,
      Xin ban cho con ơn thinh lặng của đức tin cậy.
      dù gặp bao nghịch cảnh luôn cảm nghiệm Chúa gần bên.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Trong thinh lặng Mẹ từng đứng kề thập giá
      tự nguyện góp phần đau thương cùng Con Chúa.
      Xin ban cho con ơn thinh lặng của đức tuân phục
      để nhận bao sầu khổ mong sẽ cùng Chúa phục sinh.
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
