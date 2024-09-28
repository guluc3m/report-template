% =========================================================================== %
%% uc3mreport.cls : LaTeX Class File
% =========================================================================== %
% Authors: Luis Daniel Casais Mezquida <luisdaniel.casais@alumnos.uc3m.es> &
%          Jose Antonio Verde Jiménez <joseaverde@protonmail.com>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uc3mreport}[UC3M report template]



%----------
% GENERAL PACKAGES
%----------

\RequirePackage{enumerate}
\RequirePackage{etoolbox}



%----------
% PACKAGE OPTIONS
%----------

% en: english
\newif\if@langen@pp\@langen@ppfalse  % check es language
\DeclareOption{en}{\@langen@pptrue}

% es: spanish
\newif\if@langes@pp\@langes@ppfalse  % check en language
\DeclareOption{es}{\@langes@pptrue}

\ProcessOptions\relax



%----------
% DOCUMENT SETTINGS
%----------

\LoadClass[12pt]{article}

% margins: 2.5 cm top and bottom; 3 cm left and right
\RequirePackage[a4paper, vmargin=2.5cm, hmargin=3cm]{geometry}
\RequirePackage{emptypage}  % removes headers/footers from empty pages

% Paragraph Spacing and Line Spacing: Narrow (6 pt / 1.15 spacing) or Moderate (6 pt / 1.5 spacing)
\renewcommand{\baselinestretch}{1.15}
\parskip=6pt

% blue footnote line
\preto{\footnoterule}{\color{azulUC3M}}
\appto{\footnoterule}{\color{black}}

%----------
% ENCODING & FONTS
%----------

\RequirePackage[utf8]{inputenc}  % utf-8
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}  % times new roman



%----------
% LANGUAGE
%----------

\if@langes@pp  % spanish
	\RequirePackage[spanish,es-tabla,es-noindentfirst]{babel}
	\RequirePackage[babel,spanish=spanish]{csquotes}
	\selectlanguage{spanish}

	\def\@text@of{de}
	\def\@text@professor{Profesor}
	\def\@text@group{Grupo}
	\def\@text@group@abbr{grp.}
	\def\@text@references{Referencias}
\fi

\if@langen@pp  % english
	\RequirePackage[english]{babel}
	\RequirePackage[babel,english=american]{csquotes}
	\selectlanguage{english}

	\def\@text@of{of}
	\def\@text@professor{Professor}
	\def\@text@group{Profesor}
	\def\@text@group{Group}
	\def\@text@group@abbr{grp.}
	\def\@text@references{References}
\fi



%----------
% CONFIG
%----------
\RequirePackage{listofitems}

% setup variables

