% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Ave Maria"
  poet = "Bach - Gounod"
  composer = "Lời Việt: Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacDao = \relative c' {
  \key c \major
  \time 4/4
  c16 e g c e g, c e c, e g c e g, c e |
  c, d a' d f a, d f c, d a' d f a, d f |
  b,, d g d' f g, d' f b,, d g d' f g, d' f |
  c, e g c e g, c e c, e g a e' g, c e |
}

nhacPhanMot = \relative c' {
  \key c \major
  \time 4/4
  e1 |
  f2. f4 |
  g2. (d4) |
  e2. r4 |
  a2 ~ a8 a, b c |
  d4. e8 d2 |
  g2 ~ g8 g, a b |
  c4. d8 c2 |
  c'2 ~ c8 c, d e |
  f4. e8 d4 a |
  b2. r8 d |
  e2 ~ e8 e f g |
  a4. a,8 a2 |
  d2 ~ d8 d e f |
  g4. g,8 g2 |
  c2 ~ c8 c d e |
  f2 ~ f8 f g a |
  b4. a8 g4 d |
  e2. r8. e16 |
  g2 e4 r8. e16 |
  a2 a,4 r8. a'16 |
  a2 c,4 r8. a'16 |
  c2 e,4 r8. c'16 |
  c2 d,4 r8. d16 |
  d2 ~ d8 d c b |
  g'4. e8 c2 |
  f2 ~ f8 f e d |
  d'4. b8 g2 |
  a2 ~ a8 a b c |
  e2 ~ e8 c g e |
  d2 ~ d8 a' b a |
  g d' b g f d b g |
  c1 |
  c \bar "|."
}

% Lời
loiPhanMot = \lyricmode {
  A -- ve Ma -- ri -- a,
  Khắp trần gian gần xa hát ca,
  Với trọn niềm tin yêu thiết tha,
  Chúa từ xưa thương mến ở luôn cùng Mẹ.
  Mẹ ơi lòng Mẹ tinh trắng rạng ngời,
  Tình Mẹ luôn tươi thắm tuyệt vời.
  Mẹ đầy dư ân phúc,
  ngàn lời vinh chúc tán dương mọi đời.
  Me ơi Mẹ, nguyện đáp lời bao nhiêu người trong khổ sầu,
  vẫn khấn cầu
  Trông mong tay Mẹ dìu dắt chữa bầu.
  Xin khi qua cuộc sống lưu đày
  mẹ tỏ cho xem thấy chính Con lòng Mẹ.
  Thiên quốc cung lời với muôn người
  tán dương danh Mẹ khôn ngơi.
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
  page-count = 1
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
  <<
    \new Staff <<
        \clef treble
        \new Voice = beSop {
          \notBePhu -2 \nhacDao
        }
    >>
  >>
  \layout {
    \override Lyrics.LyricSpace.minimum-distance = #1
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
          \nhacPhanMot
        }
      \new Lyrics \lyricsto beSop \loiPhanMot
    >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricSpace.minimum-distance = #0.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
