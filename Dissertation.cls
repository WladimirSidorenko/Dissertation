% FILE: DissOnlineLatex.cls  Version 2.1
% AUTHOR:
% Universität Duisburg-Essen, Standort Duisburg
% AG Prof. Dr. Günter Törner
% Verena Gondek, Andy Braune, Henning Kerstan
% Fachbereich Mathematik
% Lotharstr. 65., 47057 Duisburg
% entstanden im Rahmen des DFG-Projektes DissOnlineTutor
% in Zusammenarbeit mit der
% Humboldt-Universitaet zu Berlin
% AG Elektronisches Publizieren
% Joanna Rycko
% und der
% DNB - Deutsche Nationalbibliothek

%--- Diese Datei darf nicht verändert werden, alle benötigten
% Anpassungen nehmen Sie in einer der anderen mitgelieferten Dateien vor.---------
\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{DissOnlineLatex}[2011/01/05 v2.1 Vorlage zur Erstellung digitaler Hochschulschriften]

% Einstellungen für kvoptions - DOT = DissOnlineTutor
\SetupKeyvalOptions{
    family=DOT,
    prefix=DOT@
}

% Parameter können übergeben werden für die Pakete inputenc, fontenc,
% babel, geometry, report, hyperref
\DeclareStringOption{inputenc}
\DeclareStringOption{fontenc}
\DeclareStringOption{babel}
\DeclareStringOption{geometry}
\DeclareStringOption{report}
\DeclareStringOption{hyperref}

% Übergib die Parameter an die Pakete
\ProcessKeyvalOptions*

\PassOptionsToClass{a4paper, 12pt, openright, twoside}{report}
\ifx\DOT@report\@empty
  \LoadClass{report}
\else
  \expandafter\LoadClass\expandafter[\DOT@report]{report}
\fi

\ifx\DOT@inputenc\@empty
  \RequirePackage[latin1]{inputenc} 
\else
  \expandafter\RequirePackage\expandafter[\DOT@inputenc]{inputenc}
\fi

\ifx\DOT@fontenc\@empty
  \RequirePackage[T1]{fontenc}
\else
  \expandafter\RequirePackage\expandafter[\DOT@fontenc]{fontenc}
\fi

\ifx\DOT@babel\@empty
  \RequirePackage[english,ngerman]{babel} % Sprachen: Deutsch (Primär), Englisch
\else
  \expandafter\RequirePackage\expandafter[\DOT@babel]{babel}
\fi

% Seitenränder vorgeben
\PassOptionsToPackage{left=4cm,top=3cm,right=3cm,bottom=4cm}{geometry}
\ifx\DOT@geometry\@empty
  \RequirePackage{geometry} 
\else  
  \expandafter\RequirePackage\expandafter[\DOT@geometry]{geometry}
\fi

% Erzeuge eine Auflistung aller verwendeten Dateien
\listfiles

%-------Absatzformatierung----------------------------------------------------------
\setlength{\parindent}{5mm}
\renewcommand{\baselinestretch}{1.3} % 1.3-facher Zeilenabstand 

%-------Neudefinition der Abstract-Umgebung-----------------------------------------
\def\sprachtestE{Abstract}

\if@titlepage
  \renewenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{flushleft}%
      	\vspace*{-55\p@}
        \LARGE \bfseries \abstractname
        \@endparpenalty\@M
      \end{flushleft}}%
      {\ifx\abstractname\sprachtestE
      \par\vfil\@Keywords
      \else
      \par\vfil\@Schlagwoerter
      \fi 
      \endtitlepage}
