# Plantilla de LaTeX para memorias de la UC3M

## Uso

La memoria consiste de un archivo principal [`report.tex`](report.tex), y un archivo de definición de clase [`uc3mreport.cls`](uc3mreport.cls), el cual contiene toda la configuración.

El archivo [`report.tex`](report.tex) actual es una simple plantilla para usar la clase `uc3mreport`. Ésta clase está basada en la clase `article` de LaTeX, con tamaño de letra 12.

También una plantilla [`report-pandoc.tex`](report-pandoc.tex) para pasar a [Pandoc](https://pandoc.org/) está presente en el repostiorio. Esta se puede usar para escribir el report en Markdown, y mediante YAML en la cabecera del archivo, pasarle todos los parámetros para rellenar automaticamente el documento.

Para compilar archivos usando Pandoc, hay que usar en la terminal:

```bash
pandoc report.md -s --template report-pandoc.tex --lua-filter report-filter.lua -o report.tex && latexmk -shell-escape -pdf report.tex
```

> [!TIP]
> El comando anterior está separado en dos partes, la transformación de Markdown a LaTeX usando Pandoc, y el de compilación a PDF desde LaTeX. Para comprobar o modificar el output de LaTeX antes de convertirlo a PDF, borra la segunda parte ejecutada con `&&`.

### Configuración
- Puedes configurar el idioma de la memoria al incluir la clase. Esto afectará a algunas cosas como el nombre del índice.
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
- La portada y otros elementos dependen de la configuración de los distintos atributos:
    - `\author`: Autor, o autores. Si se añade más de uno, añade `\\` entre nombres. Es recomendable añadir también el NIA después del nombre, y precedido por `--`.
    - `\degree`: Grado que se cursa, e.g. _Ingeniería Informática_
    - `\subject`: Asignatura.
    - `\group`: Número del grupo, e.g. _89_.
    - `\academicyear`: Año académico, e.g. _2023-2024_.
    - `\lab`: Denominación del laboratorio o práctica, e.g. `Práctica 0`.
    - `\title`: Título del laboratorio o práctica.
    - `\professor`: Nombre del profesor responsable.  
      Puede ser omitido.
    - `\team`: Nombre del equipo, e.g. _Equipo 69_.  
      Puede ser omitido.
    - `\shortauthor`: Identificación corta del autor o autores, la cual aparecerá en el encabezado de cada página. Puede ser el nombre del equipo, e.g. _Equipo 02_, o el nombre corto del autor, e.g. _J. Ibarra_ (o `\abbreviateauthor{Javier}{Ibarra Ramos}`).  
      Puede ser omitido.
    - `\shorttitle`: Formato corto del título que poner en el _header_ en lugar de `<lab>: <title>`.  
      Puede ser omitido.
    - `\shortsubject`: Identificación corta de la asignatura (normalmente, las siglas, e.g. _T.A.L.F._), la cual aparecerá en el encabezado de cada página. Típicamente usado cuando el título y/o el nombre de la asignatura.  
      Puede ser omitido.


#### Variables de Pandoc

Todas las variables están mencionadas en el apartado superior. Un ejemplo de cabezera que se puede usar es:

```yaml
---
grado: Informática
asignatura: Sistemas Operativos
anio-academico: 2069
grupo: 69420
autores:
    - nombre: Pepito
      nia: 100
    - nombre: Papeto
      nia: 200
nombre-lab: Hilos
titulo: uwu
---
```

El primer set de variables es el obligatorio para que el archivo se pueda compilar, mientras que el segundo es completamente opcional:

- `grado`
- `asignatura`
- `anio-academico`
- `grupo`
- `autores`
  - `nombre`
  - `nia`
- `nombre-lab`
- `titulo`

Opcionales:
- `autor-corto`
  - `abreviado`
  - `largo`
- `equipo`
- `subtitulo`
- `profesor`
- `apendices`: Cualquiér valor para considerarlo como verdadero
- `referencias`: Cualquiér valor para considerarlo como verdadero


### Estilos de página
La clase cuenta con dos estilos de página definidos:
- `fancy`: Encabezado con denominación y título de la práctica, e identificación de los autores, pie de página con asignatura y año académico, número de página y páginas totales.  
  En el autor, si se define `\shortauthor` se usará ese. Si no, y está definido `\team`, se usará el equipo. En cualquier otro caso se usará el autor definido.
- `simple`: Pie de página con la página actual. Éste es el estilo aplicado a los índices.

Estos estilos se aplican automáticamente en los diferentes entornos, pero siempre puedes aplicarlos temporalmente con `\thispagestyle{<style>}`.


### Macros
La clase también cuenta con ciertas macros predefinidas:
- `\makecover`: Genera la portada con los atributos anteriormente definidos.
    - Puedes usar `\makecover[old]` para usar el logo antiguo (y objetivamente superior) de la UC3M.
- `\blankpage`: Crea una página completamente en blanco.
- `\abbreviateauthor{<nombre(s)>}{<apellido(s)>}`: Abrevia el nombre de un autor, útil para ponerlo en `\shortauthor`.


### Entornos
La clase también cuenta con un entorno predefinido:
- `\begin{report} \end{report}`: Empieza y acaba en página nueva, y aplica el estilo de página `fancy`.



## Compilación
Primero debes instalar LaTeX.

- Para Linux, instala [TeX Live](https://www.tug.org/texlive/):
    - [APT](https://wiki.debian.org/AptCLI) ([Debian](https://www.debian.org/)/[Ubuntu](https://ubuntu.com/)): [`texlive-full`](https://packages.debian.org/search?keywords=texlive-full&searchon=names&suite=stable&section=all)
    - [DNF](https://dnf.readthedocs.io/en/latest/) ([Fedora](https://fedoraproject.org/)): [`texlive-scheme-full`](https://packages.fedoraproject.org/pkgs/texlive/texlive-scheme-full/)
    - [AUR](https://aur.archlinux.org/) ([Arch](https://archlinux.org/)): [`texlive-full`](https://aur.archlinux.org/packages/texlive-full)
- Para Windows, instala [MiKTeX](https://miktex.org/download#win), asegúrate de añadirlo al `PATH`, e instala [Strawberry Perl](https://strawberryperl.com/).  
    Con [winget](https://github.com/microsoft/winget-cli):
    ```powershell
    winget install MiKTeX.MiKTeX StrawberryPerl.StrawberryPerl
    ```
  Una vez instalado MiKTeX, ábrelo, ve a `Updates` y actualiza todos los paquetes.

- Para MacOS, instala [MacTeX](https://www.tug.org/mactex/mactex-download.html).  
    Con [brew](https://brew.sh):
    ```
    brew install --cask mactex
    ```

> [!IMPORTANT]
> Como vamos a usar archivos SVG, necesitas instalar [Inkscape](https://inkscape.org/).
> 
> Si estás en Windows, asegúrate de añadir el ejecutable al `PATH` (suele estar en `C:\Program Files\Inkscape\bin\`).


Para compilar la memoria, usa:
```
latexmk -cd -shell-escape -pdf report.tex
```

> [!TIP]
> Opcionalmente, puedes especificar el directorio de salida con el parámetro `-outdir`, e.g. `-outdir=build`
> 
> Si te encuentras con problemas al compilar, asegúrate de que existen todas las subcarpetas (e.g. `build/parts/`).


## How to LaTeX?
Obviamente, _Google/DuckDuckGo es tu amigo_, así que no dudes en preguntarle cosas. También puedes contar con la [documentación de Overleaf](https://www.overleaf.com/learn), una magnífica herramienta donde aprender cosas de LaTeX. Más allá de ellos, [LaTeX Stack Exchange](https://tex.stackexchange.com/) es el [StackOverflow](http://stackoverflow.com/) para LaTeX, un foro para hacer preguntas y encontrar respuestas.

Aquí comentaremos algunos paquetes y trozos de código que hemos encontrado útiles a la hora de realizar las memorias. [CTAN (Comprehensive TeX Archive Network)](https://ctan.org/) es el repositorio donde se alojan todos los paquetes de LaTeX, y todos ellos incluyen documentación. Si te atascas con algún paquete, o quieres investigar más, búscalo aquí.


### Nociones generales
LaTeX (técnicamente TeX) es un lenguaje de programación que se programa en archivos de [texto plano](https://en.wikipedia.org/wiki/Plaintext) y, por lo tanto, usa caracteres especiales para significar cosas especiales:
- Comandos empiezan con `\`
- Entornos con `\begin{<env>} ... \end{<env>}`
- Comentarios con `%`
- Los caracteres especiales deben ser escapados:
   - `#`, `$`, `%`, `&`, `_`, `{`, `}` se escapan con `\`, e.g. `\_`
   - `\`, `^`, `~` requieren un comando específico: `\textbackslash`, `\textasciicircum`, `\textasciitilde`

> [!TIP]
> El 80% de los errores de compilación de LaTeX ocurren porque no se han escapado caracteres especiales, especialmente `_` y `$`.
>
> Si te encuentras con un error en una zona de texto normal, comprueba si has escapado estos caracteres.


### Formato del texto
Se realiza a través de los siguientes comandos:
- **Negrita**: `\textbf{...}`
- *Cursiva*: `\textit{...}`
- <ins>Subrayado</ins>: `\underline{...}`
- `Verbatim`: `\texttt{...}`
- [URLs](https://noot.space/): `\href{https://test.com}{...}` (parte del paquete [hyperref](https://ctan.org/pkg/hyperref?lang=en))


### Párrafos y saltos de línea
LaTeX está pensado para permitir romper las líneas del código fuente sin romper las líneas del documento.

Por lo tanto, para empezar un nuevo párrafo, es necesario dejar una línea (o más) en blanco:
```latex
Y así fue como me convertí en un maestro Pokémon.

Pero el verdadero tesoro fueron los amigos que hicimos por el camino.
```

> [!NOTE]
> El resto de líneas en blanco son ignoradas.

Para insertar un salto de línea manual, es necesario usar `\\`:
```latex
Mi carro me lo robaron, estando de romería\\
mi carro me lo robaron, anoche cuando dormía
```

Para evitar la sangría (indentación) de la primera línea de un párrafo, se usa `\noindent`:
```latex
\noindent
He dicho.

El otro día...
```

### Listas
Hay dos tipos de listas, enumeradas y no enumeradas:
```latex
\begin{enumerate}
  \item Primero
  \item Segundo
\end{enumerate}
```
```latex
\begin{itemize}
  \item Uno
  \item Otro
\end{itemize}
```

También puedes anidarlas (incluso combinando enumeradas y no enumeradas):
```latex
\begin{enumerate}
  \item Primero
  \begin{itemize}
    \item Primero A
    \item Primero B
  \end{itemize}
  \item Segundo
\end{enumerate}
```

Si quieres más control y configuración sobre las listas, échale un vistazo al paquete [enumitem](https://ctan.org/pkg/enumitem).


### Estructura del documento
Puedes dividir jerárquicamente tu documento en distintos tipos de secciones. Dependiendo del tipo de documento, hay más o menos, pero para éste (`article`), tienes los siguientes:
- `\part`: Parte; e.g. `I`. Empieza en una página nueva.
- `\section`: Sección, o capítulo; e.g. `1.`.
- `\subsection`: Subsección, o apartado; e.g. `1.1.`.
- `\subsubsection`: Subapartado; e.g. `1.1.1.`.

Para empezar basta con usar el comando seguido del nombre de la sección:
```latex
\section{Mi sección}
```

> [!NOTE]
> Las secciones se enumeran automáticamente.


### Índices
Las partes se marcarán automáticamente en el índice, a no ser que incluyas un asterisco en el comando, e.g.:
```latex
\section*{Mi sección secreta}
```

Hay diferentes índices que puedes incluir:
```latex
\tableofcontents  % índice de contenidos
\listoffigures  % índice de figuras
\listoftables  % índice de tablas
```
> [!NOTE]
> Al usar la plantilla `uc3mreport`, cada índice se creará en una página nueva.


### Páginas nuevas
Usa `\newpage` para crear una página nueva.


### Referencias
Puedes marcar cualquier punto del documento para referenciarlo más tarde. Ésto es parte del paquete [hyperref](https://ctan.org/pkg/hyperref?lang=en).

Puedes crear una marca con `\label{<id>}`, y luego referenciarlo de varias formas. Dependiendo de dónde esté la marca, si es un párrafo, una figura, una tabla, una ecuación, etc., se comporta de manera ligeramente distinta.
- `\ref{<id>}`: Pone el número de la sección/figura/etc. a la que se refiere.
- `\nameref{<id>}`: Pone el nombre de la sección/figura/etc. a la que se refiere.
- `\pageref{<id>}`: Pone el número de página de la sección/figura/etc. a la que se refiere.

E.g.:
```latex
\section{Introducción}\label{sec:introduccion}

...

Como mencioné en la Sección \ref{sec:introduccion}, \textit{\nameref{sec:introduccion}}...
```


### Notas a pie de página
Se usa el comando `\footnote{...}`. Se enumeran automáticamente.


### Figuras
La clase `uc3mreport` provee el formato general de las figuras.

Lo más recomendable es que cada imagen vaya acompañada de una leyenda, o _caption_, que vayan numeradas, y que sea referenciable. 

Veamos un ejemplo rápido para insertar una imagen _raster_ (PNG, JPG), aquí lo tienes:
```latex
\begin{figure}[htb]
  \centering
  \includegraphics[width=0.8\textwidth]{figura.png}
  \caption{Mi figura}
  \label{fig:figura}
\end{figure}
```

Los parámetros más importantes son los siguientes:
- **Localización** (parámetro del entorno `figure`). Lo más recomendable es usar `htb`, el cual intenta colocar la figura en el mejor sitio, buscando que esté o aproximadamente aquí (`h`ere), al principio de la siguiente página (`t`op), o al final de la siguiente página (`b`ottom). Si quieres que la figura aparezca exactamente en este punto del texto, usa `H`.  
> [!NOTE]
> También se puede hacer uso de `\FloatBarrier` (del paquete [`placeins`](https://ctan.org/pkg/placeins)) para prevenir que cualquier imagen pase de ese punto. En esta plantilla, ninguna imagen pasará de la sección en la que se ha incrustado.
- **Tamaño** (parámetro `width` de `\includegraphics`). Escala la figura hasta el tamaño especificado. Lo más recomendable es que sea un porcentaje del ancho del texto, por ejemplo, un 80% con `width=0.8\textwidth`.
- **_Path_ del archivo** (argumento de `\includegraphics`). Esto indica dónde está localizado el archivo. En caso de haber configurado `\graphicspath` (lo cual es recomendable), la ruta es relativa a esa carpeta. En este caso, sería `figura.png`.
- **_Caption_**. La leyenda de la figura. Pon aquí el texto que quieras, el cual también se verá reflejado en el índice de figuras en caso de existir. En caso de querer un texto diferente en el índice, usa `\caption[<texto del índice>]{<texto del documento>}`.
- **_Label_**. Crea una referencia a la figura, la cual se puede luego usar para referenciar la figura, por ejemplo usando `Figura \ref{fig:figura}`. Es recomendable siempre referenciar las figuras en el texto, sobre todo si se usa una localización no exacta. Más información en el apartado [Referencias](#referencias)

#### Figuras vectoriales
Para insertar imágenes SVG, usa `\includesvg` en lugar de `\includegraphics`, el cual es parte del paquete [svg](https://ctan.org/pkg/svg) (incluído en la clase).

> [!NOTE]
> Si la imagen SVG contiene texto, es recomendable usar el parámetro `inkscapelatex=false` para evitar que el texto de la imagen sea formateado por LaTeX.  
> 
> E.g.:
> ```latex
> \begin{figure}[htb]
>   \centering
>   \includesvg[inkscapelatex=false,width=0.8\textwidth]{figura.svg}
>   \caption{Mi figura}
>   \label{fig:figura}
> \end{figure}
> ```

> [!NOTE]
> Si el SVG viene de [draw.io](https://www.drawio.com/), recuerda quitar el _wrapping_ y el texto formateado antes de exportarlo. Más información [aquí](https://www.drawio.com/doc/faq/svg-export-text-problems#disable-formatted-text-and-word-wrap).


#### Sub-figuras
El paquete [`subcaption`](https://ctan.org/pkg/subcaption) incluye el entorno `subfigure`, para crear distintas sub-figuras dentro de la misma figura. Puedes especificar el tamaño de cada sub-figura, y lo recomendable es dejar el tamaño de las imágenes dentro de cada figura en el tamaño de línea (`\linewidth`).

Por ejemplo, para tener dos figuras una al lado de la otra:
```latex
\begin{figure}[htb]
  \centering
  \begin{subfigure}{.45\textwidth}
    \includegraphics[width=\linewidth]{fig1.png}
    \caption{Una cosa}
    \label{fig:fig1}
  \end{subfigure}
  \begin{subfigure}{.45\textwidth}
    \centering
    \includegraphics[width=\linewidth]{fig2.png}
    \caption{Otra cosa}
    \label{fig:fig2}
  \end{subfigure}
  \caption{Dos cosas}
\end{figure}
```


### Tablas
Las tablas en LaTeX pueden llegar a ser algo complicadas. Si no quieres comerte la cabeza, puedes usar un generador de tablas como [Tables Generator](https://www.tablesgenerator.com/).

La estructura general de una tabla es la siguiente:
```latex
\begin{table}
    \centering
    \begin{tabular}{lr}
        \toprule
        Nombre  &  País    \\
        \midrule
        Carlos  &  España  \\
        Pierre  &  Francia \\
        \bottomrule
    \end{tabular}
    \caption{Nombres}
    \label{tab:nombres}
\end{table}
```
- Se usa `\centering` para centrar la tabla
- En el primer parámetro del entorno `tabular` es donde se especifican las columnas. En el ejemplo anterior, esto sería `lr`.  
  Cada columna es representada por una letra, indicando su alineado, izquierda (`l`), derecha (`r`), o centrado (`c`). También se puede especificar el ancho de la columna (manteniendo el centrado) con `M{<ancho>}`, e.g. `M{0.5cm}`.  
  Para añadir líneas entre columnas, se usa el caracter `|` en el mismo argumento, e.g. `|l|r|`.
- Dentro del entorno `tabular` se especifican las filas de la tabla. Se delimitan los elementos de cada columna con el caracter `&`, y con `\\` se especifica el fin de la columna.  
  También se pueden añadir líneas horizontales, como son `\hline` o `\toprule`, `\midrule` y `\bottomrule` (del paquete [booktabs](https://ctan.org/pkg/booktabs)).
- Se le puede añadir una leyenda, en el entorno `table`, al igual que en las imágenes. Y por supuesto se pueden etiquetar.
- Para hacer notas a pie de página desde las tablas, usa `\tablenote` (del paquete [tablefootnote](https://ctan.org/pkg/tablefootnote)).

También puedes optar por usar el paquete [threeparttable](https://ctan.org/pkg/threeparttable) para generar tus tablas, el cual las organiza de una forma ligeramente distinta.

Si la tabla es demasiado ancha:
- Usar [`adjustbox`](https://ctan.org/pkg/adjustbox) alrededor del `tabular`:
  ```latex
  \usepackage{adjustbox}
  ```
  ```latex
  \begin{adjustbox}{max width=\textwidth}
    \begin{tabular}{...} 
      % [...]
    \end{tabular}
  \end{adjustbox}
  ``` 
- Meterla en una página horizontal con [`pgfplots`](https://ctan.org/pkg/pgfplots):
  ```latex
  \usepackage{pgfplots}
  ```
  ```latex
  \begin{landscape}
    \ttabox[\FBwidth]
      {...}
      {...}
  \end{landscape}
  ``` 


### Ecuaciones
LaTeX tiene un modo «matemátcias» donde se pueden introducir fórmulas
matemáticas. Por ejemplo la fórmula `(x + 1)² = x² + 2x + 1`. Para introducirla
en LaTeX se puede poner la fórmula entre signos de dólar estadounidense (`$`).

```latex
La fórmula $(x + 1)^2 = x^2 + 2x + 1$ es muy utilizada.
```

Cuando se compila, se redenriza como:

```plain
La fórmula (x + 1)² = x² + 2x + 1 es muy utilizada.
```

En este caso, la fórmula está en **la misma línea** que el resto del texto
(_inline math mode_). Otras formas de entrar en modo mates en la misma línea
es usando:

* `$ ... $`
* `\( ... \)`
* `\begin{math} ... \end{math}`

Pero la primera y la segunda, son las más utilizadas.

También se puede poner centrada en la siguiente línea, utilizando:

* `$$ ... $$`
* `\[ ... \]`
* `\begin{equation} ... \end{equation}`

La única diferencia es que `\begin{equation}` numera la fórmula. Por ejemplo:

```latex
La fórmula

\[ (x + 1)^2 = x^2 + 2x + 1 \]

es muy utilizada.
```

Se renderiza como:

```plain
La fórmula

   (x + 1)² = x² + 2x + 1
   
es muy utilizada.
```

Y con `\begin{equation}`

```latex
La fórmula

\begin{equation}
   (x + 1)^2 = x^2 + 2x + 1
\end{equation}

es muy utilizada.
```

Se renderiza como:

```plain
La fórmula

   (x + 1)² = x² + 2x + 1                             (1)
   
es muy utilizada.
```

#### Símbolos matemáticos
Los símbolos `+`, `=`, `<`, `>` o `-` se pueden utilizar tal cual. Pero con
LaTeX tenemos mucha más flexibilidad. Unos cuantos ejemplos:

* `·` es `\cdot`
* `≠` es `\ne`, `≤` es `\le`, `≥` es `\ge`
* `α` es `\alpha`, `β` es `\beta`, `γ` es `\gamma`...
* `Γ` es `\Gamma`, `Δ` es `\Delta`, `Θ` es `\Theta`...

Una forma y sencilla de buscar el símbolo que quieras es esta herramienta en
línea. Dibujas el símbolo y te dice cómo 
<https://detexify.kirelabs.org/classify.html>

#### Fracciones, superíndices y subíndices
Para introducir una fracción se usa `\frac{numerador}{denominador}`.

El superíndice se hace con el acento circunflejo `^`. Si hay más de un símbolo
en el exponente. Para que pille todos hay que rodearlos entre llaves (`{}`).
Por ejemplo:

* **x²**: `x^2`
* **x⁴²**: `x^{42}`
* **x⁴2**: `x^42`

Para el subíndice se usa el guion bajo `_` y se comporta igual que el
superíndice. Se puede poner subíndice y superíndice:

* **x<sub>i</sub><sup>2</sup>**: `x_i^2`

Si se usa con el símbolo de integral `\int`, de sumatorio `\sum` o productorio
`\prod`:

* **2Σ<sub>i=1</sub><sup>n</sup> i = n · (n + 1)**: `2\sum_{i=1}^n i = n \cdot (n + 1)`

### Bloques de código


### Organización del código
Nadie quiere tener un sólo archivo `.tex` de 2.000 líneas... ¿verdad?

LaTeX te permite separar cómodamente el contenido de tu documento en distintos archivos. Para ello, es recomendable usar el paquete [import](https://ctan.org/pkg/import).

Incluír un archivo desde otro directorio es tan simple como usar `\includefrom{subdir/}{file.tex}`, o `\import{subdir/}{file.tex}` (para usar del mismo directorio, basta con dejar el primer argumento vacío, e.g. `\import{}{file.tex})`).

> [!NOTE]
> La principal diferencia entre `\includefrom` e `\import` es que `\includefrom` compila los distintos archivos de forma separada, y los reutiliza si no han cambiado, reduciendo considerablemente el tiempo de compilación al hacer cambios en documentos grandes.
> Sin embargo, debido a esto, `\includefrom` siempre añade los contenidos del archivo en una página nueva, mientras que `\import` no.

Es recomendable organizar tu código de la siguiente manera:
```
report/
├─ img/
├─ parts/
│  ├─ introduction.tex
│  ├─ development.tex
│  ├─ conclusions.tex
├─ report.tex
├─ references.bib
├─ uc3mreport.cls
```

Y, en `report.tex`, incluír los archivos dentro del entorno `report`:
```latex
\begin{report}
  \includefrom{parts/}{introduction.tex}
  \includefrom{parts/}{development.tex}
  \includefrom{parts/}{conclusions.tex}
  ...
\end{report}
```


### Macros
Las macros son pequeñas funciones que puedes definir y usar a lo largo de tu código. Son útiles para automatizar cosas, o añadir funcionalidades. Los paquetes de LaTeX están llenos de ellas.

Se definen con `\newcommand`, e.g.:
```latex
\newcommand{\helloworld}{Hello, world!}
```

La macro anterior incluiría el texto `Hello, world!` en el sitio donde la llames con `\helloworld`.

Las macros también admiten argumentos. Especificas el número de argumentos entre corchetes en la definición:
```latex
\newcommand{\hello}[2]{Hello, #1 and #2!}
```
La macro ahora toma dos parámetros, los cuales son sustituídos por el `#1` (primer argumento) y el `#2` (segundo argumento), al llamarla con `\hello{Jose}{Pepe}`, lo que resultaría en `Hello, Jose and Pepe!`.

También puedes especificar argumentos opcionales, los cuales tienen un valor por defecto:
```latex
\newcommand{\hello}[3][Hello]{#1, #2 and #3!}
```
El argumento opcional es siempre el primero, en el caso anterior sería `Hello`. Para sobreescribir el opcional, lo especificamos entre corchetes: `\hello[Hola]{Jose}{Pepe}`, lo que resultaría en `Hola, Jose and Pepe!`.


### Bibliografía
Para añadir referencias y bibliografía en LaTeX se usa el paquete [biblatex](https://ctan.org/pkg/biblatex). Ésta plantilla está configurada para seguir el estilo IEEE.

Éste paquete te permite usar archivos `.bib` para guardar todas las referencias, y para cargarlo necesitas especificarlo con `\addbibresource{<file>}`. Después, puedes imprimir la bibliografía con `\printbibliography`. En `report.tex` tienes esto ya preparado para ser configurado.
> [!TIP]
> Si no quieres incluír bibliografía, borra estas secciones de `report.tex`

#### Añadir referencias
Las referencias se guardan en el `.bib`. Hay distintos tipos de referencias, dependiendo de lo que estés referenciando, pero en general siguen la misma estructura:
```bibtex
@book{cicero45finibus,
  author         = {Cicero, Marcus Tullius},
  title          = {De Finibus Bonorum Et Malorum},
  year           = {45 BCE}
  ...
}
```
Lo primero es el tipo de referencia, lo cual afecta a cómo se pondrá en la bibliografía. Luego viene la _key_, o el ID por el que haremos la referencia en el texto. Después vienen los distintos parámetros. Rellena los que puedas y borra el resto.

> [!TIP]
> En `references.bib` tienes plantillas para los tipos de referencias más usados: libros (`book`), artículos (`article`), páginas web (`online`), y estándares IEEE (`techreport`).

> [!TIP]
> Muchos recursos, como [Google Scholar](https://scholar.google.com/) o la [biblioteca de la UC3M](https://bibliotecas.uc3m.es/) te permiten exportar las referencias directamente en formato BibTeX, para poder pegarlas directamente en `references.bib`.

> [!TIP]
> Muchos artículos publicados online cuentan con un [DOI](https://www.doi.org/), un identificador global. Es recomendable rellenar esta propiedad cuando la encuentres, puesto que permite acceder cómodamente a ellos.

#### Citar
En el texto, se cita con `\cite{key}`, incluyendo la _key_ del elemento a citar.

> [!TIP]
> `\cite` usa el estilo de cita por defecto del documento. Si quieres usar uno específico, tienes `\parencite` y `\supercite`.  
> Si quieres incluír el texto en tu cita, usa `\textcquote{key}{text}`.


### Apéndices
Usa el entorno `appendices` para definir tus apéndices. Para cada apéndice, usa una `\section`.



## VS Code
Algunas extensiones útiles:
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
> [!IMPORTANT]
> Si estás usando esta extensión, por favor añade el parámetro `-shell-escape` (ver [LaTeX Workshop FAQ](https://github.com/James-Yu/LaTeX-Workshop/wiki/FAQ#how-to-pass--shell-escape-to-latexmk))

> [!TIP]
> Puedes cambiar el directorio de salida en `latex-workshop.latex.outDir`, poniéndolo por ejemplo a `%DIR%/build` (ver [LaTeX Workshop Wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki/View#latex-workshoplatexoutdir)).  
> Si te encuentras con problemas al compilar, asegúrate de que existen todas las subcarpetas (e.g. `build/parts/`).

> [!TIP]
> Puedes habilitar el conteo de palabras estableciendo `latex-workshop.wordcount` a `onSave` en los ajustes. Más información [aquí](https://github.com/James-Yu/LaTeX-Workshop/wiki/ExtraFeatures#counting-words).

- [LTeX+](https://marketplace.visualstudio.com/items?itemName=ltex-plus.vscode-ltex-plus): Corrector ortográfico.
> [!TIP]
> Puedes cambiar el idioma del corrector a través del parámetro `ltex.language` en la configuración de VS Code


## Ejemplos
Aquí te dejamos algunos ejemplos de memorias hechas con esta plantilla:
- [ldcas-uc3m/TAC-P1](https://github.com/ldcas-uc3m/TAC-P1/tree/main/report) (usando una versión temprana de la plantilla)
- [ldcas-uc3m/VA-PF](https://github.com/ldcas-uc3m/VA-PF/tree/main/report)


## Más información

### Documentación
- [Overleaf knowledge base](https://www.overleaf.com/learn)
- [LaTeX - Wikibooks](https://en.wikibooks.org/wiki/LaTeX)
- [CTAN (Comprehensive TeX Archive Network)](https://ctan.org/)

### Tutoriales/charlas
- [Patataman/LatexBasic](https://github.com/Patataman/LatexBasic): Curso de LaTeX básico desde 0
- [L. Prieto - Generación de documentos en LaTeX](https://youtu.be/cFieGJljKog) (2021)
- [L. D. Casais - Memorias de TFG en LaTeX](https://github.com/rajayonin/latex-thesis/blob/main/transparencias.pdf) (2025)

### Otros recursos
- [f0nzie/tikz_bars](https://github.com/f0nzie/tikz_bars): Ejemplos de gráficas (bueno para referencias)
- [ldcas-uc3m/thesis-template](https://github.com/ldcas-uc3m/TFG): Plantilla para TFG/TFM
- [LaTeX Stack Exchange](https://tex.stackexchange.com/)

