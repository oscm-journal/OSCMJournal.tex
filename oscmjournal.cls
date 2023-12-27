\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oscmjournal}[2023/12/27 OSCM Journal]

%%Preliminary definitions, needed by the options
\newcommand{\headlinecolor}{\normalcolor}
\RequirePackage{xcolor}
\definecolor{slcolor}{HTML}{882B21}

%%This parts handles the options passed to the class.
% \DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[twocolumn]{article}

%%Body of the class, most of the declarations appear here.
\renewcommand{\maketitle}{%
    \twocolumn[%
        \fontsize{50}{60}\fontfamily{phv}\fontseries{b}%
        \fontshape{sl}\selectfont\headlinecolor
        \@title
        \medskip
    ]%
}

\renewcommand{\section}{%
    \@startsection
    {section}{1}{0pt}{-1.5ex plus -1ex minus -.2ex}%
    {1ex plus .2ex}{\large\sffamily\slshape\headlinecolor}%
}

\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
\setlength{\textwidth}{17.5cm}
\setlength{\textheight}{22cm}
\setcounter{secnumdepth}{0}
