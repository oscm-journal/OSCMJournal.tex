\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oscmjournal}[2023/12/27 OSCM Journal]

% Define journal-specific variables
\newcommand{\JournalName}{Operations and Supply Chain Management}
\newcommand{\JournalVolume}{00}
\newcommand{\JournalNumber}{0}
\newcommand{\JournalYear}{2023}
\newcommand{\RunningHeader}{Arief, \emph{et al.}: OSCM \LaTeX~Template}
\newcommand{\FirstPage}{000}
\newcommand{\LastPage}{000}
\newcommand{\ISSN}{1979-3561}
\newcommand{\EISSN}{2759-9363}
\newcommand{\ShortHeader}{\RunningHeader \\ \JournalName~\JournalVolume(\JournalNumber), pp. \FirstPage-\LastPage~\copyright~\JournalYear}

\ProcessOptions\relax
\LoadClass[a4paper, twocolumn, twoside]{article}

% Set layout parameters
\setlength{\topmargin}{-1.5cm}
% \setlength{\bottommargin}{-2cm}
\setlength{\textheight}{25.8cm}
\setlength{\textwidth}{17.6cm}
\setlength{\oddsidemargin}{-0.7cm}
\setlength{\evensidemargin}{-0.7cm}
\setlength{\columnsep}{2em}

% Body font
\renewcommand{\normalsize}{\fontsize{10}{12}\fontfamily{ptm}\selectfont}

% Authors
\newcommand{\authorinfo}[1]{%
    \def\@authorinfo{#1}
}

% Keywords
\newcommand{\keywords}[1]{%
    \def\@keywords{\textit{#1}}
}

% Title
\renewcommand{\maketitle}{%
    \twocolumn[%
        \begin{center}
            \fontsize{22}{30}\fontfamily{phv}\fontseries{b}\fontshape{n}\selectfont 
            \@title
            \medskip
            \\
            \vspace{1em}
            \fontsize{12}{14}\fontfamily{ptm}\fontseries{n}\selectfont            
            \@authorinfo            
        \end{center}%
        \vspace{2em}
    ]%
}


% Section headings with numbering in specified format and capitalized
\setcounter{secnumdepth}{3}
\usepackage{textcase}
\renewcommand{\section}{%
    \@startsection{section}{1}{0pt}{-1.5ex plus -1ex minus -.2ex}%
    {1ex plus .2ex}{\fontsize{14}{16}\fontseries{b}\fontshape{n}\selectfont\centering\bfseries}%
}
\renewcommand{\@seccntformat}[1]{%
    \csname the#1\endcsname.
}
\let\oldsection\section
\renewcommand{\section}[1]{\oldsection{\MakeTextUppercase{#1}}}


% Subsection headings
\renewcommand{\subsection}{%
    \vspace{0.25em} 
    \@startsection{subsection}{2}{0pt}{-1ex plus -0.5ex minus -.2ex}%
    {0.5ex plus .2ex}{\fontsize{12}{0}\fontseries{b}\fontshape{it}\selectfont\itshape}%
}

% Subsubsection headings
\renewcommand{\subsubsection}{%
    \vspace{0.25em}
    \@startsection{subsubsection}{3}{0pt}{-0.5ex plus -0.2ex minus -.1ex}%
    {0.2ex plus .1ex}{\fontsize{10}{0}\fontseries{m}\fontshape{it}\selectfont}%
}



% Abstract environment
\usepackage{setspace}
\renewenvironment{abstract}{%    
    \begin{center}
        \fontsize{14}{16}\fontfamily{ptm}\fontseries{b}\selectfont{ABSTRACT}
    \end{center}     
    \vspace{-1em}   
    \fontsize{9}{0}\fontfamily{ptm}\fontseries{b}\selectfont
}{%    
    \newline
    \newline
    \fontsize{9}{9}\fontfamily{ptm}\selectfont
    \noindent \textbf{Keywords:} \@keywords
}

% Header and footer customization
\usepackage{fancyhdr}
\usepackage{graphicx}
\pagestyle{fancy}
\fancyhf{} % Clear all header and footer fields

% Define first page header style
\fancypagestyle{firstpage}{
    \fancyhead[L]{%
        \fontsize{9}{11}\selectfont
        \fontfamily{ptm}\selectfont
        \textbf{\MakeTextUppercase{\JournalName}}\\
        Vol. \JournalVolume, No. \JournalNumber, \JournalYear, pp. \FirstPage-\LastPage \\
        ISSN \ISSN $\mid$ EISSN \EISSN
    }
    \fancyhead[R]{%
        \includegraphics[height=0.5cm]{figs/oscm.png}
    }
    \renewcommand{\headrulewidth}{0pt}
}

% Define subsequent pages header style
\fancypagestyle{subseqpages}{
    \fancyhf{}
    \fancyhead[LE,RO]{\thepage}
    \fancyhead[LO,RE]{\ShortHeader}
}

% Apply first page header style initially and subsequent pages header style thereafter
\AtBeginDocument{
    \thispagestyle{firstpage}
    \pagestyle{subseqpages}
}

% References
\usepackage[round]{natbib} 
% \usepackage{apacite}
\renewenvironment{thebibliography}[1]
{%
    \vspace{1em}
    \centering\normalfont\fontsize{14}{16}\fontfamily{ptm}\selectfont\bfseries{REFERENCES}
    \normalfont\fontsize{10}{10}\fontfamily{ptm}\selectfont
    \list{}%
         {\settowidth\labelwidth{0pt}%
          \leftmargin 20pt % Indentation on the left margin, you can adjust this value
          \itemindent -20pt % Indentation for the first line of each entry, should be negative value of left margin
          \itemsep 0pt % Adjust the space between each item
          \parsep 0pt % Adjust the space between paragraphs within an item
          \usecounter{enumiv}%
          \let\p@enumiv\@empty
          \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m
}
{%
    \def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist
}
