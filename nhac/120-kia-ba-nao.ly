% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Kìa Bà Nào" 
  poet = "Hoàng Diệp"
  composer = "Lm. Kim Long viết bè phụ"
  tagline = ##f
}

% Nhạc
nhacDiepKhucSop = \relative c' {
  \partial 4 e8 e |
  e4 a8 c b4 a8 g |
  a2 r4 a8 a |
  c4 e8 f e4 e8 b |
  e2 a,4 c8 b |
  c4. c8 d4 c8 b |
  e,2 r4 e' |
  d4 e8 d e e a, a |
  a4 g8 g a2 ~ |
  \partial 2. a ~ a4 \bar "|." \break
  
  a8 a e'4 e8 b e d |
  e4 e8 a, b g! g4 |
  a8 e g a c4 b8 g |
  c b b2 r4 |
  e,8 e a4 a8 g a b |
  c4 b8 a b c d4 |
  d8 g, a a e4 e8 g |
  g f e2 r4 \bar "||"
}

nhacDiepKhucAlto = \relative c' {
  e8 e |
  e4 a8 c b4 a8 g |
  a2 r4 a8 a |
  a4 a8 a gs4 a8 a |
  b4. e,8 e4 a8 f |
  e4 e8 e a4 e8 d |
  c2 r4 c' |
  b4 c8 b c g e e |
  f4. d8 c4. e8 |
  f4 d8 d e4 
  
  r4 r a4. a8 |
  gs4 r d e |
  r c8 f e4 r |
  a gs2 r4 |
  r r f4. f8 |
  e4 r g fs |
  r d8 (c) b4 r |
  R1
}

nhacDiepKhucBas = \relative c' {
  r4 |
  R1
  r8 d c b c4 a8 g |
  f4 e8 d e4 a8 a |
  gs4 <b gs>8 <b gs> <c a>4 f,8 g! |
  c,4 c8 c f4 g8 gs |
  a4. e8 f d c4 |
  g'4. g8 g,4 c8 cs |
  d4. e8
  <<
    {
      \voiceOne
      a4. c8 |
      d4 b8 b c4
    }
    \new Voice = "splitpart" {
      \voiceTwo
      a,2 ~ |
      a ~ a4
    }
  >>
  \oneVoice
  
  r4 r a'4. f8 |
  e4 r g8 (b) c4 |
  r4 e,8 d c4 r |
  e8 (d) e8. f16 e8 d c4 |
  r4 r f4. d8 |
  c4 r e d |
  r f8 (a) gs4 r |
  r c8 d c b a4
}

% Lời
loiPhienKhucSopMot = \lyricmode {
  Kìa Bà nào đang tiến lên như rạng đông,
  Kìa Bà nào đang tiến lên như rạng đông,
  đẹp như mặt trăng,
  rực rỡ như mặt trời
  Oai hùng như đạo binh xếp hàng vào trận,
  Bà là ai.
  
  \set stanza = "1."
  Bà là ai, như huệ giữa chòm gai,
  như hồng thiêng mầu nhiệm,
  như Đền Vua vinh hiển,
  như thành thánh Sa -- lem.
  Bà là ai, như hào quang Thiên Chúa,
  như mùa xuân không úa,
  như vì sao mai rạng,
  như chính cửa Thiên Đàng.
}

loiPhienKhucSopHai = \lyricmode {
  \repeat unfold 39 { _ }
  \set stanza = "2."
  Bà là ai tinh tuyền lúc đầu thai,
  xác hồn như ngọc tuyền,
  dư đầy ơn Thiên Chúa,
  như nguồn nước vô biên.
  Bà là ai, tay bồng Vua thơ bé,
  tay tràn ơn cứu thế,
  Đấng từ bi nhân hậu
  hằng tiếp đón lời cầu.
}

loiPhienKhucAltoMot = \lyricmode {
  Kìa Bà nào đang tiến lên như rạng đông,
  Kìa Bà nào đang tiến lên như rạng đông,
  Bà đẹp như mặt trăng,
  và rực rỡ như mặt trời
  Oai hùng như đạo binh xếp hàng vào trận,
  là ai, là ai
  Bà là ai.
  
  Như chòm gai
  mầu nhiệm
  Vua vinh hiển
  thánh lem
  Như thiên tòa
  xuân mùa
  sao rạng
  Như chính cửa thiên đàng.
}

loiPhienKhucAltoHai = \lyricmode {
  \repeat unfold 45 { _ }
  Khi đầu thai
  ngọc tuyền
  ơn thiên tòa
  vô biên
  Tay thơ bé
  cứu độ
  nhân hậu
  Hằng tiếp đón lời cầu.
}

loiPhienKhucBasMot = \lyricmode {
  Tiến như rạng đông,
  Kìa bà nào đang hiện lên như rạng đông,
  Bà là ai như cung hằng
  và rực rỡ như mặt trời,
  như chiến binh oai dũng
  xếp hàng đang vào trận, là ai.
  là ai Bà là ai.
  
  Như chòm gai
  mầu nhiệm
  Vua vinh hiển
  Sa -- lem thánh đô rạng ngời
  Như thiên tòa
  xuân mùa
  sao rạng
  Như chính cửa thiên đàng.
}

loiPhienKhucBasHai = \lyricmode {
  \repeat unfold 42 { _ }
  Khi đầu thai
  ngọc tuyền
  ơn thiên tòa
  vô biên nước khơi trong nguồn
  Tay thơ bé
  cứu độ
  nhân hậu
  Hằng tiếp đón lời cầu.
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
  systems-per-page = 3
}

TongNhip = {
  \key c \major \time 4/4
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1 1)
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
  \new ChoirStaff <<
    \new Staff <<
        \clef treble
        \new Voice = beSop {
          \TongNhip \nhacDiepKhucSop
        }
      \new Lyrics \lyricsto beSop \loiPhienKhucSopMot
      \new Lyrics \lyricsto beSop \loiPhienKhucSopHai
    >>
    \new Staff <<
        \clef treble
        \new Voice = beAlto {
          \TongNhip \nhacDiepKhucAlto
        }
      \new Lyrics \lyricsto beAlto \loiPhienKhucAltoMot
      \new Lyrics \lyricsto beAlto \loiPhienKhucAltoHai
    >>
    \new Staff <<
        \clef "bass"
        \new Voice = beBas {
          \TongNhip \nhacDiepKhucBas
        }
      \new Lyrics \lyricsto beBas \loiPhienKhucBasMot
      \new Lyrics \lyricsto beBas \loiPhienKhucBasHai
    >>
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #0.6
    \override LyricHyphen.minimum-distance = #0.6
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}