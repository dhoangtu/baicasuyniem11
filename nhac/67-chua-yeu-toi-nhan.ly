% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Chúa Yêu Tội Nhân"
  poet = "Ý lời ca: Jean Galot"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c'' {
  \key bf \major
  \time 2/4
  \partial 4 bf8 a |
  a8. f16 f8 g |
  g4 d8 d |
  <<
    {
      bf'4. bf8 |
      a a bf c |
      d4 d8 d |
      bf8. a16 d8 d |
    }
    {
      g,4. g8 |
      d d g a |
      bf4 bf8 a |
      g8. g16 fs8 fs
    }
  >>
  g2 ~ |
  g4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key bf \major
  \time 2/4
  \partial 4 d8 d |
  g g f (g) |
  a2 |
  bf8 a a g |
  f (g) a a |
  d,4 d8 d |
  d4 d8 a' |
  bf8. a16 a8 d |
  g,4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Chúa Giê -- su đặc biệt yêu thương người tội lỗi,
  biểu lộ tình yêu Thiên Chúa muốn hoán cải và cứu chữa họ.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Lời đầu tiên trên thập giá Chúa xin tha cho kẻ kết án mình,
      biện hộ rằng: Họ không biết việc họ đã làm.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Cùng bị treo trên thập giá,
      Thoáng khi nghe tên trộm hối lỗi mình, liền nhủ rằng:
      Này anh sẽ được vào Nước Trời.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Nhìn lại ngay chân thập giá,
      Thấy Gio -- an bên cạnh Thánh Mẫu mình:
      Nguyện mẹ nhận người con đấy từ giờ phút này.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Nhìn lòng khoan nhân của Chúa
      khiến ta luôn tin tưởng đến với Người,
      dù nhiều lần vì mê đắm mà lại lỗi lầm.
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
    \override LyricHyphen.minimum-distance = #1
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
