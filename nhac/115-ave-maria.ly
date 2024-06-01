% Cài đặt chung\
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ave Maria"
  poet = "Nhạc: Schubert"
  composer = "Lời Việt: Lm. Kim Long"
  tagline = ##f
}

% Nhạc phiên khúc
nhacPhienKhucSop = \relative c'' {
  \key bf \major \time 4/4
  \autoBeamOff
  bf4. a16 bf d4.. (c16) \bar "|"
  bf4 r c \grace { d16 ([c] } bf16) a g a \bar "|"
  bf4 r8 d d8. c32 ([bf]) a16 g d'16. e32 \bar "|"
  d4 cs8. a16 c!8. bf16 \tupletUp \tuplet 6/2 { a c d ef! c a } \bar "|"
  bf4. d16 c c8. a16 \tuplet 6/2 { g b! d f d bf } \bar "|"
  c4 ~ \tuplet 6/2 { c16 g a
  \afterGrace bf16 ({
    \override Flag.stroke-style = #"grace"
    \stemDown c32 [bf])} \stemNeutral
  \revert Flag.stroke-style
  a16 g } f4 r8 f \bar "|"
  c'8. c16 c16. bf32 \bar "" c16. d32 c16. d32 bf4 r8 bf \bar "|"
  c8. c16 c bf c e d c bf4 r8 bf \bar "|"
  c8. c16 d8. d16
  \tuplet 3/2 { \grace { \stemDown d32 ^([ef] } d16) c d } \stemNeutral
  f16. (e32) e8 r8. g,16 \bar "|"
  c8. c16 bf a bf d d bf c4. r8 \bar "|"
  bf4. a16 bf d4.. (c16) \bar "|"
  bf2 r2 \bar "|."
}

% Lời phiên khúc
loiPhienKhucSop = \lyrics {
  <<
    {
      A -- ve Ma -- ri -- a
      Ôi Nữ Trinh đầy hồng ân.
      Chính Chúa đã dủ tình thương đoái trông Mẹ,
      Mẹ ơi, Danh Mẹ vinh sáng khắp trên trần gian.
      Chúa Giê -- su Con lòng Mẹ ân phúc luôn tràn lan,
      Mẹ ban phát cho nhân trần.
      Mẹ ơi, con ca mừng thiên chức mẹ Chúa Trời,
      Triều thiên lung linh mười hai ánh sao rạng ngời
      Từ nơi cao sáng xin thương nhìn xem chúng con,
      Hằng trông mong hưởng phần vinh phúc trên trời ca.
      A -- ve Ma -- ri -- a.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
      \override Lyrics.LyricText.font-shape = #'italic
      Ôi Mẹ Ma -- ri -- a,
      Xin đoái thương nhìn hồn con,
      Kiếp sống nơi gian trần bao nỗi u hoài,
      Mẹ ơi con quỳ đây xin ngắm trông Mẹ thôi,
      Chắp đôi tay, đơn thành con không có chi để dâng
      và không biết chi kêu cầu.
      Mẹ ơi, con xin hòa ca với muôn phẩm thần,
      Ngợi khen bao ân lộc Thiên Chúa ban cho Mẹ,
      Mẹ ơi, xin nhớ bao linh hồn đang khổ đau,
      Thành tâm trông lên Mẹ xin xót thương ủi an.
      Ôi Mẹ Ma -- ri -- a.
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
  #(define fonts
	 (make-pango-font-tree "Deja Vu Serif Condensed"
	 		       "Deja Vu Serif Condensed"
			       "Deja Vu Serif Condensed"
			       (/ 20 20)))
  print-page-number = ##f
}

\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "beSop" {
        \clef treble \nhacPhienKhucSop
      }
      \new Lyrics \lyricsto beSop \loiPhienKhucSop
    >>
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \set Staff.measureBarType = #'()
    ragged-last = ##f
    indent = 0
  }
}
