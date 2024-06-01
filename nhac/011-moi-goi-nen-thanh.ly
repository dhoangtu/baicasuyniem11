% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Mời Gọi Nên Thánh"
  poet = "Ý lời ca: Enzo Bianchi"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  c c f g |
  a4. d,8 |
  d d d4 |
  bf'8 a bf a |
  g2 ~ |
  g8 \grace f16 (a8) g16 (f) d8 |
  d2 ~ |
  d8 e16 (f) g8 a |
  c,4. c8 |
  e16 (f) d8 d bf' |
  bf4 g8 a |
  g c, f e |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 a |
  d,8 d16 (f) g8 g |
  a2 |
  f8 f a g16 (f) |
  d4. bf'8 |
  bf a g g |
  g2 |
  f8 bf g c |
  c2 ~ |
  c8 bf d c16 (bf) |
  g4 e8 e16 (f) |
  g8 d bf' g |
  a4 g8 g |
  f2 ~ |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Được mời gọi để nên thánh,
  là được mởi gọi bước theo Chúa Giê -- su để nghe lời Ngài,
  để chiêm ngưỡng Ngài
  và để hòa nhập nghĩa thiết trong đức tin và trong tình yêu.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Sự thánh thiện của Ki -- tô hữu
      là tạo mối liên hệ với Chúa Giê -- su Ki -- tô,
      Ngài chính là Đấng Thánh tìm đến gian trần
      hầu chuyển trao sự sống Thiên Chúa cho con người.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Sự thánh thiện cúa Ki -- tô hữu
      là cuộc sống thông hiệp với Đấng cao siêu vô biên
      Ngài vĩnh hằng chí Thánh mà muốn trải rộng
      và sẽ chia sự thánh thiên ấy cho nhân trần.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
      \set stanza = "3."
      Sự thánh thiện cúa Ki -- tô hữu
      là đời sống nhân loại giống Chúa Giê -- su Ki -- tô
      Rập mẫu Ngài đã sống:
      từng phút trong đời
      làm trổ sinh sự sống viên mãn không khi ngừng.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.7
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
    \override Lyrics.LyricSpace.minimum-distance = #0.8
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
