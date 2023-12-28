% OSCM Journal LaTeX Class File
% Version 1.00, 2023/12/27
% License: This file may not be modified. All rights reserved by OSCM Journal Team (oscm.help@gmail.com).

\def\update{2023/12/27 v1.00}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oscmjournal}[2023/12/27 OSCM Journal]

% Define a new if-condition for the layout format
\newif\if@preprint
\@preprintfalse % default to final format

% Declare options
\DeclareOption{final}{
    \@preprintfalse % final format
}
\DeclareOption{preprint}{
    \@preprinttrue % preprint format
}

% Default to final if no option is specified
\ExecuteOptions{final}
\ProcessOptions\relax


%% Journal-specific settings
\newcommand{\JournalName}{Operations and Supply Chain Management}
\newcommand{\JournalVolume}{00}
\newcommand{\JournalNumber}{0}
\newcommand{\JournalYear}{2023}
\newcommand{\RunningHeader}{Arief, \emph{et al.}: OSCM \LaTeX~Template}
\newcommand{\FirstPage}{000}
\newcommand{\LastPage}{000}
\newcommand{\ISSN}{1979-3561}
\newcommand{\EISSN}{2759-9363}
\newcommand{\ShortHeader}{\RunningHeader \\ \JournalName~\JournalVolume(\JournalNumber), \FirstPage--\LastPage~\copyright~\JournalYear}


% Apply the layout format
\if@preprint
    \LoadClass[a4paper,onecolumn]{article} % Load for preprint
\else
    \LoadClass[a4paper,twocolumn, twoside]{article} % Load for final
\fi


%% Layout parameters
\setlength{\topmargin}{-2cm}
\setlength{\textheight}{25.5cm}
\setlength{\textwidth}{17.6cm}
\setlength{\oddsidemargin}{-0.7cm}
\setlength{\evensidemargin}{-0.7cm}
\setlength{\columnsep}{2em}

%% Title and author information
\newcommand{\authorinfo}[1]{%
    \def\@authorinfo{#1}
}
\newcommand{\keywords}[1]{%
    \def\@keywords{\textit{#1}}
}

\if@preprint
    \usepackage{lineno}
    \renewcommand{\normalsize}{\fontsize{12}{15}\fontfamily{ptm}\selectfont}
    \linenumbers
    \renewcommand{\maketitle}{%    
        \begin{center}
            \fontsize{22}{22}\fontfamily{phv}\fontseries{b}\fontshape{n}\selectfont 
            \@title
            \medskip \\
            \vspace{0.5em}
            \fontsize{12}{14}\fontfamily{ptm}\fontseries{n}\selectfont 
            \@authorinfo            
        \end{center}%
        \vspace{2em}
    }
\else
    \renewcommand{\normalsize}{\fontsize{10}{12}\fontfamily{ptm}\selectfont}
    \renewcommand{\maketitle}{%
        \twocolumn[%
            \begin{center}
                \fontsize{22}{22}\fontfamily{phv}\fontseries{b}\fontshape{n}\selectfont 
                \@title
                \medskip \\
                \vspace{0.5em}
                \fontsize{12}{14}\fontfamily{ptm}\fontseries{n}\selectfont 
                \@authorinfo            
            \end{center}%
            \vspace{2em}
        ]%
    }
\fi





\usepackage{times}

%% Section formatting
\setcounter{secnumdepth}{3}
\usepackage{textcase}

\renewcommand{\section}{%
    \@startsection{section}{1}{0pt}{-1.5ex plus -1ex minus -.2ex}%
    {1ex plus .2ex}{\fontsize{14}{16}\fontseries{b}\fontshape{n}\selectfont\centering\bfseries}%
}
\renewcommand{\@seccntformat}[1]{%
    \csname the#1\endcsname.
}
\renewcommand{\subsection}{%
    \vspace{0.25em} 
    \@startsection{subsection}{2}{0pt}{-1ex plus -0.5ex minus -.2ex}%
    {0.5ex plus .2ex}{\fontsize{12}{0}\fontseries{b}\fontshape{it}\selectfont\itshape}%
}
\renewcommand{\subsubsection}{%
    \vspace{0.25em}
    \@startsection{subsubsection}{3}{0pt}{-0.5ex plus -0.2ex minus -.1ex}%
    {0.2ex plus .1ex}{\fontsize{10}{0}\fontseries{m}\fontshape{it}\selectfont}%
}

%% Abstract environment
\usepackage{setspace}
\renewenvironment{abstract}{%    
    \begin{center}
        \fontsize{14}{0}\fontfamily{ptm}\fontseries{b}\selectfont{ABSTRACT}
        % \vspace{-1em}   
    \end{center}     
    \fontsize{9}{10}\fontfamily{ptm}\fontseries{b}\selectfont
}{%    
    \newline
    \newline
    \fontsize{9}{9}\fontfamily{ptm}\selectfont
    \noindent \textbf{Keywords:} \@keywords
}

%% Header and footer customization
\usepackage{fancyhdr}
\usepackage{graphicx}
\pagestyle{fancy}
\fancyhf{} % Clear all header and footer fields

\fancypagestyle{firstpage}{
    \fancyhead[L]{%
        \fontsize{9}{11}\selectfont
        \fontfamily{ptm}\selectfont
        \textbf{\MakeTextUppercase{\JournalName}}\\
        Vol. \JournalVolume, No. \JournalNumber, \JournalYear,  \FirstPage--\LastPage \\
        ISSN \ISSN $\mid$ EISSN \EISSN
    }
    \fancyhead[R]{%
        \includegraphics[height=0.8cm]{figs/oscm.png}
    }
    \renewcommand{\headrulewidth}{0pt}
}
\fancypagestyle{subseqpages}{
    \fancyhf{}
    \fancyhead[LE,RO]{\thepage}
    \fancyhead[LO,RE]{\ShortHeader}
}

\AtBeginDocument{
    \thispagestyle{firstpage}
    \pagestyle{subseqpages}
}

%% Figure and table caption formatting
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{period}{\hspace*{1ex}}
\captionsetup[figure]{font=normal,labelfont={bf},labelsep=period,justification=raggedright,singlelinecheck=false}
\captionsetup[table]{position=top,labelsep=period,font=normal,labelfont={bf},justification=raggedright,skip=2pt,singlelinecheck=false}

\newcommand{\biographies}{%
    \vspace{1em}
    \hrule
    \vspace{1em}
}

\newenvironment{biography}[1]{%
    \noindent\begin{small}\textbf{#1} % 
}{%
    \end{small}
    \vspace{1em}
}