\makeatletter
	\newcommand{\degree}[1]{\gdef\@degree{#1}}  % name of the degree
	\newcommand{\subject}[1]{\gdef\@subject{#1}}  % name of the subject
	\newcommand{\group}[1]{\gdef\@group{#1}}  % group number
	\newcommand{\team}[1]{\gdef\@team{#1}}  % team name (optional)
	\renewcommand{\year}[1]{\gdef\@year{#1}}  % academic year
	\newcommand{\lab}[1]{\gdef\@lab{#1}}  % Lab 1, Exercise 3, etc.
	\newcommand{\professor}[1]{\gdef\@professor{#1}}  % name of the professor (optional)
	\newcommand{\shortauthor}[1]{\gdef\@shortauthor{#1}}  % teamname, or several authors names (optional)
	\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}  % short title (optional)
\makeatother



%----------
% COLORS
%----------

\RequirePackage[table]{xcolor}

\definecolor{azulUC3M}{HTML}{000e78}



%----------
% LINKS
%----------

\RequirePackage[colorlinks]{hyperref}
\RequirePackage{url}

% coloring links
\hypersetup{
	linkcolor=blue,  % links to parts of the document
	urlcolor=blue,  % links to resources outside the document
	citecolor=blue,  % citations
	filecolor=black  % local files
}



%----------
% TITLES
%----------

\RequirePackage{sectsty}
\RequirePackage{titlesec}
\RequirePackage{placeins}  % \FloatBarrier


\allsectionsfont{\color{azulUC3M}}  % color titles

\preto{\part}{\clearpage}  % new page before part
\preto{\section}{\FloatBarrier}  % prevent floats (figures, tables) to be outside their section

\titlespacing*{\subsubsection}
	{0em}  % left margin
	{1em}  % vspace above
	{0.2em}  % vspace below



%----------
% TOC
%----------

\RequirePackage{titletoc}
\RequirePackage[titles]{tocloft}

\setcounter{tocdepth}{2}  % index until subsection

% use simple pagestyle
\tocloftpagestyle{simple}  % this doesn't work porque patata
\pretocmd{\tableofcontents}{\pagestyle{simple}}{}{}
\pretocmd{\listoffigures}{\pagestyle{simple}}{}{}
\pretocmd{\listoftables}{\pagestyle{simple}}{}{}


% newpage after TOC/LOF/LOT
\apptocmd{\tableofcontents}{\newpage}{}{}
\apptocmd{\listoffigures}{\newpage}{}{}  % newpage after LOF
\apptocmd{\listoftables}{\newpage}{}{}  % newpage after LOT


\makeatletter
\titlecontents{part}
	[-5pt]  % left margin
	{\addvspace{1pc}}  % above
	{  % before with label
		\Large
		\hypersetup{hidelinks}
		\bfseries
		\color{azulUC3M}
		\@chapapp~\thecontentslabel.\enspace  % label
	}
	{  % before without label
		\Large
		\hypersetup{hidelinks}
		\bfseries
		\color{azulUC3M}
	}
	{  % filler and page
		\Large
		\color{azulUC3M}
		\hfill
		\hypersetup{hidelinks}
		\bfseries
		\contentspage
	}
\makeatother


% sections
\titlecontents{section}
	[0pt]  % left margin
	{}  % above
	{  % before with label
		\large
		\hypersetup{hidelinks}
		\bfseries
		\color{azulUC3M}
		\contentsmargin{0pt}\thecontentslabel.\enspace
	}
	{\large\contentsmargin{0pt}}  % before without label
	{\large\hfill\color{azulUC3M}\contentspage}  % filler and page

% subsections
\titlecontents{subsection}[10pt]
	{}
	{\hypersetup{hidelinks}\contentsmargin{0pt}\thecontentslabel.\enspace}
	{\contentsmargin{0pt}}
	{\titlerule*[.7pc]{.}\contentspage}


% hile links LOF/LOT
\apptocmd{\cftfigfont}{\hypersetup{hidelinks}}{}{}
\apptocmd{\cfttabfont}{\hypersetup{hidelinks}}{}{}



%----------
% HEADERS & FOOTERS
%----------

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\preto{\headrule}{\color{azulUC3M}}  % blue headrule
\preto{\footrule}{\color{azulUC3M}}  % blue footrule

\setlength{\headheight}{15pt}  % fix headheight

\makeatletter

	\fancypagestyle{fancy} {
		% header
		\fancyhf{}
		\renewcommand{\headrulewidth}{0.4pt}
		\fancyhead[L]{
			\color{azulUC3M}
			\ifdef{\@shorttitle}
				{\@shorttitle}
				{\@lab:~\@title}
		}
		\fancyhead[R]{
			\color{azulUC3M}
			\@subject, \@text@group@abbr~\@group
		}
		% footer
		\renewcommand{\footrulewidth}{0.4pt}
		\fancyfoot[L]{
			\color{azulUC3M}
			\ifdef{\@shortauthor}
				{\@shortauthor}  % then
				{\ifdef{\@team}{\@team}{\@author}}  % else
		}
		\fancyfoot[R]{
			\hypersetup{hidelinks}
			\color{azulUC3M}
			pg. \thepage~\@text@of~\pageref{LastPage}
		}
	}

	\fancypagestyle{simple} {
		\fancyhf{}  % Clear header/footer
		\renewcommand{\headrulewidth}{0pt}  % No header rule
		\renewcommand{\footrulewidth}{0pt}  % No footer rule
		\fancyfoot[C]{\color{azulUC3M}\thepage}
	}
\makeatother



%----------
% TABLES
%----------

\RequirePackage{multirow}  % combine cells
\RequirePackage{caption}  % customize the title of tables and figures
\RequirePackage{tablefootnote}  % allow footnotes from text in tables (\tablefootnote)
\RequirePackage{threeparttable}  % fancier tables (with tablenotes)
\RequirePackage{booktabs}  % \toprule, \bottomrule
\RequirePackage{array}

% new type of column for tables: custom width and centered content
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}


% Table layout for engineering
\captionsetup*[table]{
	format=hang,
	justification=centering,
	singlelinecheck=off,
	labelsep=colon,
	width=.75\linewidth,
	font=small,
	labelfont={bf,color=azulUC3M},
	textfont=it
}



%----------
% FIGURES
%----------

\RequirePackage{graphicx}
\RequirePackage{adjustbox}  % a better \resizebox: \begin{adjustbox}{max width=\textwidth} \end{adjustbox}
\RequirePackage{float}
\RequirePackage{svg}  % SVG images support (requires inkscape)
\RequirePackage{subcaption}  % \begin{subfigure}, etc.

% Figures layout for engineering
\captionsetup[figure]{
	format=hang,
	name=Fig.,
	justification=centering,
	singlelinecheck=off,
	labelsep=colon,
	width=.75\linewidth,
	font=small,
	labelfont={bf,color=azulUC3M},
	textfont=it
}


%----------
% MATH
%----------

\RequirePackage{amsmath, amssymb, amsfonts, amsthm, mathtools}

% usefull macros
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}%
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}%
\DeclarePairedDelimiter\abs{\lvert}{\rvert}%



%----------
% MACROS
%----------

\makeatletter

\newcommand{\blankpage} {
	\clearpage  % blank page
	\thispagestyle{empty}
	\mbox{}
	\newpage
}

\RequirePackage{xstring}

% \abbreviateauthor{name(s)}{surname{s}}
\newcommand{\abbreviateauthor}[2] {%
	% save names and surnames into list
	\setsepchar{ }%
	\readlist*\@names{#1}%
	\setsepchar{ }%
	\readlist*\@surnames{#2}%
	% print
	\foreachitem\z\in\@names[] {%
		\StrLeft{\z}{1}. %
	}%
	\@surnames[1]%
}

\makeatother



%----------
% REPORT
%----------

\newenvironment{report}
	{  % begin definition
		\clearpage
		\pagestyle{fancy}
	}
	{\clearpage}  % end definition



%----------
% COVER
%----------

\RequirePackage{ifthen}

\makeatletter

	% \makecover[old] for old logo, \makecover for new logo
	\newcommand{\makecover}[1][new] {
		\begin{titlepage}
			\color{azulUC3M}
			\begin{center}
				% university logo
				\begin{figure}[H]
					\centering
					\ifthenelse{\equal{#1} {old}}
						{  % old
							\includesvg[width=0.4\textwidth]{old_uc3m_logo.svg}
							\vspace{0.5cm}
						}
						{  % new
							\includesvg[width=\textwidth]{new_uc3m_logo.svg}
							\vspace{1.5cm}
						}
				\end{figure}
				%
				% subject
				\begin{Large}
					\textsl{\@degree}\\
					\medskip
					\@subject~\@year\\
					\@text@group~\@group
				\end{Large}
				% \vspace{1.5cm}
				\vfill
				%
				% title
				\Large\textsl{\@lab}\\
				\medskip
				\Huge``\@title''\\
				%
				\rule{0.75\textwidth}{0.1mm}\\
				\vspace*{0.5cm}
				%
				% authors
				\begin{LARGE}
					\@author\\
				\end{LARGE}
				\ifdef{\@team} {
					\medskip
					\Large\textsl{\@team}\\
				}
				{}
				%
				\vfill
				%
				% professor
				\ifdef{\@professor} {
					\begin{Large}
						\textsl{\@text@professor}\\
						\@professor\\
					\end{Large}
				}
				{}
				%
			\end{center}
			\vfill
		\end{titlepage}

		\newpage
	}

\makeatother


%----------
% REFERENCES
%----------

\RequirePackage[backend=biber, style=ieee, isbn=false, sortcites, maxbibnames=6, minbibnames=1]{biblatex} % IEEE citation style

% force line break when necessary
\setcounter{biburlnumpenalty}{9000}
\setcounter{biburlucpenalty}{9000}
\setcounter{biburllcpenalty}{9000}

% allow for multiple footcites
\RequirePackage{fnpct}
\AdaptNote\footcite{oo+m}[footnote]{%
  \setfnpct{dont-mess-around}%
  \IfNoValueTF{#1}
  {#NOTE{#3}}
  {\IfNoValueTF{#2}{#NOTE[#1]{#3}}{#NOTE[#1][#2]{#3}}}%
}


%----------
% APPENDIXES
%----------

\RequirePackage[header]{appendix}

\AtBeginEnvironment{appendices}{%
	\cleardoublepage
	\setcounter{footnote}{0}  % reset footnote counter
}