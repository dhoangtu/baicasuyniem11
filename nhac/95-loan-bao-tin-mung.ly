% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Loan Báo Tin Mừng"
  poet = "Ý lời ca: Đức Bênêditô XVI"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4. g8 a g16 (f) |
  d4 c8 c |
  g' g e a |
  a2 |
  f8 bf g g16 (bf) |
  c4. d8 |
  d bf a g |
  f2 ~ |
  f8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4. e8 e e |
  a4 a8 f |
  e e e a |
  d,4 d8 d |
  c4 f8 e |
  d bf' bf g |
  a4 a8 g |
  f f bf bf |
  bf g16 (bf) c4 ~ |
  c8 g a g |
  f2 ~ |
  f8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Loan báo Tin Mừng là làm chứng giữa lòng thế giới
  Lòng nhân hậu của Chúa muốn cứu độ hết mọi người.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Hoạt động Truyền Giáo sẽ chỉ là hoạt động xã hội hay nhân đạo
      nếu không được đức ái đưa dẫn,
      nếu không được tình yêu cao sâu của Chúa thôi thúc bang trợ.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Nhận mệnh lệnh Chúa, các Tông đồ hoàn thành sứ vụ Loan Tin Mừng,
      Thánh Linh ngự xuống giúp thêm sức,
      Tiếp liên từng thành viên yêu thương Hội Thánh theo bước lên đường.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
