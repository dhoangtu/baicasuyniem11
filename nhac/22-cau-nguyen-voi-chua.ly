% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Cầu Nguyện với Chúa"
  poet = "Ý lời ca: Madeleine Delbrêl"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key g \major
  \time 2/4
  \partial 8 d8 |
  d2 |
  d8 g fs fs |
  b4.
  <<
    {
      c8 |
      b d g, a |
      e4.
    }
    {
      a8 |
      g fs e d |
      c4.
    }
  >>
  <<
    {
      \voiceOne
      d16 (e)
    }

    \new Voice = "splitpart" {
      \voiceTwo
      b8
    }
  >>
  \oneVoice
  <<
    {
      a'8. a16 a8 fs |
    }
    {
      c8. c16 d8 d |
    }
  >>
  g2 ~ |
  g4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 g8. g16 |
  fs8 fs a b |
  e,4. e8 |
  d a'16 (g) fs8 a |
  b2 |
  b8. g16 a8 b |
  e,2 |
  d8. g16 fs8 a |
  b4 r8 d, |
  a'4 a8 fs |
  g4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Cầu nguyện là ngưng lại mọi thứ,
  tách xa những việc đang làm để nói với Chúa mà thôi.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Dâng lên Ngài lời kinh vắn gọn bao gồm những gì ta có:
      Chút tài năng thấp hèn, vài hy vọng khiêm tốn,
      Ngài vẫn sẵn sàng nghe.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Dâng lên Ngài lời kinh vắn gọn bao gồm những gì ta có:
      Lúc toàn thân yếu liệt, ngày tâm hồn tan nát,
      Ngài vẫn sẵn sàng nghe.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Dâng lên Ngài lời kinh vắn gọn bao gồm những gì ta có:
      Lúc thành công lẫy lừng, hồi muôn người hoan chúc,
      Ngài vẫn sẵn sàng nghe.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Dâng lên Ngài lời kinh vắn gọn bao gồm những gì ta có:
      Lúc làm ăn thất bại, ngày đau buồn tang chế,
      Ngài vẫn sẵn sàng nghe.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Dâng lên Ngài lời kinh vắn gọn bao gồm những gì ta có:
      Chút thời gian cuối cùng, mà công trạng chưa có,
      Ngài vẫn sẵn sàng nghe.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
