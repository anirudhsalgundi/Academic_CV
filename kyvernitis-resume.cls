% Class Identifier and Version
\ProvidesClass{kyvernitis-resume}[2023/06/06 Kyvernitis class]
\NeedsTeXFormat{LaTeX2e}

% Set font size and paper type
\LoadClass[10pt,letterpaper]{article}

% Enable custom and named colors
\RequirePackage[usenames,dvipsnames]{color}

% Remove paragraph indentation
\RequirePackage[parfill]{parskip}

% Set margin width
\RequirePackage[hmargin=1.25cm,vmargin=0.75cm]{geometry}

% Use cool fonts
\RequirePackage{fontspec}

% Using IBM Plex Sans
\RequirePackage[sfdefault,light]{plex-sans}

% Use hyperref
\RequirePackage[xetex]{hyperref}

% Use extended columns definitions
\RequirePackage{array}

% Make custom tables
\RequirePackage{tabularx}

% Use FontAwesome icons
\RequirePackage{fontawesome5}

% Adjust page width in the middle of the page
\RequirePackage{changepage}

% Adjust bullet size
\RequirePackage{scalerel}

% Remove page numbers
\pagestyle{empty}

% Define navy-blue color for later use. Color code is taken from Canva
\definecolor{navyblue}{RGB}{124,37,41}%0,94,184 110,98,89 124,37,41
\definecolor{links}{RGB}{124,37,41}

