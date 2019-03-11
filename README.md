<h2 align="center">
  <br>
  <img src="img/logo.jpg" alt="cool cheatsheet" width="320">
  <br>
</h2>

<h4 align="center">
A cool cheatsheet list base on Tex, with a better reading experience.
</h4>

<p align="center">
    <a href="https://travis-ci.com/si9ma/cool-cheatsheet" style="text-decoration:none">
        <img src="https://travis-ci.com/si9ma/cool-cheatsheet.svg?branch=master" alt="build status"/>
    </a>
</p>

- [About](#about)
- [How To Use](#how-to-use)
- [How To Use Template](#how-to-use-template)
  - [Template](#template)
  - [Pre-Defined Command](#pre-defined-command)
  - [Color](#color)
- [CHEAT SHEET](#cheat-sheet)
  - [Demo](#demo)
  - [Regular Expression](#regular-expression)
- [Errors and bugs](#errors-and-bugs)

## About 

:tada: A cool cheatsheet list base on Tex, with a better reading experience.

## How To Use

Click the picture, you will get a pdf.

## How To Use Template

### Template

```tex
% set papger 
\documentclass[a4paper,10pt]{article}
\input{common} % import common settings, you can overwrite here
\input{color} % import pre-define color

% import the package you need
\usepackage{amsmath}
%\usepackage{ctex} % import ctex when you need chinese character

% let's go
\begin{document}

% redefine color
% eg:
% 	\definecolor{TableHeadColor}{rgb}{0, 0, 0}
%	\definecolor{TableRowColor}{rgb}{0.888, 0.888, 0.888}
% or:
% 	\colorlet{TableHeadColor}{alizarin}
%	  \colorlet{TableRowColor}{x11gray}
% 	refer:http://latexcolor.com/
\colorlet{TableHeadColor}{alizarin} % you can use pre-define color in color.tex
\colorlet{TableRowColor}{lightgray}
\StoreColor % store color to tmp var

% redefine column width, must be integer
\setcounter{Col1Width}{5} % affect card card2 and card3
\setcounter{Col2Width}{3} % affect card2 and card3
\setcounter{Col3Width}{2} % affect card3

\header{Demo} % header
\raggedright\

\footnotesize
\begin{multicols}{3} % define the number of column

  \centering\section{Basic} % section

  \begin{card2}{Shell}
    (Meta) key      & \texttt{M} \\
    Shift key           & \texttt{S} \\
    Command (Super) key & \texttt{CMD} \\
    Function (Fn) key   & \texttt{fn} \\
    Home/end            & \texttt{fn-left / fn-right} \\
  \end{card2}

  \colorlet{TableHeadColor}{indigo(web)}
  \begin{card2}{Basic}
    Execute command by name          & \texttt{M-x} \\
    Cancel command                   & \texttt{C-g} \\
    Exit Emacs                       & \texttt{C-x C-c} \\
    Help: describe a key combination & \texttt{C-h k} \\
    Help: describe a function        & \texttt{C-h f} \\
  \end{card2}

  \ReStoreColor % restore color from tmp var

\end{multicols}

\end{document}
```

### Pre-Defined Command

some pre-defined command in common.tex

```tex
% card -> card with one column
% card2 -> card with two column
% card3 -> card with three column
% card3 -> card with three column
% \ReStoreColor -> restore color
% \StoreColor -> store color
% \header -> define header text
% \bl -> alias to \textbackslash(\)
% \ac -> alias to \textasciicircum(^)
```

### Color 

refer: http://latexcolor.com/

## CHEAT SHEET

### Demo

[![building...](https://si9ma.github.io/cool-cheatsheet/img/demo.png)](https://si9ma.github.io/cool-cheatsheet/pdf/demo.pdf)

### Regular Expression

[![building...](https://si9ma.github.io/cool-cheatsheet/img/regexr.png)](https://si9ma.github.io/cool-cheatsheet/pdf/regexr.pdf)

## Errors and bugs

If something is not behaving intuitively, it is a bug and should be reported.
Report it here by creating an issue: https://github.com/si9ma/cool-cheatsheet/issues

---