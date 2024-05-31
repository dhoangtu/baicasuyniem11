% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Kính Chào Đức Mẹ Tàpao"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
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

nhacDiepKhucSop = \relative c'' {
  \partial 8 g8 |
  fs g g e |
  d4 r8 g |
  fs4. g8 |
  g b b16 [(a) g8] |
  a4. a16 g |
  c4. cs8 |
  d4 r8 b |
  a d b (a) |
  e4. e8 |
  d4. g8 |
  a b e, g |
  a4 g8 g |
  c4 a8 a |
  d4 d8 d |
  b4. a8 |
  d b16 a fs8 fs |
  g4 r8 \bar "||" \break
  
  d'8 |
  b4 d8 g, |
  g4. g8 |
  b e,4 g8 |
  a4. c16 c |
  c8 c c c |
  e4. b16 b |
  b8 b b b |
  d4. d8 |
  b4 d8 g, |
  g4. g8 |
  b e,4 g8 |
  a4 r8 a16 a |
  fs8 a g e |
  d4. d16 d |
  a'8 a fs fs |
  g2 ~ |
  g4 r8 \bar "|."
}

nhacDiepKhucAlto = \relative c'' {
  g8 |
  fs g g e |
  d4 r8 g |
  fs4. e8 |
  e ds e e |
  fs4. fs16 f! |
  e4. g8 |
  fs4 r8 g |
  fs fs g (d) |
  cs4. cs8 |
  d4. g8 |
  a b e, g |
  fs4 e8 d |
  g4 g8 g |
  fs4 fs8 fs |
  g4. fs8 |
  g g16 e c8 c |
  b4 r8
  
  d'8 |
  b4 d8 g, |
  g4. e8 |
  d cs4 e8 |
  d4. e16 e |
  e8 e e a |
  gs4. gs16 gs |
  g!?8 g g g |
  fs4. fs8 |
  g4 g8 d |
  e4. e8 |
  d cs4 e8 |
  d4 r8 cs16 cs |
  d8 e d cs |
  d4. d16 d |
  e8 e c c |
  b2 ~ |
  b4 r8
}

nhacDiepKhucBas = \relative c' {
  r8 |
  r4 r8 g |
  fs g g e |
  d8. d16 d8 e |
  c ([b c]) e |
  d4 d |
  c8. (b16) a8 a |
  d4 r |
  R2
  r4 a'8 (g) |
  f f g e |
  c4 e |
  d g8 f! |
  e4 e8 e |
  d4 d8 d |
  e4. c8 |
  b8. c16 d8 d |
  g4 r8
  
  d' |
  b4 d8 g, |
  g4 c |
  g a8 (g) |
  fs4 d8 a'16 a |
  a8 a a a |
  e4. e16 e |
  e8 e e e |
  d4 d |
  e4 b8 b |
  c4 c' |
  g a8 (g) |
  fs4 r8 a16 a |
  b8 e, g g |
  fs4. g16 b, |
  c8 c d d |
  <g g,>2 ~ |
  <g g,>4 r8
}

% Lời
loiDiepKhucSopMot = \lyricmode {
  \set stanza = "1."
  Nơi rừng sâu âm u này,
  nơi này Tượng Mẹ giãi nắng dầm mưa
  ai người nhớ hay biết,
  Nhưng Mẹ đã soi đường,
  soi đường để con cái tìm về đây
  tìm về đây, tìm về đây tôn vinh Mẹ,
  nhận lãnh muôn ân lộc Mẹ ban.
  
  Chúng con kính chào Mẹ,
  lạy Đức Mẹ Ta -- pao,
  Xin Trinh Vương khoan nhân thương mến
  bao con dân theo nhau tuôn đến
  thiết tha khấn cầu Mẹ,
  lạy Đức Mẹ Ta -- pao,
  Xin ban tặng phúc ân bởi trời
  từng người đến khấn cầu, Mẹ ơi.
}

loiDiepKhucSopHai = \lyricmode {
  \set stanza = "2."
  Bao người đang trông lên Mẹ,
  bao người nhờ Mẹ giúp đỡ ủi an
  cho vượt thắng nguy khó,
  Nương nhờ cánh tay Mẹ,
  tay Mẹ để kiên vững trọn niềm tin,
  tìm về đây, tìm về đây tôn vinh Mẹ
  nguyện sắt son yêu Mẹ thành tâm.
}

loiDiepKhucSopBa = \lyricmode {
  \set stanza = "3."
  Đoan nguyện ''xin vâng'' như Mẹ,
  như Mẹ thực hiện ý Chúa,
  chẳng ngơi suy niệm mãi Lời Chúa,
  Trung thành sống Tin Mừng,
  Tin Mừng lần theo chuỗi hạt Mân Coio,
  tìm về đây, tìm về đây tôn vinh Mẹ
  từng bước đi theo Mẹ mọi nơi.
}

loiDiepKhucBasMot = \lyricmode {
  \set stanza = "1."
  Nơi rừng sâu âm u này
  tượng Mẹ giãi dầu nắng mưa,
  ai người nào hay biết
  Soi đường để con cái tìm đến đây, tìm đến đây,
  tìm đến đây tôn vinh Mẹ
  nhận lãnh ân lộc Mẹ ban.
  
  Chúng con kính chào Mẹ, Đức Mẹ Ta -- pao
  nguyên xin Trinh Vương khoan nhân
  thương mến bao con dân theo nhau tuôn đến
  thiết tha khẩn cầu Mẹ Đức Mẹ Ta -- pao,
  Xin ban tặng lộc ân bởi trời
  những người đến khẩn cầu, Mẹ ơi.
}

loiDiepKhucBasHai = \lyricmode {
  \set stanza = "2."
  Bao người đang trông lên Mẹ
  nhờ Mẹ giúp đỡ ủi an
  cho vượt ngàn nguy khó,
  tay Mẹ để kiên vững trọn niềm tin,
  tìm về đây, tìm về đây tôn vinh Mẹ
  nguyện thề yêu Mẹ thành tâm.
}

loiDiepKhucBasBa = \lyricmode {
  \set stanza = "3."
  Đoan nguyện ''xin vâng'' như Mẹ
  thực hiện ý Chúa chẳng ngơi,
  suy niệm từng Lời Chúa
  Tin Mừng lần theo chuỗi hạt Mân Côi,
  tìm về đây, tìm về đây tôn vinh Mẹ
  những được theo Mẹ mọi nơi.
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
  page-count = 3
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
  \new ChoirStaff <<
    \new Staff = "2" \with {
        \consists "Merge_rests_engraver"
        printPartCombineTexts = ##f
      }
      <<
      \new Voice \TongNhip \partCombine 
        \nhacDiepKhucSop
        \notBePhu -2 { \nhacDiepKhucAlto }
      \new NullVoice = beSop \nhacDiepKhucSop
      \new Lyrics \lyricsto beSop \loiDiepKhucSopMot
      \new Lyrics \lyricsto beSop \loiDiepKhucSopHai
      \new Lyrics \lyricsto beSop \loiDiepKhucSopBa
      >>
    \new Staff = "3" <<
        \clef "bass"
        \new Voice = beBas {
          \TongNhip \nhacDiepKhucBas
        }
      \new Lyrics \lyricsto beBas \loiDiepKhucBasMot
      \new Lyrics \lyricsto beBas \loiDiepKhucBasHai
      \new Lyrics \lyricsto beBas \loiDiepKhucBasBa
    >>
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    \context {
      \Staff \RemoveEmptyStaves
      \override VerticalAxisGroup.remove-first = ##t
    }
  }
}
