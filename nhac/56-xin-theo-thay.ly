% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Theo Thầy"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc điệp khúc
nhacDiepKhucSop = \relative c' {
  \key f \major \time 2/4
  R2
  R2
  r4 r8 c |
  f c d f |
  g4 g8 g |
  f4. f8 |
  bf8 bf bf bf |
  g4. f8 |
  c' c c c |
  a4. f8 |
  d' d4 bf8 |
  c c r a |
  bf bf a f |
  g2 ~ |
  g4 f8 f |
  d4. d8 |
  g8. f16 f8 d |
  c4. c8 |
  f e g a |
  a4. f8 |
  bf g bf c |
  c8. c16 d8 c |
  a2 ~ |
  a8 bf g g |
  c4. a16 _(g) |
  c,8 g' g16 (a) e8 |
  f2 ~ |
  f4 \bar "|."
}

nhacDiepKhucAlto = \relative c' {
  \key f \major \time 2/4
  R2
  R2
  r4 r8 c |
  f c d f |
  g4 g8 g |
  f4. f8 |
  f f f f |
  c4. d8 |
  g g g g |
  d4. d8 |
  f f4 f8 |
  e e r8 f |
  d d f d |
  e2 ~ |
  e4 f8 f |
  d4. d8 |
  g8. f16 f8 d |
  c4. c8 |
  a c c c |
  f4. f8 |
  g e g g |
  a8. a16 bf8 g |
  f2 ~ |
  f8 g f f |
  e4. d8 |
  bf bf bf [bf] |
  a2 ~ |
  a4
}

nhacDiepKhucBas = \relative c' {
  \key f \major \time 2/4
  g8 a a g16 (f) |
  d4 \grace f16 (g8) f |
  c2 ~ |
  c |
  c4 bf'8 bf |
  a4. a8 |
  d, d d d |
  e4. f8 |
  e e e e |
  f4. d8 |
  bf bf4 d8 |
  c c r d |
  bf bf d f |
  c2 ~ |
  c4 f8 f |
  d4. d8 |
  g8. f16 f8 d |
  c4. r8 |
  R2
  R2
  R2
  r8 f e e |
  f8. f16 g8 f |
  d4. d8 |
  c d a (bf) |
  c4. c8
  <f f,>2 ~ |
  <f f,>4
}

% Nhạc phiên khúc
nhacPhienKhucSop = \relative c' {
  \key f \major \time 2/4
  \partial 4 f8 f |
  e4. e8 |
  a f f d |
  c4 g'8 g |
  f4. f8 |
  f a bf g |
  c2 ~ |
  c8 bf d d |
  c4 f,8 a |
  bf bf g4 ~ |
  g8 c, g' e |
  f2 ~ |
  f4 r \bar "||"
}

nhacPhienKhucAlto = \relative c' {
  \key f \major \time 2/4
  
}

nhacPhienKhucBas = \relative c' {
  \key f \major \time 2/4
  r4
  r4 c8 bf |
  a8. a16 g8 f |
  e4 r |
  r f8 ef |
  d4. f8 |
  e g f e |
  d4 r |
  r8 c d f |
  g f e c |
  g' (a) bf g |
  a2 ~ |
  a4 r
}

% Lời điệp khúc
loiDiepKhucAlto = \lyricmode {
  Con đã trọn niềm xin vâng:
  Xin theo Thầy dù khi thân con đơn độc,
  dù bao gian nguy vây bọc,
  Thầy bước tới dìu con đi,
  con quyết sắt son niềm tin.
  Xin theo Thầy, Thầy biết con đây yêu Thầy,
  Dù đôi lần con yếu đuối,
  lòng chân thành xin thống hối,
  con quyết theo Thầy.
  Chỉ mình Thầy có những lời ban phúc trường sinh.
}

loiDiepKhucBas = \lyricmode {
  Nghe tiếng Chúa kêu mời: Hãy theo Thầy,
  vâng: Xin theo Thầy dẫu khi thân con đơn độc,
  dẫu bao gian nguy vây bọc,
  Thầy bước tới dắt con đi con nguyện sắt son đức tin.
  Xin theo Thầy, Thầy biết con đây yêu Thầy.
  Con nguyện theo Thầy, con quyết theo Thầy,
  chỉ Thầy có những lời trường sinh.
}

