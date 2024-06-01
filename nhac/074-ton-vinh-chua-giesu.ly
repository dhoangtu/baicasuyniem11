% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Tôn Vinh Chúa Giêsu"
  poet = "Ý lời ca: Đức Phaolo VI"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  a8 a bf a |
  g4 e8 f |
  f e f16 (g) a8 |
  a2 ~ |
  a8 f bf bf |
  bf4 bf8 g |
  g g c bf |
  a2 |
  bf8 bf d d |
  g,4. g8 |
  g g c e, |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f8 f g g |
  a4 r8 a |
  d,2 ~ |
  d8 d d16 (e) f8 |
  g8. a16 a8 f |
  c4 c8 f |
  f8. e16 d8 f |
  g4 r8 c |
  bf8. g16 g8 c |
  f, f ~ f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Tôn vinh Chúa Giê -- su là trong tâm lịch sử thế giới
  Ngài yêu thương ta, luôn đồng hành gần gũi bên ta,
  là sự sống đích thực và là hạnh phúc của ta.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài là Con Thiên Chúa,
      giáng trần mạc khải cho ta biết Đấng Vô Hình,
      Là Trưởng Tử muôn loài thọ sinh,
      Tất cả nhờ Ngài mới tồn tại.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài vì yêu nhân thế, chấp nhận nhập thể hy sinh hiến tế thân mình,
      Ngài đã chết nhưng rồi phục sinh,
      khiến mở rộng đường dẫn về trời.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ngài làm cho ta sống, chính là mục tử khoan nhân dẫn lối đưa đường,
      Ngài chiếu sáng gian trần mọi nơi,
      kính cẩn trời và đất phụng thờ.
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
