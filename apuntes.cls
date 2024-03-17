% =========================================================================== %
%% apuntes.cls : LaTeX Class File
%% Copyright (c) 2022 José Antonio Verde Jiménez  All Right Reserved
% =========================================================================== %
% Este archivo contiene una clase de LaTeX que comparten todos mis apuntes.
% Para utilizarlo solo hay que poner \documentclass{apuntes}. Define unas
% cuantas secciones como "teorema", "definición" que se encarga de poner de
% forma "bonita". Puede leer el código para ver qué se ha definido.
%
% Escrito por José Antonio Verde Jiménez <joseaverde@protonmail.com>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{apuntes}[2022/04/10 Clase de LaTeX para guardar mis apuntes]
\LoadClass[12pt, onecolumn, titlepage, oneside, openany]{book}


% ==== Parámetros =========================================================== %
% Esta es la lista de parámetros que se pueden utilizar para crear el
% documento.
\RequirePackage{xkeyval}

% colorprincipal
% --------------
% Color principal del documento, se utilizará para secciones y otras partes
% importantes del mismo, además de para el índice.
\def\colorprincipal{azulUC3M}
\define@key{apuntes.cls}{colorprincipal}[azulUC3M]{
    \def\colorprincipal{#1}
}

% colorsecundario
% ---------------
% Color secundario del documento, se utilizará en partes no tan importantes o
% para diferenciar del colorprincipal jerárquicamente.
\def\colorsecundario{codigoverde}
\define@key{apuntes.cls}{colorsecundario}[codigoverde]{
    \def\colorsecundario{#1}
}

% Procesado.
\ExecuteOptionsX{
    colorprincipal,
    colorsecundario
}
\ProcessOptionsX


% ==== Geometría ============================================================ %
% Esta sección se encarga de poner el formato de la página, con un tamaño A4 y
% con los márgenes ya predefinidos.
\RequirePackage[
    a4paper,
    top=2.54cm, bottom=2.54cm, left=2.54cm, right=2.54cm,
    footskip=0.76cm, includefoot]
{geometry}


% ==== Idioma =============================================================== %
% Todos los apuntes están en Español.
\RequirePackage[spanish]{babel}
\selectlanguage{spanish}
\RequirePackage[utf8]{inputenc}


% ==== Global =============================================================== %
% Algunos paquetes que afectan a toda la estructura. Por ejemplo son necesarios
% los enlaces pero escondemos el recuadro rojo que los rodea.
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{booktabs}
\RequirePackage{url}
\RequirePackage{blindtext}
\RequirePackage{multicol}


% ==== Colores ============================================================== %
% Los colores usados por LaTeX para el documento
\RequirePackage{xcolor}

\definecolor{azulUC3M}{RGB}{0,0,102}

\definecolor{codigonegro}    {HTML}{1f293b}
\definecolor{codigorojo}     {HTML}{c03060}
\definecolor{codigoverde}    {HTML}{30C060}
\definecolor{codigoamarillo} {HTML}{c0c030}
\definecolor{codigoazul}     {HTML}{3060c0}
\definecolor{codigomagenta}  {HTML}{c030c0}
\definecolor{codigocian}     {HTML}{30c0c0}
\definecolor{codigoblanco}   {HTML}{f0f0f0}
\definecolor{codigomorado}   {HTML}{9c439c}
\definecolor{codigonaranja}  {HTML}{d75144}

\definecolor{codigonegrito}    {HTML}{3e5276}
\definecolor{codigorojito}     {HTML}{ff4080}
\definecolor{codigoverdecito}  {HTML}{40ff80}
\definecolor{codigoamarillito} {HTML}{ffff40}
\definecolor{codigoazulito}    {HTML}{4080ff}
\definecolor{codigomagentita}  {HTML}{ff40ff}
\definecolor{codigocianecito}  {HTML}{40ffff}
\definecolor{codigoblanquito}  {HTML}{FFFFFF}
\definecolor{codigomoradito}   {HTML}{d059cf}
\definecolor{codigonaranjita}  {HTML}{f3a600}


% ==== Matemáticas ========================================================== %
% Como estoy estudiando ingeniería informática todos los apuntes hacen uso de
% una manera u otra de expresiones matemáticas. He aquí los paquetes necesarios
% para que esto funciones.
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}
\RequirePackage{gensymb}

% Y también definimos algunas funciones matemáticas que vamos a usar mucho.
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}


