% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Xin Được Hiệp Nhất"
  poet = "Ý lời ca: Hồng y Newman"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  f4. c8 |
  a'16 (bf) a8 g g |
  g4. a8 |
  a f g bf |
  c4 bf8 bf |
  bf c d c16 (bf) |
  g4. g8 |
  d d g e16 (d) |
  c2 |
  r8 f e e |
  a4. bf8 |
  d, (f) a a |
  g4. d8 |
  g g e16 (d) g8 |
  c,4 r8 f |
  e a f a |
  bf4. b!8 |
  c4 bf8 bf |
  d, f g a |
  g4. f8 |
  e4 r8 e |
  f d g g |
  a8. f16 f8 f |
  bf (a) d, f |
  g2 ~ |
  g8 e e e |
  a f g (f) |
  d4 d8 e |
  c8. g'16 g8 a16 (g) |
  f2 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  f4. g8 |
  e (f) a a |
  d4. a8 |
  bf4. bf8 |
  g (bf) d c |
  c4 bf8 bf |
  d,8. g16 g8 g |
  c,2 |
  f4. g8 |
  e a f16 (g) bf8 |
  a4 g8 a |
  d,4. f8 |
  g g f d |
  c4. g'8 |
  a g e e |
  f2 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Ôi lạy Chúa Giê -- su Ki -- tô,
  Đấng gánh chịu bao khổ đau
  để cầu nguyện cho các môn đệ luôn được hiệp nhất nên một,
  Như sự hiệp nhất giữa Ngài với Chúa Cha và giữa Chúa Cha với Ngài.
  Xin nhìn đến sự chia rẽ sâu sắc
  giữa những người tuyên xưng đức tin nơi Ngài.
  Xin chữa lành bao thương tích mà sự lừa dối của Sa -- tan,
  và sự tự mãn của con người đang tác hại trên con cái Ngài.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Xin phá đổi những bức tường phân cách phe này với phe kia,
      giáo phái này với giáo phái nọ.
      Xin lấy lòng trắc ẩn đoái trông bao tín đồ phân tán
      giữa bao cộng đoàn do chính con người tạo nên.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Xin Chúa giải thoát tức thời ai vẫn mê muội trói thân
      trong cách tế tự khép kín lỗi lầm.
      Xin thục giục tất cả kết liên trong Giáo Hội
      do chính Chúa xưa tạo lập, công giáo tông truyền hiệp thông.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Xin Chúa dạy biết xác nhận:
      Duy nhất ngai tòa thánh Phê -- rô chính khí cụ nối kết Giáo Hội.
      Mong tín đồ tuy ở khắp nơi liên kết lại
      như nước Chúa trên thiên đàng,
      Danh Chúa vang dội trần gian.
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
    \override Lyrics.LyricSpace.minimum-distance = #1.2
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
    \override Lyrics.LyricSpace.minimum-distance = #1.5
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