\else
  \renewenvironment{abstract}{%
      \if@twocolumn
        \chapter*{\abstractname}%
      \else
        \small
        \begin{flushleft}%
          {\LARGE\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{flushleft}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi 

% Makros zum Einlesen der Metadaten (werden in metadata.tex benutzt)
\newcommand*{\Anrede}[1]{\gdef\@Anrede{#1}}
\newcommand*{\Nachname}[1]{\gdef\@Nachname{#1}}
\newcommand*{\NachnameohneUmlaute}[1]{\gdef\@NachnameohneUmlaute{#1}}
\newcommand*{\Vorname}[1]{\gdef\@Vorname{#1}}
\newcommand*{\Geburtsdatum}[1]{\gdef\@Geburtsdatum{#1}}
\newcommand*{\Geburtsort}[1]{\gdef\@Geburtsort{#1}}

\newcommand*{\Typ}[1]{\gdef\@Typ{#1}}
\newcommand*{\Titel}[1]{\gdef\@Titel{#1}}
\newcommand*{\TitelohneUmlaute}[1]{\gdef\@TitelohneUmlaute{#1}}
\newcommand*{\Untertitel}[1]{\gdef\@Untertitel{#1}}

\newcommand*{\GutachterA}[1]{\gdef\@GutachterA{#1}}
\newcommand*{\GutachterB}[1]{\gdef\@GutachterB{#1}}
\newcommand*{\GutachterC}[1]{\gdef\@GutachterC{#1}}

\newcommand*{\Grad}[1]{\gdef\@Grad{#1}}
\newcommand*{\Fach}[1]{\gdef\@Fach{#1}}
\newcommand*{\Fakultaet}[1]{\gdef\@Fakultaet{#1}}
\newcommand*{\Universitaet}[1]{\gdef\@Universitaet{#1}}
\newcommand*{\Dekan}[1]{\gdef\@Dekan{#1}}
\newcommand*{\Rektor}[1]{\gdef\@Rektor{#1}}

\newcommand*{\Abgabedatum}[1]{\gdef\@Abgabedatum{#1}}
\newcommand*{\Pruefungsdatum}[1]{\gdef\@Pruefungsdatum{#1}}

\newcommand*{\Schlagwoerter}[1]{\gdef\@Schlagwoerter{#1}}
\newcommand*{\Keywords}[1]{\gdef\@Keywords{#1}}

% Metadaten einlesen (werden danach benötigt für die Einbindung von hyperref)
\include{metadata}

%--Gewährleistung der Kompatibilität mit hyperref.sty-------------------------------------
\RequirePackage{ifpdf}

\ifpdf
\PassOptionsToPackage{%
	pdftitle={\@TitelohneUmlaute},
	pdfauthor={\@NachnameohneUmlaute},
	pdfsubject={\@Typ},
	pdfkeywords={\@Keywords},
	pdfpagemode=UseOutlines,
        colorlinks=true,					% bitte nicht ändern!
	linkcolor=black,					% bitte nicht ändern!
	filecolor=black,					% bitte nicht ändern!
	urlcolor=black,						% bitte nicht ändern!
	citecolor=black,					% bitte nicht ändern!
	pdftex=true,              % bitte nicht ändern!
	plainpages=false,         % bitte nicht ändern!
	hypertexnames=false,      % bitte nicht ändern!
	pdfpagelabels=true,       % bitte nicht ändern!
	hyperindex=true,
        pdfa=true}{hyperref} % bitte nicht ändern! NEU: PDF/A-flag

\ifx\DOT@hyperref\@empty
  \RequirePackage{hyperref}
\else
  \expandafter\RequirePackage\expandafter[\DOT@hyperref]{hyperref}
\fi

\else
   %hier können Sie gegebenenfalls Befehle umdefinieren,
   %die nur für pdfLaTeX vorgesehen sind
	\newcommand{\texorpdfstring}[2]{#2}
\fi


%---GENERIERUNG VON WARNUNGEN / FEHLERMELDUNGEN-------------------------------------------------------
% Zweispaltiger Satz
\if@twocolumn
	\PackageWarning{DissOnlineLatex}{Die Option twocolumn (zweispaltiges Seitenlayout) ist an einigen Hochschulen
          nicht zugelassen. Bitte überprüfen Sie, ob Sie diese Option verwenden dürfen.} 
\fi

% Veraltete oder verbotene Pakete
\AtBeginDocument{
		\@ifpackageloaded{pstricks}
				{\ClassWarning{DissOnlineLatex}
					{Das Paket pstricks darf nicht verwendet werden. Grafiken dürfen nur als eps- oder pdf-File importiert werden.}}
				{}
		\@ifpackageloaded{bbm}
				{\ClassWarning{DissOnlineLatex}
					{Das Paket bbm ist nicht zugelassen. Verwenden Sie stattdessen z.B. amsfonts oder amssymb.}}
				{}
		\@ifpackageloaded{curves}
				{\ClassWarning{DissOnlineLatex}
					{Das Paket curves ist nicht zugelassen. Grafiken dürfen nur als eps- oder pdf-File importiert werden.}}
				{}
		\@ifpackageloaded{epic}
				{\ClassWarning{DissOnlineLatex}
					{Das Paket epic ist nicht zugelassen. Grafiken dürfen nur als eps- oder pdf-File importiert werden.}}
				{}	
		\@ifpackageloaded{eepic}
				{\ClassWarning{DissOnlineLatex}
					{Das Paket eepic ist nicht zugelassen. Grafiken dürfen nur als eps- oder pdf-File importiert werden.}}
				{}
		\@ifpackageloaded{epsf}
				{\ClassWarning{DissOnlineLatex}
					{Das Paket epsf ist nicht zugelassen. Wenn Sie das Paket graphicx verwenden, werden eps-Grafiken direkt unterstützt.}}
				{}
		\@ifpackageloaded{epsfig}
				{\ClassWarning{DissOnlineLatex}{Das Paket epsfig ist nicht zugelassen. Wenn Sie das Paket graphicx verwenden, werden eps-Grafiken direkt unterstützt.}}
				{}
		\@ifpackageloaded{epstopdf}
				{\ClassWarning{DissOnlineLatex}
					{Das Paket epstopdf ist nicht zugelassen. Wenn Sie das Paket graphicx verwenden, werden eps-Grafiken direkt unterstützt.}}
				{}
		\@ifpackageloaded{xypic}
				{\ClassWarning{DissOnlineLatex}
					{Das Paket xypic ist nicht zugelassen. Grafiken dürfen nur als eps- oder pdf-File importiert werden.}}
				{}
		\@ifpackageloaded{a4}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket a4 ist veraltet und die Verwendung kann Fehler verursachen, verwenden Sie stattdessen die report-Option a4paper.}}
				{}
		\@ifpackageloaded{a4wide}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket a4wide ist veraltet und die Verwendung kann Fehler verursachen, verwenden Sie stattdessen die report-Option a4paper.}}
				{}
		\@ifpackageloaded{doublespace}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket doublespace ist veraltet und die Verwendung kann Fehler verursachen. Verwenden sie stattdessen das Paket setspace.}}
				{}
		\@ifpackageloaded{euler}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket euler ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket eulervm.}}
				{}
		\@ifpackageloaded{fancyheadings}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket fancyheadings ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket fancyhdr.}}
				{}
		\@ifpackageloaded{isolatin}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket isolatin ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket inputenc, dieses ist bereits als Pflichpaket eingebunden.}}
				{}
		\@ifpackageloaded{isolatin1}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket isolatin1
                                          ist veraltet und die
                                          Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket inputenc, dieses ist bereits als Pflichpaket eingebunden.}}
				{}
		\@ifpackageloaded{mathpple}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket mathpple ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket mathpazo.}}
				{}
		\@ifpackageloaded{mathptm}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket mathptm ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket mathptmx.}}
				{}
		\@ifpackageloaded{pslatex}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket pslatex ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen eines der Pakete mathptmx, helvet mit Option scaled=.95 oder courier.}}
				{}
		\@ifpackageloaded{palatino}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket palatino ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen eines der Pakete mathpazo, helvet mit Option scaled=.95 oder courier.}}
				{}
		\@ifpackageloaded{t1enc}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket t1enc ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket fontenc mit Option T1, dies ist bereits über die Pflichtpakete voreingestellt.}}
				{}
		\@ifpackageloaded{times}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket times ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen eines der Pakete mathpazo, helvet mit Option scaled=.90 oder courier.}}
				{}
		\@ifpackageloaded{umlaut}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket umlaut ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket inputenc, dieses ist bereits als Pflichpaket eingebunden.}}
				{}
		\@ifpackageloaded{umlaute}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket umlaute ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket inputenc, dieses ist bereits als Pflichpaket eingebunden.}}
				{}
    \@ifpackageloaded{floatflt}
				{\ClassError{DissOnlineLatex}
					{Das Paket floatflt ist
                                          aufgrund von
                                          Lizenzänderungen verboten.}}
				{}

\@ifpackageloaded{here}
				{\ClassWarning{DissOnlineLatex}
					{Vorsicht, das Paket here ist veraltet und die Verwendung kann Fehler verursachen. Verwenden Sie stattdessen das Paket float.}}
				{}
	}




