% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Người Bảo sao, Cứ Làm Vậy"
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
  \partial 8 c8 |
  a'8. g16 g8 e |
  f f4 a8 |
  f f bf a |
  g8. f16 a8 g16 (f) |
  d4 d16 (f) g8 |
  c,4 r8 f |
  f e g a |
  a4 \breathe a8 f |
  d8. d16 f8 d |
  c4. f8 |
  f e4 f8 |
  g4 g8 g16 (bf) |
  c8. bf16 c8 d |
  d4. f,8 |
  f4 a16 (c) a8 |
  g4 e8 e16 (f) |
  g4 a8 d, |
  d4 d8 d16 (e) |
  f4 g8 c, |
  c4 c8
  <<
    {
      g'8 |
      g8. g16 e8 e |
      f4
    }
    \notBePhu -2 {
      bf8 |
      bf8. bf16 g8 g |
      a4
    }
  >>
  r8 \bar "||"
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 8 c8 |
  c4 f |
  f4. e8 |
  e e a a |
  a4 r8 a |
  g f bf g |
  <<
    {
      \voiceOne
      c2 ~ |
      c8 bf
    }
    \new Voice = "bePhu" \notBePhu -2 {
      \voiceTwo
      r8 c, e f |
      g4
    }
  >>
  \oneVoice
  <<
    {
      d'8 bf |
      g4 g8 g |
      f4. f8 |
      bf4 r8 bf |
      g4 g8 c |
    }
    {
      g8 f |
      e4 e8 e |
      d4. d8 |
      g4 r8 f |
      e4 e8 e |
    }
  >>
  f2 |
  e8 e g a |
  d,4. d8 |
  d g f d |
  c4.
  <<
    {
      g'8 |
      e4. f8 |
      f2 ~ |
      f4 \bar "|."
    }
    {
      b,!8 |
      c4. bf8 |
      a2 ~ |
      a4
    }
  >>
}

nhacPhanBaSop = \relative c'' {
  \key f \major
  \time 2/4
  \repeat volta 2 {
    \bar ".|:"
    \partial 4
    a8 a16 (bf) |
    c4 d8 g, |
    g4 g8 g16 (a) |
    bf4 c8 g |
    f4. f8 |
    f bf4 a8 |
    g4 e8 e16 (f) |
    g4 a8 d, |
    d4 d8 d16 (e) |
    f4 g8 c, |
    c4. c8 |
    c g'4 f8 |
    f4
  }
}

nhacPhanBaBas = \relative c' {
  \key f \major
  \time 2/4
  f8 f16 (g) |
  a4 g8 f |
  e4 e8 e16 (f) |
  g4 f8 ef |
  d4. d8 |
  d g4 f8 |
  c4 c8 c16 (d) |
  e4 d8 c |
  bf4 bf8 bf16 (c) |
  d4 bf8 bf |
  a4. a8 |
  a bf4 bf8 |
  a4
}

% Lời
loiPhanMot = \lyricmode {
  <<
    {
      \set stanza = "1."
      Tiệc cưới hân hoan miền Ca -- na,
      Đức Mẹ và Chúa Giê -- su cùng các Tông Đồ là khách mời.
      Đang khi tiệc vui tiếp diễn,
      Hết rượu rồi, ôi hết rượu rồi,
      bao nhiêu người khổ tâm.
      Mẹ cảm thương và cho Chúa biết rồi dặn các gia nhân:
      Người bảo sao cứ làm vậy,
      Người bảo sao cứ làm vậy.
      Và nước lã biến thành rượu ngon.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
	    Mẹ đã khiêm cung và ''xin vâng''
	    khi được thần sứ loan tin Mẹ sẽ sinh hạ bởi Thánh Thần,
	    nghe tâm thần bao bối rối:
	    Có lẽ nào, ôi có lẽ nào tôi đây lại thụ thai,
	    vì chẳng khi nào tôi nghĩ tới,
	    Dầu vậy vẫn ''xin vâng''
	    vì bởi đâu có điều gì mà chằng khi Chúa làm được:
	    Lời Chúa hóa xác hèn phàm nhân.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
	    Chiều tím giăng giăng đồi Can -- vê,
	    Bóng Mẹ lần bước theo Con,
	    thập giá mang nặng để hiến mình,
	    Tâm can sầu đau héo hắt
	    Vẫn chẳng hề,
	    Mẹ vẫn chẳng hề buông ra lời thở than,
	    mà hiệp công cùng Con cứu thế hầu trọn lễ hy sinh.
	    Dù khổ đau đến cùng cực,
	    ngày hiển vinh vẫn đợi chờ,
	    chờ Chúa sẽ thắng trận phục sinh.
    }
  >>
}

loiPhanHai = \lyricmode {
  Lạy Mẹ La -- vang, Mẹ phù hộ các giáo hữu,
  Chúng con về đây hành hương
  từ khắp nẻo đường
  Tung hô Mẹ từ ái, cảm tạ và khẩn nài:
  Nguyện Mẹ thương chúc lành
  và dạy chúng con theo Mẹ suốt đời xin vâng.
}

loiPhanBa = \lyricmode {
  Người bảo sao cứ làm vậy,
  Người bảo sao cứ làm vậy,
  trọn vẹn tiếng ''xin vâng''.
  Người bảo sao cứ làm vậy,
  Người bảo sao cứ làm vậy,
  trọn vẹn tiếng ''xin vâng''.
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

\score {
  <<
    \new Staff \with {
        printPartCombineTexts = ##f
        \remove "Time_signature_engraver"
        instrumentName = \markup { \bold "CODA" }
      }
      <<
      \new Voice \partCombine 
        \nhacPhanBaSop
        \notBePhu -2 { \nhacPhanBaBas }
      \new NullVoice = nhacThamChieuSop \nhacPhanBaSop
      \new Lyrics \lyricsto nhacThamChieuSop \loiPhanBa
      >>
  >>
  \layout {
    indent = 17
    \override Staff.TimeSignature.transparent = ##t
    \override Lyrics.LyricSpace.minimum-distance = #1
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}