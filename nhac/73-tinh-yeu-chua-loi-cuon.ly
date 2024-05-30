% Cài đặt chung
\version "2.24.3"
\include "english.ly"

\header {
  title = "Tình Yêu Chúa Lôi Cuốn"
  poet = "Ý lời ca: Yvon Daigneault"
  composer = "Lm. Kim Long"
  tagline = ##f
}

% Nhạc
nhacPhanMot = \relative c' {
  \key f \major
  \time 2/4
  \partial 4. c8 f f |
  f2 |
  e16 (f) g8 f d |
  c4. a'8 |
  bf a bf a |
  g4 c8 c |
  f,4 f16 (g) g8 |
  d4 r8 d |
  d16 (e) c8 a'16 (bf) a8 |
  g4 g8 a |
  g4. f8 |
  bf8. a16 c8 c |
  bf4 g8 f |
  f2 ~ |
  f4 \bar "|."
}

nhacPhanHai = \relative c' {
  \key f \major
  \time 2/4
  \partial 4 f8 d |
  d4. c8 |
  c c f (g) |
  a2 ~ |
  a8 f f f |
  g8. a16 a8 g16 (f) |
  d4 r8 d |
  d2 ~ |
  d8 c c f |
  e e e f16 (g) |
  a4 f8 g16 (f) |
  d8. c16 c8 g' |
  f2 ~ |
  f8 \bar "||"
}

% Lời
loiPhanMot = \lyricmode {
  Tình yêu vô biên của Đấng chăn chiên lành
  lên tiếng lôi cuốn con người đến với Ngài,
  để chữa lành, và để mặc áo vinh quang
  cho những ai nghèo đói đang sống vất vưởng trên đường đời.
}

loiPhanHai = \lyricmode {
  <<
    {
      \set stanza = "1."
      Ta được mời vào bàn tiệc của Chúa,
      bàn tiệc hiệp thông giữa các tâm hồn.
      Nơi đây mọi lời tâm sự đều được cảm thấu,
      và thân tình là luật tối cao.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "2."
      \override Lyrics.LyricText.font-shape = #'italic
      Ta được mời vào bàn tiệc của Chúa,
      bàn tiệc làm ta trút hết ưu phiền,
      Nơi ta nhận lời tâm sự ngọt ngào của Chúa,
      là sinh lực, là nguồn sống ta.
    }
    \new Lyrics {
	    \set associatedVoice = "beSop"
	    \set stanza = "3."
      Ta được mời vào bàn tiệc của Chúa,
      rồi được mời đi đến với bao người chưa hay
      hoặc là chưa thực bằng lòng trả đáp,
      hoặc nghi ngờ là chẳng bõ công.
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
    \override Lyrics.LyricSpace.minimum-distance = #0.5
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
    \override Lyrics.LyricSpace.minimum-distance = #0.8
    \override Score.BarNumber.break-visibility = ##(#f #f #f)
    \override Score.SpacingSpanner.uniform-stretching = ##t
    ragged-last = ##f
  }
}
