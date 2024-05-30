% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Cho Lòng Tin"
  poet = "Thơ: Đình Bảng"
  composer = "Lm. Kim Long"
  tagline = ##f
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

% Nhạc
nhacPhanMot = \relative c'' {
  \key f \major
  \time 2/4
  \partial 8
  \once \override Score.RehearsalMark.font-size = #0.1
  \mark \markup { \musicglyph #"scripts.segno" }
  <<
    {
      c8 |
      c4. a16 a |
      bf4. bf16 (d) |
      c4. c16 g |
    }
    {
      a8 |
      a4. f16 f |
      g4. g16 (bf) |
      a4. a16 e |
    }
  >>
  \grace g16 ( <a) f>4 r8
  <<
    {
      g8 |
      g4. f16 a |
      e4 d16 (e) d8 |
      c4. f8 |
      f2
      ^\markup { \halign #-3 \bold "Tận" }
      \bar "|."
    }
    \notBePhu -2 {
      bf8 |
      bf4. a16 d |
      g,4 bf16 (c) bf8 |
      g4. a8 |
      a2
    }
  >>
  
  a4 \tuplet 3/2 { bf8 bf a } |
  g2 |
  g4 \tuplet 3/2 { g8 g a } |
  e2 |
  d16 (e) c8 f e16 (f) |
  \grace a16 (g4.) d8 |
  d c4 f8 |
  \partial 4. f4 r8 \bar "||"
  
  \once \override Score.RehearsalMark.font-size = #0.1
  \mark \markup { \musicglyph #"scripts.segno" }
  
  f4 \tuplet 3/2 { e8 g g } |
  a2 |
  g4 \tuplet 3/2 { f8 a d, } |
  e2 |
  e8 d d d16 (f) |
  g4. e8 |
  e e4 g8 |
  \partial 4. a4 r8 \bar "||"
  
  \once \override Score.RehearsalMark.font-size = #0.1
  \mark \markup { \musicglyph #"scripts.segno" }
  
  f4 \tuplet 3/2 { e8 g f } |
  a4. a8 |
  bf bf4 f8 |
  g2 |
  f16 (g) d8 d e |
  e4. d16 (e) |
  c8 g'4 a8 |
  f4 r8 \bar "||"
  
  \once \override Score.RehearsalMark.font-size = #0.1
  \mark \markup { \musicglyph #"scripts.segno" }
}

% Lời
loiPhanMot = \lyricmode {
  Cho tôi một lòng tin
  Nhỏ nhoi như hạt cải,
  Cho tôi làm cỏ dại
  ở bên đường không tên.
  Tôi yếu đuối như sên,
  Tôi trơ thân gỗ mục
  Hãy gọi tôi tỉnh thức
  lập lòe một que diêm.
  Tôi trầm tư trong núi
  Như một gã tiều phu
  Xin làm nhà ẩn tu
  dù bèo bọt rêu rác.
  Vâng ngày mai tận thế
  Ai nấy xếp hàng đôi
  Hỏi người còn yêu tôi
  Rã rời thân cát bụi.
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
