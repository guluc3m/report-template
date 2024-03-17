# Lab report template

## Usage

The report consists of a main file [`report.tex`](report.tex), which includes a cover ([`parts/0-cover.tex`](parts/0-cover.tex)), a Table of Contents (if you uncomment it), and all the Markdown and LaTeX files inside the [`parts/`](parts/) folder that you want to include.


## Compilation

First you must install LaTeX.

- For Linux, install `texlive-full`.
- For Windows, install [MiKTeX](https://miktex.org/download#win), make sure you add it to your `PATH`, and install [Perl](https://strawberryperl.com/). If it’s not installed already, open the MikTeX Package Manager and install the `latexmk` package.
- For MacOS, install [MacTeX](https://www.tug.org/mactex/mactex-download.html) and then install `latexmk` with:
    ```
    sudo tlmgr install latexmk
    ```

To compile the report, use the command:
```
latexmk -cd -shell-escape -pdf report.tex
```

## VsCode
Some usefull extensions:
- [LaTeX](https://marketplace.visualstudio.com/items?itemName=mathematic.vscode-latex)
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
