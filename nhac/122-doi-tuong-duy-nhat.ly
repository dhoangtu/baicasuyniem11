% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Đối Tượng Duy Nhất"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \partial 8 d8 |
  b' a a8. fs16 |
  a8 g4 d'16 (e) |
  b8 c d4 ~ |
  d8 c a c |
  b2 ~ |
  b4 r8 e, |
  a8. a16 a8 e |
  d2 ~ |
  d4 r |
  r r8 d |
  b'8 b16 b b8 c |
  a4. d,8 |
  a' a16 a a4 ~ |
  a8 a g a |
  b2 ~ |
  b4 e8 e |
  e8. d16 c8 c |
  e a,4 b16 (a) |
  g4 r |
  R2
  r8 e a a |
  a8. e16 d8 a' |
  a g4. ~ |
  g4 r \bar "|."
}

nhacDiepKhucAlto = \relative c' {
  \partial 8 d8 |
  b' a a8. fs16 |
  a8 g4 b16 (c) |
  g8 a b4 ~ |
  b8 a fs a |
  g2 ~ |
  g4 r8 e |
  cs8. cs16 cs8 cs |
  d2 ~ |
  d4 r |
  r r8 d |
  g8 g16 g g8 a |
  fs4. d8 |
  cs cs16 cs d4 ~ |
  d8 d e fs |
  g2 ~ |
  g4 c8 c |
  c8. b16 a8 a |
  g fs4 fs8 |
  g4 r |
  R2
  r8 e d d |
  c8. c16 b8 c |
  c b4. ~ |
  b4 r
}

nhacDiepKhucBas = \relative c {
  d8 |
  b' a a8. fs16 |
  a8 g4. ~ |
  g4 r8 g |
  d8. d16 ef8 d |
  g4 a8. b16 |
  g8 e4. ~ |
  e4 a, |
  b r8 d' |
  b a16 (g) e8 g |
  a8. g16 fs8 fs |
  g4 r8 a, |
  d8 d16 d d4 |
  r8 e fs fs16 fs |
  fs8 fs e d |
  g,8. d'16 b8 d 
  g2 ~ |
  g4 r |
  r r8 d |
  b' b b8. a16 |
  g8 g b e, ~ |
  e4 r8 c |
  a4 d8 <fs d> |
  <fs d> <g g,>4. ~ |
  <g g,>4 r
}

nhacPhienKhucSop = \relative c'' {
  g8 g fs b |
  e,8. e16 g8 a |
  d,4. b'8 |
  c8. b16 a8 d |
  d d4 c16 c |
  e8 c a4 ~ |
  a8 c a c |
  b2 |
  r8 b8 c c |
  a4. d,16 d |
  b'8 a4 a8 |
  g4 r8 \bar "||"
}

nhacPhienKhucBas = \relative c' {
  \skip 2
  \skip 2
  d4. g8 |
  a8. g16 fs8 a |
  g fs4 a16 a |
  c8 g fs4 ~ |
  fs8 a fs a |
  g2 |
  r8 g e c |
  d4. b16 b |
  d8 c4 c8 |
  b4 r8
}

% Lời điệp khúc
loiDiepKhucSop = \lyricmode {
  Lạy Chúa Giê -- su chịu đóng đinh,
  đối tượng duy nhất của lòng trí con
  Chọn mến Thánh Giá của Ngài,
  Giờ đây xin hân hoan tiến lên
  Giờ đây xin trung kiên vui đời dâng hiến
  Thánh Giá Chúa luôn là niềm hãnh diện, hãnh diện
  Và Thánh Giá Chúa ban trợ vững bước liên.
}

loiDiepKhucBas = \lyricmode {
  Lạy Chúa Giê -- su chịu đóng đinh,
  đối tượng của trí lòng con,
  Đây những tâm hồn của Ngài
  Gắng sức tu luyện cần chuyên,
  tu luyện giờ đây
  Giờ đây xin hân hoan
  giờ đây xin trung kiên vui đời dâng trọn
  vui đời dâng hiến.
  Nhờ Thánh Giá Chúa luôn là nguồn sức mạnh
  ca hòa nhờ vững bước liên.
}

% Lời phiên khúc
loiPhienKhucSopMot = \lyricmode {
  \set stanza = #"1."
  Xin dâng lời cảm tạ vì ơn Chúa gọi,
  soi dẫn linh đạo Mến Thánh Giá,
  để lòng trí chiêm niệm Đấng chịu đóng đinh,
  xin mãi hiến thân phục vụ Chúa trong muôn người.
}

loiPhienKhucSopHai = \lyricmode {
  \set stanza = #"2."
  Xin ghi lòng khắc dạ vì nay Chúa chọn,
  vinh phúc dâng lời khấn với Chúa:
  chọn đời sống vâng phục, khó nghèo, khiết trinh,
  yêu mến Chúa liên,
  nguyện vì Chúa quyên thân mình.
}

loiPhienKhucSopBa = \lyricmode {
  \set stanza = #"3."
  Xin dâng lời khẩn nguyện được luôn vững bền
  mau mắn thi hành thánh ý Chúa
  và cùng với hội dòng,
  dõi đường Chúa đi,
  cho dẫu khó nguy, Ngài nhịp bước luôn, lo gì.
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

TongNhip = {
  \key g \major \time 2/4
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
}

% Đổi kích thước nốt cho bè phụ
notBePhu =
#(define-music-function (font-size music) (number? ly:music?)
   (for-some-music
     (lambda (m)
       (if (music-is-of-type? m 'rhythmic-event)
           (begin
             (set! (ly:music-property m 'tweaks)
                   (cons `(font-size . ,font-size)
                         (ly:music-property m 'tweaks)))
             #t)
           #f))
     music)
   music)

\score {
  \new ChoirStaff \with {
    \override StaffGrouper.staff-staff-spacing = #'(
                            (basic-distance . 14)
                            (padding . 1))
  }
  <<
    \new Staff \with {
        printPartCombineTexts = ##f
      }
      <<
      \new Voice \TongNhip \partCombine
        \nhacDiepKhucSop
        \notBePhu -2 { \nhacDiepKhucAlto }
      \new NullVoice = nhacThamChieuAlto \nhacDiepKhucSop
      \new Lyrics \lyricsto nhacThamChieuAlto \loiDiepKhucSop
      >>
    \new Staff <<
        \clef "bass"
        \new Voice = beBas {
          \TongNhip \nhacDiepKhucBas
        }
        \new Lyrics \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = diepKhuc \with {
        \consists "Merge_rests_engraver"
        printPartCombineTexts = ##f
      }
      <<
     \new Voice = "beSop" { \TongNhip \partCombine 
          \nhacPhienKhucSop
          \notBePhu -2 { \nhacPhienKhucBas } }
        \new NullVoice = nhacThamChieuPhienKhucSop \nhacPhienKhucSop
        \new Lyrics \lyricsto nhacThamChieuPhienKhucSop \loiPhienKhucSopMot
        \new Lyrics \lyricsto nhacThamChieuPhienKhucSop \loiPhienKhucSopHai
        \new Lyrics \lyricsto nhacThamChieuPhienKhucSop \loiPhienKhucSopBa
      >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
  }
}
