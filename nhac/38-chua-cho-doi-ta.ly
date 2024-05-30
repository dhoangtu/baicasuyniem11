% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Chờ Đợi Ta"
  poet = "Ý lời ca: Albert Rouet"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 a8 c |
  a16 (g) f8 f a |
  g4. a8 |
  d,4 d8 e16 (d) |
  c4. c8 |
  f f e16 (f) a8 |
  g2 ~ |
  g8 bf g g |
  d4 d8 f |
  d8. c16 a'8 a |
  a4 g8 d |
  d16 (e) c8 g' f |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 f8 |
  d2 ~ |
  d8 d d f |
  c8. c16 c8 g' |
  a f bf (a) |
  g2 ~ |
  g8 g g c |
  c4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Thiên Chúa đang chờ đợi chúng ta bước vào sự thinh lặng,
  vào con tim của chúng ta.
  Chinh con tim này đem chúng ta vào thế giới mới
  theo hình ảnh của Chúa Ki -- tô.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Phúc thay ai coi Nước Trời
      và sự công chính của Nước Trời là điều chính yếu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Phúc thay ai luôn sẵn sàng phục vụ như những đầy tớ thầy
      vì tình bác ái.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Phúc thay ai đang rất giầu sang mà nguyện cương quyết
      từ bò trọn, đồng hành với Chúa.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Phúc thay ai vui đón nhận vì tình thương mến
      mà vững lòng làm đẹp thế giới.
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
    \override Lyrics.LyricSpace.minimum-distance = #1
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