% Define new resizable bullet with default 0.7 size for later use
% Taken from https://tex.stackexchange.com/questions/534192/medium-sized-circle-as-a-bullet
\newcommand{\vbullet}[1][.7]{\mathbin{\ThisStyle{\vcenter{\hbox{%
  \scalebox{#1}{$\SavedStyle\bullet$}}}}}%
}

% Setup Hyperlink style
\hypersetup{
    colorlinks=true,
    urlcolor=links
}

% Define some social accounts and contact information formats
\newcommand{\linkedin}[1]{
    \href{https://www.linkedin.com/in/anirudh-salgundi/}{\textcolor{black}
    {\faLinkedinIn}\hspace{0.5em}#1}
}
\newcommand{\email}[1]{
    \href{mailto:#1}{\textcolor{black}
    {\faEnvelope[regular]}\hspace{0.5em}#1}
}
\newcommand{\github}[1]{
    \href{https://github.com/anirudh-salgundi}{\textcolor{black}
    {\faGithub}\hspace{0.5em}#1}
}
\newcommand{\twitter}[1]{
    \href{https://twitter.com/#1}{\textcolor{black}
    {\faTwitter}\hspace{0.5em}#1}
}
\newcommand{\facebook}[1]{
    \href{https://www.facebook.com/#1}{\textcolor{black}
    {\faFacebookF}\hspace{0.5em}#1}
}
\newcommand{\website}[1]{
    \href{https://#1}{\textcolor{black}
    {\faGlobeAmericas}\hspace{0.5em}#1}
}
\newcommand{\phone}[1]{
    \textcolor{black}{\faPhone*}\hspace{0.5em}#1
}
\newcommand{\nationality}[1]{
    \textcolor{black}{\faFlagUsa}\hspace{0.5em}#1
}
\newcommand{\address}[1]{
    \textcolor{black}{\faMapMarker*}\hspace{0.5em}#1
}

% Define commands for fullname and job title
\def \fullname#1{\def\@name{#1}}
\def \@name {}
\def \jobtitle#1{\def\@title{#1}}
\def \@title {}

% Convenience commands
\newcommand{\italicitem}[1]{\item{\textit{#1}}}
\newcommand{\bolditem}[1]{\item{\textbf{#1}}}
\newcommand{\entry}[2]{#1 & #2 \tabularnewline}

% Define the resume header
\newcommand{\resumeheader}[3]{
    % \phantomsection
    % \addcontentsline{toc}{chapter}{\@name}
    \begin{tabularx}{\textwidth}{Xr}{
        \begin{tabular}[c]{l}
            \fontsize{35}{45}\selectfont{\color{navyblue}{\textbf{\@name}}}
            \ifx\empty\@title\empty\else
                \\ \textit{\small\@title}
            \fi
       \end{tabular}
    } & {
        \begin{tabular}[c]{l@{\hspace{1em}}l}
            \entry{\small}{\small#1}
            \entry{\small}{\small#2}
            \entry{\small}{\small#3}
        \end{tabular}
    }
    \end{tabularx}
}

% Renew section command for resume section
% \renewenvironment{section}[1]{
%     % \phantomsection
%     \addcontentsline{toc}{section}{#1}
%     \medskip
%     {\color{navyblue}{\textbf{#1}}}
%     \medskip
%     {\color{navyblue}\hrule}
%     \begin{list}{}{
%         \setlength{\leftmargin}{0.0em}
%     }
%     \item[]
% }{
%     \end{list}
% }

% \renewenvironment{section}[1]{
%     % \phantomsection
%     \addcontentsline{toc}{section}{#1}
%     \medskip
%     {\color{navyblue}\textbf{\fontsize{13}{14}\selectfont #1}} % Custom font size: 16pt with 20pt line spacing
%     \medskip
%     \vspace{-0.3em}
%     {\color{navyblue}\hrule}
%     \begin{list}{}{
%         \setlength{\leftmargin}{0.0em},
%         \setlength{\itemsep}{3em}
%     }
%     \item[]
% }{
%     \end{list}
% }

\renewenvironment{section}[1]{
    % \phantomsection
    \addcontentsline{toc}{section}{#1}
    \medskip
    {\color{navyblue}\textbf{\fontsize{13}{14}\selectfont #1}} % Custom font size: 13pt with 14pt line spacing
    \medskip
    \vspace{-0.3em}
    {\color{navyblue}\hrule}
    \begin{list}{}{
        \setlength{\leftmargin}{0.0em}
        \setlength{\itemsep}{0em} % Default spacing
        \setlength{\parsep}{0em}  % Default paragraph spacing
    }
    \item[] \vspace{-0.5em} % Adds space after each item
}{
    \end{list}
}



% Renew subsection command for resume subsections
% All arguments are compulsory
% #1: Name, #2: Description, #3: Time Period, #4: Location
\renewenvironment{subsection}[4]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \textbf{#1} \hfill {#3} \newline
    {#2} \hfill {#4}
    \smallskip
    \begin{list}{$\vbullet$}{
        \leftmargin=2em
    }
    % \itemsep -0.5em \vspace{-0.5em}
}{
    \end{list}
    % \vspace{0.5em}
}


% Define command for resume subsections with no bullets
% All arguments are compulsory
% #1: Name, #2: Description, #3: Timwww.linkedin.com/in/anirudh-salgundie Period, #4: Location
\newenvironment{subsectionnobullet}[4]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \textbf{#1} \hfill {#3} \newline
    {#2} \hfill {#4}
    \smallskip
    \begin{list}{}{
        \leftmargin=0em \itemindent=0em \labelwidth=0em \labelsep=0em
    }
    \itemsep -0.7em \vspace{-0.7em}
}{
    \end{list}
}

\newenvironment{subsectionnobullet1}[4]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \textbf{#1} \hfill {#3} \newline
    {#2} \hfill {#4}
    \smallskip
}


% Define new sectiontable command, which makes a section with a table
% All arguments are compulsory
% #1: Name of the section, #2: Body of the section
\newcommand{\sectiontable}[2]{
    \begin{section}{#1}
        \begin{adjustwidth}{0.0in}{0.1in}
            \begin{tabularx}{\linewidth}{@{} >{\bfseries}l @{\hspace{5ex}} X @{}}
                #2
            \end{tabularx}
        \end{adjustwidth}
    \end{section}
}
