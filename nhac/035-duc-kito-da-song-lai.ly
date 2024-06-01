% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đức Kitô Đã Sống Lại"
  poet = "Ý lời ca: Mgr Michel Pansard"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  \partial 8 e8 |
  e f d d |
  e4. c8 |
  g' g g f |
  e4. a8 |
  a4. c8 |
  b b c a |
  g4 r8 g |
  f4 a8 a |
  e g f e |
  d4 r8 e |
  d16 (e) c8 g' e |
  a2 |
  f8 a f d |
  g4. g8 |
  b4 d8 c |
  c4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  \partial 8 e8 |
  e2 |
  d8 f f e |
  c4 r8 c |
  c c e d |
  g2 ~ |
  g8 a f d |
  g4. d8 |
  d g f d |
  c2 ~ |
  c4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Bao lâu các Ki -- tô hữu còn nối tiếp các Tông đồ ca rao:
  Đức Ki -- tô đã sống lại,
  nhân loại sẽ biết mình có thẻ đương đầu,
  có thể vượt qua sự chết
  vì nó chẳng mạnh hơn Tình yêu Đức Ki -- tô.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Sáng sớm ngày thứ nhất trong tuần,
      một bà tìm thăm mộ Chúa thấy mộ mở ra,
      lòng chợt chớm nở hy vọng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Gio -- an chạy thoắt đến bên mộ
      vừa nhìn cuộn khăn liệm đó với dải buộc đây
      là lòng vững tin chân thành.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Hôm nay lời thánh ước viên thành:
      Thật kỳ diệu thay hòn đá đám thợ loại ra
      rầy thành đá tảng góc tường.
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
