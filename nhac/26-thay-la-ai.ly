% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Thầy Là Ai"
  poet = "Ý lời ca: Dominique Marcovits"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key g \major
  \time 2/4
  \partial 8 b8 |
  a d fs, fs |
  g4 r8 e |
  g4 g8 a |
  d,4 r8 a' |
  g b c a |
  b4. c8 |
  b b a4 |
  fs8. fs16 a8 g |
  g2 ~ |
  g4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key g \major
  \time 2/4
  \partial 4 g8 g |
  g4. fs8 |
  g b4 g8 |
  e4. d8 |
  d d g (a) |
  b2 |
  c8. c16 c8 e |
  \grace a,16 (b2) ~ |
  b8 a16 (b) e,8 d |
  g2 ~ |
  g4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Các con nghĩ Thầy là ai?
  -- Làm sao hay biết được!
  Nhưng được Thiên Chúa soi sáng, chúng con tuyên xưng:
  Thầy là Đức Ki -- tô.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Như Phê -- rô và như các Tông đồ từng miệt mài theo Chúa,
      Nhưng khi nghe Chúa hỏi biết trả lời sao?
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Không do anh hoặc do tác nhân nào,
      càng chẳng bởi nhục huyết,
      Nhưng do Cha phán bảo, hãy trả lời đi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Hôm nay đây và cho đến muôn đời
      mọi người nào hiểu thấu,
      Nhưng Ơn Trên thúc đẩy, cứ trả lời đi.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
