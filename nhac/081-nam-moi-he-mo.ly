% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Năm Mới Hé Mở"
  poet = "Ý lời ca: Albert Hari - Charles Singer"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f8 g a a |
  \grace e16 (f4) e8 e |
  a d, g g |
  c,4 r8 c |
  a'2 ~ |
  a8 a d,16 (f) g8 |
  g4. c,8 |
  e g g f |
  f2 ~ |
  f4 r \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 f e a |
  a2 |
  g8 g4 d8 |
  \grace d16 (f4) r8 e |
  g c, g' e |
  f4 r8 a |
  a d, g g |
  c,4. f8 |
  f a d, f |
  g2 |
  g8 f g a |
  d, (c) g' a |
  f2 ~ |
  f4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Một năm mới hé mở, một cuộc sáng tạo mới khởi đầu
  Lạy Chúa, Chúa ở bên con, cùng con đến với anh em.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Tương lai và dĩ vãng, con không làm chủ,
      nhưng Chúa nhìn thấy cả hai.
      Dĩ vãng đà khép kín rồi,
      tương lai sẽ được mở ra trong niềm vui nỗi buồn khi sáng tạo.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Con tin cậy phó thác trong muôn hoàn cảnh,
      tay Chúa hằng dắt dìu con, quý mến Ngài vẫn đoái nhìn
      như cha với mẹ hỉ hoan trông người con của mình khôn lớn dần.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Con con hằng ý thức ân thiêng Ngài đổ chan chứa hồn xác của con
      khiến mỗi ngày mối sáng tạo cho nhân thế
      cùng cảm thông trong tình yêu với lòng trung tín Ngài.
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
