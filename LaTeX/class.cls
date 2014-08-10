
\dblfloatsep 12pt plus 2pt minus 2pt
\dbltextfloatsep 20pt plus 2pt minus 4pt

\@fptop 0pt plus 1fil
\@fpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil
\@dblfptop 0pt plus 1fil
\@dblfpsep 8pt plus 2fil
\@dblfpbot 0pt plus 1fil

\maxdepth=4pt

\oddsidemargin-18pt
\advance\oddsidemargin-.5in
\evensidemargin-6pt
\oddsidemargin=0pt

\advance\oddsidemargin-.5in
\evensidemargin=0pt
\advance\evensidemargin-.5in
\marginparwidth .75in

\if@twocolumn
 \setlength\marginparsep {10\p@}
\else
  \setlength\marginparsep{7\p@}
\fi
\setlength\marginparpush{5\p@}

\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

\renewcommand{\normalsize}{%
\ifdraft
   \@setfontsize\normalsize\@xpt\@xviipt
\else
   \@setfontsize\normalsize\@xpt\@xiipt
\fi
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand{\small}{%
\ifdraft
   \@setfontsize\small\@ixpt{17}%
\else
   \@setfontsize\small\@ixpt{11}%
\fi
   \abovedisplayskip 8.5\p@ %\@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ %\@plus2\p@
   \belowdisplayshortskip 4\p@ %\@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}


\newcommand{\contentsname}{CONTENTS}
\newcommand{\bibname}{Bibliography}
\newcommand{\indexname}{INDEX}
\newcommand{\figurename}{Figure}
\newcommand{\tablename}{Table}
\newcommand{\partname}{PART}
\newcommand{\chaptername}{Chapter}
\newcommand{\appendixname}{Appendix}

\def\glossary{%
\noindent\leftskip=0.25in%
\def\term##1{%
\vskip3pt\indent%
\hbox to 1.5in {%
\bf ##1 \hfill}\hangindent=1.5in%
\relax}}
