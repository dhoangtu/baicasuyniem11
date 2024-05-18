% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Yêu Là Lựa Chọn"
  poet = "Ý lời ca: Jacky Marsaux"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f4 |
  f e8 e |
  e4 d8 d |
  d (e16 d) c8 f |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c'' {
  \key f \major
  \time 2/4
  \partial 4 g8 a |
  f g e f |
  \grace { d16 (e } d4.) c8 |
  f f e (f) |
  a2 ~ |
  a8 g e e |
  f2 ~ |
  f4 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Yêu thương là lựa chọn,
  là từ bỏ là hy sinh.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Không có tình yêu nào cao cả,
      bằng hy sinh mạng sống cho người mình yêu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Không dứt được bao tiện nghi nhỏ,
      làm sao ta hiểu biết đâu là tình yêu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
      \set stanza = "3."
      Ham muốn làm cõi lòng chia sẻ,
      thì sao tôn sợ Chúa vui hưởng bình an.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "4."
      \override Lyrics.LyricText.font-shape = #'italic
      Chưa thấy lòng khát vọng mãnh liệt và luôn tin tưởng Chúa,
      chưa gặp Ngài đâu.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
      \set stanza = "5."
      Nơi thế trần ai người can đảm liều hy sinh mạng sống,
      mai ngày trường sinh.
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
    \override Lyrics.LyricSpace.minimum-distance = #2
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
    \override Lyrics.LyricSpace.minimum-distance = #2
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
