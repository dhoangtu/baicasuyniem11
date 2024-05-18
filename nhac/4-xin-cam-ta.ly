% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Cảm Tạ"
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
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  r8 f f f |
  e4 e8 a |
  d,4 r8 c |
  a'4. f8 |
  a a bf bf |
  g4. f8 |
  a8. g16 f8 d |
  d4. c8 |
  a' a f f |
  bf4 r8
  <<
    {
      d |
      d8. d16 d8 bf |
      c c4 bf8 |
      bf8. bf16 bf8 bf |
      g a4 a8 |
      bf bf g4 ~ |
      g8 g c e, |
      f2 ~ |
      f4 \bar "|."
    }
    \notBePhu -1 {
      bf8 |
      bf8. bf16 bf8 g |
      a a4 g8 |
      g8. g16 g8 g |
      e f4 f8 |
      g f e4 ~ |
      e8 d c c |
      a2 ~ |
      a4
    }
  >>
  
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 e16 (f) |
  d8. d16 g8 e |
  c4. f16 e |
  f8 d bf' a |
  g2 |
  bf8 (d) c bf |
  g4. g8 |
  g c a g |
  d4. d8 |
  c8. e16 g8 e |
  f4. d8 |
  c8. e16 g8 e |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Con xin dâng Ngài, lời cảm tạ,
  lạy Chúa, vì muôn ân phúc Chúa ban:
  Ngài nắn con nên hình hài rồi đưa con vào cuộc sống,
  Mỗi bước mỗi dắt dìu con đi,
  mỗi phút mỗi thắm thiết tình thân,
  con biết lấy gì đền đáp hồng ân.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Con chỉ là đầy tớ vô dụng, đâu được như lòng Chúa trông mong.
      Bảy mươi tuổi đời mà mộng ước luôn xa vời,
	    mong gì thanh thoát nghỉ ngơi, xin Ngài thương chớ bỏ rơi.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Con chỉ là đầy tớ vô dụng, đâu được như lòng Chúa trông mong.
	    Gẩy nên cung đàn mà thường lỡ cung sai nhịp,
	    không hòa thanh với hồng ân, nhưng Ngài đâu dứt tình thân.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Con chỉ là đầy tớ vô dụng, đâu được như lòng Chúa trông mong.
	    Trở nên linh mục, nguyện đời hiến dâng trung thực,
	    tuy còn sai lỗi nhiều phen, nhưng Ngài thương đỡ vực lên.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Con chỉ là đầy tớ vô dụng, đâu được như lòng Chúa trông mong.
	    Trải qua cơn bệnh mà Ngài chữa không vong mạng,
	    thêm thời gian để lập công, xin hằng kiên vững cậy trông.
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
  page-count = 1
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
    \override Lyrics.LyricSpace.minimum-distance = #0.6
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
          \nhacPhanHai
        }
      \new Lyrics \lyricsto beSop \loiPhanHai
    >>
  >>
  \layout {
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricSpace.minimum-distance = #0.6
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
