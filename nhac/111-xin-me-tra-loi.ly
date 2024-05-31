% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Mẹ Trả Lời"
  poet = "Ý lời ca: Thánh Bernard Clairvaux"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key c \major
  \time 2/4
  e8 d d16 (e) c8 |
  g'2 |
  e8 e a a |
  a4. fs8 |
  fs fs g4 |
  g8 c a (c) |
  d4. b8 b c d d |
  g,2 |
  e8 d d16 (e) c8 |
  g'2 |
  e8 e a a |
  a4 r8 f |
  g a g (e) |
  d4. d8 |
  g4 g8 d |
  c2 ~ |
  c4 r8 \bar "|."
}

nhacPhanHai = \relative c' {
  \key c \major
  \time 2/4
  \partial 8 e8 |
  d d g d |
  c4. 8 |
  c c c e |
  f4 r8 d |
  g4. e8 |
  a fs g e |
  d4 d8 e |
  c c a' a |
  g2 ~ |
  g4 r \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Xin Mẹ trả lời đi, lạy Mẹ Ma -- ri -- a,
  Mẹ được truyền tin: Mẹ sẽ thụ thai bởi quyền năng Chúa Thánh Thần.
  Xin Mẹ trả lời đi, lạy Mẹ Ma -- ri -- a
  để thiên sứ quay về cùng Đấng đã sai ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Chúng con mang án tử hình, đợi chờ một lời thương xót,
      Giờ đây lời ấy được trao cho Mẹ như giá chuộc phần rỗi chúng con.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Chúng con trong chốn lưu đày,
      từ thần hoành hành kinh hãi,
      đợi trông lời ngắn gọn thôi của Mẹ
      vui sướng nhận hồng phúc tái sinh.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Chính A -- đam với E -- và ngậm ngùi miệt mài than khóc nài van
      cùng với tiền nhân bao đời luôn ngóng đợi một Đấng Cứu Tinh.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Tiếng ''Xin vâng'' Chúa trông đợi, người tù đầy được ân xá,
      và cho người bất hạnh vơi ưu phiền,
      ơn Cứu Độ tràn khắp thế gian.
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
    \override LyricHyphen.minimum-distance = #1.2
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
