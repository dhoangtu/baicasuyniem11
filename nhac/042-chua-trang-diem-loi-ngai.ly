% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Trang Điểm Lời Ngài"
  poet = "Ý lời ca: Th. Ephrem"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key c \major
  \time 2/4
  c8 g f e |
  e4. e8 |
  g d e (d) |
  c2 |
  c16 (d) f8 e d |
  f4. g8 |
  a4 a8 a16 (b) |
  g8 g a b |
  c2 ~ |
  c4 r \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  e8 e16 (f) d8 g |
  f4 e8 g |
  a8.
  <<
    {
      \voiceOne
      f16
    }
    \new Voice = "splitpart" {
      \voiceTwo
      \once \override NoteColumn.force-hshift = #2.5
      \tweak font-size #-2
      \parenthesize
      a16
    }
  >>
  \oneVoice
  d,8 d |
  d2 |
  d8 g f e |
  a4 a8 a |
  f4. g8 |
  a a d, f |
  g2 |
  g8 e e g |
  a4. b8 |
  b a g (a) |
  c2 ~ |
  c4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa trang điểm Lời Ngài bằng muôn vàn vẻ đẹp
  Để những ai tìm hiểu chuyên chú chiêm ngưỡng được điều mình yêu thích.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ai hiểu được tất cả sự phong phú của một lời Ngài?
      Điều chúng ta nhận biết quá bé nhỏ so với những gì bỏ qua,
      Như một người đang khát uống nước nơi dòng suối.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ai hiểu được chút đỉnh sự phong phú bời một lời Ngài
      Thì sẽ tin lời đó rất sáng tỏ đâu có khiến mình nghèo đi
      Không là điều duy nhất, vẫn có muôn điều khác.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ta chẳng buồn khi thỏa được cơn khát
      \markup { \italic \underline "suối" } còn tràn đầy,
      Vì mỗi khi lại khát, suối vẫn chảy ta sẽ cứ tìm về đây
      Nơi mạch nguồn phong phú hãy uống cho thỏa thuê.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
