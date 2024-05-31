% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Lạy Các Thánh"
  poet = "Ý lời ca: Charles Delhez"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  c8 f f e |
  f (e) d d |
  bf' g g (bf) |
  c4. c8 |
  bf (c) g bf |
  c f, bf (g) |
  g4 a8 bf |
  a4 f8 a |
  g2 |
  bf8 c4 c8 |
  f,2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 c8 f |
  f e e4 |
  e8 f d (f) |
  g2 ~ |
  g8 e a f |
  g4 f8 f |
  e4 d8 d |
  g f e e |
  a2 |
  c,8 c e g |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Lạy các thánh nam nữ tràn đầy phúc lành của Chúa,
  xin chuyển lời ngợi ca của chúng con lên Chúa Cha,
  nhờ Chúa Con, trong Chúa Thánh Thần.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Lạy các thánh nông dân trên khắp trần gian
      từng tưới mồ hôi trên nương đồng để đổi lấy hoa mầu ruộng đất,
      Nguyện cầu cho chúng con.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Lạy các thánh khiêm nhu vui sống tại gia, làm bếp,
      bông em hay may giặt,
      ngày ngày vãi gieo tình trìu mến.
      Nguyện cầu cho chúng con.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Lạy các thánh tu sinh nam nữ mọi nơi, nguyện gẫm,
      cầu kinh trong huynh đệ, một lòng sống vui bởi tình Chúa,
      Nguyện cầu cho chúng con.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Lạy các thánh thông minh, uyên bác, tài ba
      hằng kiếm tìm nơi thiên nhiên này mầu nhieeim rất siêu việt của Chúa,
      Nguyện cầu cho chúng con.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "5."
      Lạy các thánh văn nhân, thi sĩ, nhạc sư
      tạo những niềm vui cho muôn người, làm rạng rỡ vẻ đẹp của Chúa,
      Nguyện cầu cho chúng con.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
