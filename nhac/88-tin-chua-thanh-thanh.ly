% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Tin Chúa Thánh Thần"
  poet = "Ý lời ca: P. Marie-Eugène"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  f e a a |
  d,4. c8 |
  c c f e |
  a4. g8 |
  f f f f |
  bf4 d8 d |
  g,4. c8 |
  f, f g e |
  e2 |
  d16 (e) c8 a' bf |
  g4. g8 |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  r8 e e e |
  a4 f8 e |
  d4 c8 f |
  e (f16 e) d8 g |
  a2 |
  r8 g g c |
  bf8. bf16 a8 d |
  g,2 |
  e8. d16 c8 g' |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ai tin vào Chúa Thánh Thần
  thì một dòng sông sự sống tuôn trào từ lòng người ấy,
  Chúa Thánh Thần sẽ tràn ngập linh hồn họ,
  khiến họ thêm vững tin nơi Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ngài là sự sống của linh hồn,
      là hơi thở đầy sinh khí.
      Ngài là gia chủ chẳng ngừng tác động trong tâm hồn chúng ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ngài là thượng khách của tâm hồn,
      Một Ngôi Vị thật minh mẫn,
      Ngài hằng xây dựng bảo toàn Giáo Hội,
      điểm trang bằng thánh ân.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Nguyện Ngài ngự đến đê khơi dậy,
      làm thông hiểu lời Kinh Thánh.
      Nguyện Ngài thay đổi cả hoàn vũ này,
      gieo Tin Mừng khắp nơi.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.7
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
