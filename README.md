# Plantilla de LaTeX para memorias de la UC3M

## Uso

La memoria consiste de un archivo principal [`report.tex`](report.tex), y un archivo de definición de clase [`uc3mreport.cls`](uc3mreport.cls), el cual contiene toda la configuración.

El archivo [`report.tex`](report.tex) actual es una simple plantilla para usar la clase `uc3mreport`. Ésta clase está basada en la clase `article` de LaTeX, con tamaño de letra 12.


### Configuración
- Puedes configurar el idioma de la memoria al incluír la clase. Esto afectará a algunas cosas como el nombre del índice.
    ```latex
    \documentclass[es]{uc3mreport}  % español
    ```
    ```latex
    \documentclass[en]{uc3mreport}  % inglés
    ```
- También puedes configurar la (sub)carpeta para las imágenes, y así al usar una imagen no es necesario especificar este nombre.
    ```latex
    \graphicspath{{img/}}
    ```
    > [!NOTE]
    > Ten en cuenta que la portada requiere de imágenes que serán buscadas en la raíz de esta carpeta
- La portada y otros elementos dependen de la configuración de los "distintos atributos":
    - `\author`: Autor, o autores. Si se añade más de uno, añade `\\` entre nombres. Es recomendable añadir también el NIA después del nombre, y precedido por `--`.
    - `\degree`: Grado que se cursa.
    - `\subject`: Asignatura.
    - `\group`: Número del grupo, e.g. `89`.
    - `\year`: Año académico, e.g. `2023-2024`.
    - `\lab`: Denominación del laboratorio o práctica, e.g. `Práctica 0`.
    - `\title`: Título del laboratorio o práctica.
    - `\professor`: Nombre del profesor responsable.  
      Puede ser omitido.
    - `\author`: Autor o autores. Usar `\\` para separarlos.
    - `\team`: Nombre del equipo, e.g. `Equipo 69`.
      Puede ser omitido.
    - `\shortauthor`: Identificación pequeña del autor o autores, la cual aparecerá en el encabezado de cada página. Puede ser el nombre del equipo, e.g. `Equipo 02`, o el nombre corto del autor, e.g. `J. Ibarra` (o `\abbreviateauthor{Javier}{Ibarra Ramos}`).
      Puede ser omitido.
    - `\shorttitle`: Formato corto del título que poner en el _header_ en lugar de `<lab>: <title>`.
      Puede ser omitido.


### Estilos de página
La clase cuenta con dos estilos de página definidos:
- `fancy`: Encabezado con denominación y título de la práctica, e identificación de los autores, pie de página con asignatura y año académico, número de página y páginas totales.  
  En el autor, si se define `\shortauthor` se usará ese. Si no, y está definido `\team`, se usará el equipo. En cualquier otro caso se usará el autor definido.
- `simple`: Pie de página con la página actual. Éste es el estilo aplicado a los índices.


### Macros
La clase también cuenta con ciertas macros predefinidas:
- `\makecover`: Genera la portada con los atributos anteriormente definidos.
    - Puedes usar `\makecover[old]` para usar el logo antiguo (y objetivamente superior) de la UC3M.
- `\blankpage`: Crea una página completamente en blanco.
- `\abbreviateauthor{nombre(s)}{apellido{s}}`: Abrevia el nombre de un autor, útil para ponerlo en `\shortauthor`


### Entornos
La clase también cuenta con un entorno predefinido:
- `\begin{report} \end{report}`: Empieza y acaba en página nueva, y aplica el estilo de página `fancy`.



## Compilación
Primero debes instalar LaTeX.

- Para Linux, instala `texlive-full` (tarda un ratp).
- Para Windows, instala [MiKTeX](https://miktex.org/download#win), asegúrate de añadirlo al `PATH`, e instala [Strawberry Perl](https://strawberryperl.com/). Si no está ya instalado, abre la MikTeX Console e instala el paquete `latexmk` desde la pestaña `Packages`.
- Para MacOS, instala [MacTeX](https://www.tug.org/mactex/mactex-download.html) e instala `latexmk` con:
    ```
    sudo tlmgr install latexmk
    ```

> [!IMPORTANT]
> Como vamos a usar archivos SVG, necesitas instalar [Inkscape](https://inkscape.org/).  
> 
> Si estás en Windows, asegúrate de añadir el ejecutable al `PATH` (suele estar en `C:\Program Files\Inkscape\bin\`).


Para compilar la memoria, usa:
```
latexmk -cd -shell-escape -pdf report.tex
```


<!-- TODO: how to use extra package stuff (multifigures w/ \subfigure, tables, \tablenote, etc.) -->


## VS Code
Algunas extensiones útiles:
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
    > [!IMPORTANT]
    > Si estás usando esta extensión, por favor añade el parámetro `-shell-escape` (ver [LaTeX Workshop FAQ](https://github.com/James-Yu/LaTeX-Workshop/wiki/FAQ#how-to-pass--shell-escape-to-latexmk))
- [LTeX](https://marketplace.visualstudio.com/items?itemName=valentjn.vscode-ltex): Corrector ortográfico.
    > [!TIP]
    > Puedes cambiar el idioma del corrector a través del parámetro `ltex.language` en la configuración de VS Code


## Ejemplos
Aquí te dejamos algunos ejemplos de memorias hechas con esta plantilla:
- [ldcas-uc3m/TAC-P1](https://github.com/ldcas-uc3m/TAC-P1/tree/main/report) (usando una versión temprana de la plantilla)
- [ldcas-uc3m/VA-PF](https://github.com/ldcas-uc3m/VA-PF/tree/main/report)