% Lời phiên khúc
loiPhienKhucMotSop = \lyricmode {
  \set stanza = #"1."
  Con nghe Thầy, dù đã thâu đêm lao nhọc,
  con nghe Thầy, vì Thầy con sẽ thả lưới,
  Thầy khiến mắt con được vui sướng
  ngắm trông thuyền cá đầy khoang.
}

loiPhienKhucHaiSop = \lyricmode {
  \set stanza = #"2."
  Con theo Thầy dù phải hy sinh thân mình,
  con theo Thầy dù đường xa vắng mù tối,
  Thầy đến với con và nâng đỡ đức tin hèn yếu của con.
}

loiPhienKhucBaSop = \lyricmode {
  \set stanza = #"3."
  Con tin Thầy là Đấng muôn dân trông đợi,
  con tin Thầy thật là Con Chúa hằng sống,
  Thầy đã mến thương truyền con hãy tín trung gìn giữ đoàn chiên.
}

loiPhienKhucBonSop = \lyricmode {
  \set stanza = #"4."
  Con yêu Thầy dù biết con đơn hèn,
  con yêu Thầy nguyện thề luôn mãi thành tín,
  Gặp lúc khó nguy, Thầy giơ sẵn cánh tay mà đỡ vực con.
}

loiPhienKhucMotBas = \lyricmode {
  \set stanza = #"1."
  Con nghe Thầy thâu đêm lao nhọc
  Con nghe Thầy, con thả lưới khi nghe Thầy
  Thầy cho con sướng vui trông được thuyền cá đầy khoang.
}

loiPhienKhucHaiBas = \lyricmode {
  \set stanza = #"2."
  Con theo Thầy hy sinh thân mình.
  Con theo thầy khi đường tối tăm mịt mù.
  Thầy mau nâng đỡ đức tin thật hèn yếu của con.
}

loiPhienKhucBaBas = \lyricmode {
  \set stanza = #"3."
  Con tin Thầy muôn dân trông đợi.
  Con tin Thầy Con Một Chúa Cả uy quyền.
  Thầy truyền hãy tin trung mà chăn giữ đoàn chiên.
}

loiPhienKhucBonBas = \lyricmode {
  \set stanza = #"4."
  Con yêu Thầy dẫu con đơn hèn.
  Con yêu Thầy con nguyện sẽ luôn trung thành.
  Thầy thương giơ sẵn cánh tay quyền uy đỡ vực con.
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
  \new ChoirStaff
  <<
    \new Staff \with {
        printPartCombineTexts = ##f
      }
      <<
      \new Voice \partCombine 
        \nhacDiepKhucSop
        \notBePhu -2 { \nhacDiepKhucAlto }
      \new NullVoice = nhacThamChieuSop \nhacDiepKhucSop
      \new Lyrics \lyricsto nhacThamChieuSop \loiDiepKhucAlto
      >>
    \new Staff <<
        \clef "bass"
        \new Voice = beBas {
          \nhacDiepKhucBas
        }
        \new Lyrics = "hatLanMot" \lyricsto beBas \loiDiepKhucBas
    >>
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
        printPartCombineTexts = ##f
      }
      <<
      \new Voice \nhacPhienKhucSop
      \new NullVoice = nhacThamChieu \nhacPhienKhucSop
      \new Lyrics \lyricsto nhacThamChieu \loiPhienKhucMotSop
      \new Lyrics \lyricsto nhacThamChieu \loiPhienKhucHaiSop
      \new Lyrics \lyricsto nhacThamChieu \loiPhienKhucBaSop
      \new Lyrics \lyricsto nhacThamChieu \loiPhienKhucBonSop
      >>
    \new Staff <<
        \clef "bass"
        \new Voice = beBas {
          \nhacPhienKhucBas
        }
        \new Lyrics \lyricsto beBas \loiPhienKhucMotBas
        \new Lyrics \lyricsto beBas \loiPhienKhucHaiBas
        \new Lyrics \lyricsto beBas \loiPhienKhucBaBas
        \new Lyrics \lyricsto beBas \loiPhienKhucBonBas
    >>
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
  }
}