% ==== Gráficos ============================================================= %
% También incluimos el paquete para gráficos, las imágenes se deben guardar en una carpeta que se llame `img/'.
\RequirePackage{graphicx}
\RequirePackage[abspath]{currfile}
\RequirePackage{tikz}
\usetikzlibrary{arrows, automata, quotes, positioning}
\RequirePackage{wrapfig}
\RequirePackage[most]{tcolorbox}
\RequirePackage{floatrow}
\RequirePackage[export]{adjustbox}
\newenvironment{Figure}
    {\par\medskip\noindent\minipage{\linewidth}}
    {\endminipage\par\medskip}

% ==== Tecnología =========================================================== %
% Paquetes necesarios para electricidad y electrónicas digital y analógicas.
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage{tikz-timing}
\RequirePackage{circuitikz}


% ==== Programación ========================================================= %
% Añadimos paquetes de algoritmos y de código más que nada porque casi todas
% las asignaturas lo necesitan. Estamos en programación.
% \RequirePackage[spanish, onelanguage, norelsize, linesnumbered, ruled, lined,
%     boxed, commentsnumbered]{algorithm2e}
% \RequirePackage{listings}
% \lstset{inputpath=\currfileabsdir/codigo/}
% \lstdefinestyle{estilocodigo}{
%     % Colores
%     backgroundcolor = \color{codigoblanco},
%     commentstyle    = \color{codigocian},
%     keywordstyle    = \color{codigoamarillo},
%     numberstyle     = \tiny\color{codigomagenta},
%     stringstyle     = \color{codigomagentita},
%     basicstyle      = \color{codigonegro}\ttfamily\footnotesize,
%     % Espacios
%     showspaces       = false,
%     showtabs         = false,
%     showstringspaces = false,
%     tabsize          = 4,
%     keepspaces       = true,
%     % Números
%     numbers   = left,
%     numbersep = 5pt,
%     % Saltos
%     breakatwhitespace = false,
%     breaklines        = true,
%     % Estilo
%     captionpos = b,
%     frame      = shadowbox
% }
% \lstset{style=estilocodigo}

% ==== Teoremas ============================================================= %

% == ESTILOS == %
% \newtheoremstyle{estiloteorema}
%     {\topsep}{\topsep}      % Espacios por encima y por debajo
%     {\normalfont\itshape}   % Fuente del cuerpo
%     {0pt}                   % Cantidad a indentar
%     {\bfseries}             % Fuente del encabezado
%     {.}                     % Punto del encabezado
%     {0.3cm}                 % Espacio después del encabezado
%     {\sffamily\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}}

% \newtheoremstyle{estiloejercicio}
%     {\topsep}{\topsep}      % Espacios por encima y por debajo
%     {\normalfont}           % Fuente del cuerpo
%     {0pt}                   % Cantidad a indentar
%     {\bfseries}             % Fuente del encabezado
%     {.}                     % Punto del encabezado
%     {0.3cm}                 % Espacio después del encabezado
%     {\thmname{#1}\thmnumber{ #2}\textnormal{\thmnote{ (#3)}}}

% \theoremstyle{estiloteorema}{
%     \newtheorem{definicion}{Definición}[chapter]
%     \newtheorem{teorema}{Teorema}[chapter]
%     \newtheorem{proposicion}{Proposicion}[chapter]
%     \newtheorem{corolario}{Corolario}[chapter]
%     \newtheorem{lema}{Lema}[chapter]
% }

% % TODO: Explain each one of them
% \theoremstyle{estiloejercicio}{
%     \newtheorem{ejemplo}{Ejemplo}[chapter]
%     \newtheorem{prueba}{Prueba}[chapter]
%     \newtheorem{ejercicio}{Ejercicio}[chapter]
%     \newtheorem{solucion}{Solución}[chapter]
%     \newtheorem{observacion}{Observación}[chapter]
%     \newtheorem{nota}{Nota}[chapter]
%     \newtheorem{problema}{Problema}[section]
%     \newtheorem{apunte}{Apunte}[section]
%     \newtheorem{importante}{Importante}[section]
% }

% % == CAJAS == %
% \tcbset{
%     boxrule=0pt, boxsep=3pt,
%     sharp corners, enhanced jigsaw, breakable,
%     left=8pt, right=8pt,
%     before skip=10pt,after skip=10pt,
%     drop fuzzy shadow
% }


% \tcolorboxenvironment{definicion}{
%     borderline west={2pt}{0pt}{\colorprincipal},    % Rojo
%     colback={\colorprincipal!20}}
% \tcolorboxenvironment{teorema}{
%     borderline west={2pt}{0pt}{\colorprincipal},    % Verde
%     colback={\colorprincipal!20}}
% \tcolorboxenvironment{proposicion}{
%     borderline west={2pt}{0pt}{\colorsecundario},   % Azul
%     colback={\colorsecundario!20}}
% \tcolorboxenvironment{corolario}{
%     borderline west={2pt}{0pt}{\colorsecundario},   % Cian
%     colback={\colorsecundario!20}}
% \tcolorboxenvironment{lema}{
%     borderline west={2pt}{0pt}{\colorsecundario},   % Amarillo
%     colback={\colorsecundario!20}}

% \tcolorboxenvironment{ejemplo}{
%     borderline west={2pt}{0pt}{\colorprincipal},    % Rojo
%     colback={codigoblanco!20}}
% \tcolorboxenvironment{prueba}{
%     borderline west={2pt}{0pt}{\colorprincipal},    % Verde
%     colback={codigoblanco!20}}
% \tcolorboxenvironment{ejercicio}{
%     borderline west={2pt}{0pt}{\colorprincipal},    % Azul
%     colback={codigoblanco!20}}
% \tcolorboxenvironment{solucion}{
%     borderline west={2pt}{0pt}{\colorsecundario},   % Cian
%     colback={codigoblanco!20}}
% \tcolorboxenvironment{observacion}{
%     borderline west={2pt}{0pt}{\colorsecundario},   % Amarillo
%     colback={codigoblanco!20}}
% \tcolorboxenvironment{nota}{
%    borderline west={2pt}{0pt}{codigonegro},
%    colback={codigoblanco!20}}
% \tcolorboxenvironment{problema}{
%    borderline west={2pt}{0pt}{\colorprincipal},     % Azulito
%    colback={codigoblanco!20}}
% \tcolorboxenvironment{apunte}{
%    borderline west={2pt}{0pt}{\colorsecundario},    % Rojito
%    colback={codigoblanco!20}}
% \tcolorboxenvironment{apunte}{
%    borderline west={2pt}{0pt}{\colorprincipal},    % Rojito
%    colback={\colorprincipal!20}}


% ==== Estilo de la sección ================================================= %
% Estilos para las secciones, más información en:
% <http://www.ctex.org/documents/packages/layout/sectsty.pdf>
\RequirePackage{sectsty}

\addto\captionsspanish{\renewcommand{\chaptername}{Tema}}
%\allsectionsfont{\mdseries\sffamily\raggedright}
%\chapterfont{\mdseries\sffamily\raggedright\color{codigonegro}}
\sectionfont{\mdseries\sffamily\raggedright\color\colorprincipal
    \sectionrule{0ex}{0pt}{-1ex}{1pt}}
\subsectionfont{\mdseries\sffamily\raggedright\color\colorsecundario
    \sectionrule{0ex}{0pt}{-1ex}{1pt}}
\subsubsectionfont{\mdseries\sffamily\raggedright\color\colorprincipal
    \sectionrule{0ex}{0pt}{-1ex}{1pt}}


% ==== Estilo de Tabla de Contenidos ======================================== %
%\RequirePackage{titletoc}
\RequirePackage{minitoc}
\setcounter{minitocdepth}{2}
\dominitoc[n]
\nomtcrule
\nomtcpagenumbers
\renewcommand{\mtifont}{\small\sffamily}
\renewcommand{\mtcfont}{\footnotesize\sffamily}
\renewcommand{\mtcSfont}{\footnotesize\sffamily}
\renewcommand{\mtcSSfont}{\scriptsize\sffamily}
\renewcommand{\mtcSSSfont}{\scriptsize\sffamily}


% \newcommand{\minitabladecontenidos}{
%     % \noindent\hspace{-2cm}{
%         \begin{tikzpicture}
%             \draw[anchor = west, inner sep = 0pt] (8.8cm, -7cm) node [
%                 codigonegro,
%                 ultra thick,
%                 fill = \colorsecundario!20,
%                 fill opacity = .8,
%                 draw = \colorprincipal,
%                 draw opacity = 1,
%                 line width = 1.5pt,
%                 rounded corners,
%                 inner sep = 0pt] (0, 0) {
%                     \begin{minipage}{8cm}
%                         \textcolor{codigonegro}\sffamily
%                         \printcontents[chapters]{}{1}{}
%                     \end{minipage}
%             };
%         \end{tikzpicture}
%    % }
% }
% \RequirePackage{titletoc}
% \setcounter{tocdepth}{2}

\newcommand{\contenidos}{
    \begin{tcolorbox}[title=Contenidos,
        fonttitle=\Large\bfseries\selectfont,
        interior style={
            left  color=\colorprincipal!40!white,
            right color=\colorsecundario!40!white
        },
        frame style={
            left  color=\colorprincipal!80!white,
            right color=\colorsecundario!80!white
        },
        coltitle=codigonegro,
        top=2mm, bottom=2mm, left=2mm, right=2mm,
        drop fuzzy shadow,
        enhanced,
        breakable]
        \makeatletter
        \@starttoc{toc}
        \makeatother
    \end{tcolorbox}
}

% ==== Estilo del Pie y Encabezado ========================================== %
\RequirePackage{fancyhdr}
\setlength{\headheight}{15.0pt}
\fancyhf{}
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[RE]{\it\sf\nouppercase{\rightmark}}
\fancyhead[LO]{\it\sf\nouppercase{\leftmark}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% ==== Estilo del capítulo ================================================== %
\makeatletter
\renewcommand{\@makechapterhead}[1]{
    \begin{tikzpicture}[remember picture, overlay]
        \node at (current page.north west) {
            \begin{tikzpicture}[remember picture, overlay]
                % Imagen de fondo
                \node[anchor=north west, inner sep=0pt] at (0, 0) {
                    \adjincludegraphics[height=10cm, width=\paperwidth]{fondo}
                };
                % Encabezado del capítulo
                \draw[anchor=west, inner sep = 0pt] (-0.1cm, -1.5cm) node [
                    codigonegro,
                    ultra thick,
                    fill = \colorprincipal!20,
                    fill opacity = .8,
                    inner sep = 10pt]
                    (0, 0) {
                        \parbox[t][1.4cm][t]
                            {\paperwidth}
                            {\LARGE\bfseries\sffamily\flushleft\thechapter. #1}
                };
                % Tabla de contenidos
                \draw[anchor = west, inner sep = 0pt] (9cm, -6.5cm) node [
                    codigonegro,
                    ultra thick,
                    fill = \colorsecundario!20,
                    fill opacity = .8,
                    draw = \colorprincipal,
                    draw opacity = 1,
                    line width = 1.5pt,
                    rounded corners,
                    inner sep = 0pt] (0, 0) {
                        \hspace{-1cm}\parbox[t]{11cm}{
                            \vspace{-1cm}\huge\bfseries\sffamily\flushleft
                            \textcolor{codigonegro}{
                                \sffamily\small\minitoc
                            }
                        }
                };
            \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{8cm}
}
\renewcommand{\@makeschapterhead}[1]{
    \begin{tikzpicture}[remember picture, overlay]
        \node at (current page.north west) {
            \begin{tikzpicture}[remember picture, overlay]
                % Imagen de fondo
                \node[anchor=north west, inner sep=0pt] at (0, 0) {
                    \adjincludegraphics[height=10cm, width=\paperwidth]{fondo}
                };
                % Encabezado del capítulo
                \draw[anchor=west, inner sep = 0pt] (-0.1cm, -1.5cm) node [
                    codigonegro,
                    ultra thick,
                    fill = \colorprincipal!10,
                    fill opacity = .8,
                    inner sep = 10pt]
                    (0, 0) {
                        \parbox[t][1.6cm][t]
                            {\paperwidth}
                            {\huge\bfseries\sffamily\flushleft #1}
                };
            \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{7.5cm}
}
\makeatother

% ==== Otros estilos ======================================================== %
\newenvironment{resumen}{
    \hspace{10pt}\par\small\it
    \begin{list}{}{\leftmargin=25pt\rightmargin=25pt}
        \item\ignorespaces\advance\baselineskip -1pt}{
    \end{list}\vspace{-0.5cm}}

% ==== Índice =============================================================== %
\RequirePackage{makeidx}
\makeindex


% ==== Título ============================================================== %
\makeatletter
\newcommand{\titulo}{
    \begin{titlepage}
        \begin{sffamily}
            \color{azulUC3M}
            \begin{center}
                \begin{figure}[h]
                    \makebox[\textwidth][c]{
                        \includegraphics[width=16cm]{uc3m_logo.png}
                    }
                \end{figure}
                \vspace{2.5cm}
                \begin{Large}
                    Grado Universitario \\
                    \@date \\
                    \vspace{2cm}
                    \textsl{Apuntes} \\
                    \bigskip
                \end{Large}
                \Huge{``\@title''}\\
                \vspace*{0.5cm}
                \rule{10.5cm}{0.1cm}\\
                \vspace*{0.9cm}
                \LARGE\@author \\
                \vspace*{1cm}
            \end{center}
            \vfill
        \end{sffamily}
    \end{titlepage}
}
\makeatother
