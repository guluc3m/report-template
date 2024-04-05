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
- También puedes configurar la (sub)carpeta para las imágenes, y así al usar una imagen no es necesario especificar este nombre (**NOTA:** ten en cuenta que la portada requiere de imágenes que serán buscadas en la raíz de esta carpeta).
    ```latex
    \graphicspath{{img/}}
    ```
- La portada y otros elementos dependen de la configuración de los "distintos atributos":
    - `\author`: Autor, o autores. Si se añade más de uno, añade `\\` entre nombres. Es recomendable añadir también el NIA después del nombre, y precedido por `--`.
    - `\degree`: Grado que se cursa.
    - `\subject`: Asignatura.
    - `\year`: Año académico, e.g. `2023-2024`.
    - `\lab`: Denominación del laboratorio o práctica, e.g. `Práctica 0`.
    - `\title`: Título del laboratorio o práctica.
    - `\proffesor`: Nombre del profesor responsable.  
      Puede ser omitido.
    - `\shortauthor`: Identificación pequeña del autor o autores, la cual aparecerá en el encabezado de cada página. Puede ser el nombre del equipo, e.g. `Equipo 02`, o el nombre corto del autor, e.g. `J. Ibarra`.
      Puede ser omitido.


### Estilos de página
La clase cuenta con dos estilos de página definidos:
- `fancy`: Encabezado con denominación y título de la práctica, e identificación de los autores, pie de página con asignatura y año académico, número de página y páginas totales.
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

Como vamos a usar archivos SVG, necesitas instalar [Inkscape](https://inkscape.org/).  
Si estás en Windows, asegúrate de añadir el ejecutable al `PATH` (suele estar en `C:\Program Files\Inkscape\bin\`).


Para compilar la memoria, usa:
```
latexmk -cd -shell-escape -pdf report.tex
```


## VsCode
Algunas extensiones útiles:
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- [LaTeX](https://marketplace.visualstudio.com/items?itemName=mathematic.vscode-latex)


## Ejemplos
Aquí te dejamos algunos ejemplos de memorias hechas con esta plantilla:
<!-- TBD -->