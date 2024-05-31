% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Phục Sinh - Lễ Hội"
  poet = "Ý lời ca: Pseudo-Hippolyte"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  f4 f8 d |
  g4. g8 |
  a d, d16 (f) g8 |
  c,4. c8 |
  c f e16 (f) g8 |
  a4 r8 f |
  f4 bf |
  bf4. g8 |
  c4 g |
  f4 r8 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8 a8 |
  f4. g16 (f) |
  d8 d d e16 (d) |
  c4 r8 c |
  a'4 f8 f |
  bf g bf4 |
  c r8 bf |
  d4 bf8 bf |
  bf c bf (a) |
  g2 |
  g8 bf d,16 (f) d8 |
  c4 c8 g'16 (a) |
  f4 r8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Phục Sinh, ôi Phục Sinh, ôi lễ hội của Thánh Thần,
  Ngày Vượt Qua của Thiên Chúa từ trời xuống đất,
  từ đất lên trời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Vũ trụ vui mừng rạng ngời hoan lạc:
      Tội lỗi và sự chết bị xua tan,
      sự sống được trả lại cho mọi người,
      những cánh cửa thiên đàng được mở rộng.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa Trời rầy đà trở thành con người
      và khiến người trần thế thành Thiên Chúa.
      Ngài đã tận diệt quyền uy hỏa ngục,
      những vách cản con người sụp đổ rồi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chính Ngài quy tụ hợp đoàn muôn người,
      Trần thế rầy rộn rã bài hoan ca.
      Phòng cưới chật đầy người tham dự tiệc,
      áo cưới chẳng ai người mà chẳng mặc.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
