% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Của Lễ Cao Trọng"
  poet = "Ý lời ca: Thánh Cyprianô"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f8 (g) a g16 (f) |
  d4. e8 |
  f e16 (e) g8 g |
  a2 |
  r8 a a a |
  d4 cs16 (d) e8 |
  a,2 |
  r8 e e e |
  e8. a16 c,8 d |
  d2 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  a8 g f g |
  a4. f8 |
  e4 a8 a |
  d,2 |
  r8 c c c |
  f8. f16 d8 d |
  d4 g8 f |
  f8. bf16 g8 g |
  a2 |
  f8 f a a |
  e4.
  \afterGrace e8 ({
    \override Flag.stroke-style = #"grace"
    f16)}
  \revert Flag.stroke-style
  a8 g f c |
  d2 ~ |
  d4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Của lễ cao trọng ta có thể dâng lên Chúa
  là sự bình an của chính mình và sự hòa thuận với từng anh em.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúa không nhận hy lễ của người sống bất hòa.
      Ngài truyền người ấy hãy rời bàn thờ đi làm hòa với anh em trước,
      Rồi Ngài sẽ chấp nhận của lễ dâng trong hòa bình.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúa mong rằng ai nấy đã từng lãnh Phép Rửa:
      Một lòng một ý sống đời hòa bình do cùng một Thánh Linh liên kết,
      sự hiệp nhất mẫu mực bởi Chúa Ba Ngôi hình thành.
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
    \override Lyrics.LyricSpace.minimum-distance = #2.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
