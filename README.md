Plates.jl
================

<!-- badges: start -->

[![Build
Status](https://github.com/bradyajohnston/Plates.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/bradyajohnston/Plates.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Codecov test
coverage](https://codecov.io/gh/bradyajohnston/plasmapR/branch/main/graph/badge.svg)](https://app.codecov.io/gh/bradyajohnston/Plates.jl?branch=main)

<!-- badges: end -->

Useful functions for working with plate-based data inside of Julia.

Primarily oriented around dealing with plate-based data in combination
with `DataFrames.jl`

## Installation

``` julia
using Pkg
Pkg.add(url = "https://github.com/bradyajohnston/Plates.jl.git")
```

## Basic Usage

The idea behind `Plates.jl` is to enable the addition of metadata for
plate-based experiments to be associated with observations from plate
readers.

The metadata can be set out in a ‘plate format’ as shown in the example
below. Each variable has its own plate layout, with the name in the top
left corner. The columns and rows are labelled with numbers and letters.
Values for each of the wells are then placed in the plate layout,
corresponding to the values in the experiment. Each variable block is
separated by an empty row.

![a screenshot of the plate format, to save as a .csv
file](https://user-images.githubusercontent.com/36021261/211939595-7bf2b2b2-0424-4a45-9d73-b0774abcb6cd.png)

Reading in the metadata shown above, produces a dataframe in the
long-form, with a column for the `well`, `row`, `col` and a column for
each variable. These can then be joined to the observations in another
dataframe, by the `well` column.

``` julia
using Plates

meta = read_meta("test/plate96.csv")

first(meta, 12)
```

<div><div style = "float: left;"><span>12×6 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;"><table class = "data-frame" style = "margin-bottom: 6px;"><thead><tr class = "header"><th class = "rowNumber" style = "font-weight: bold; text-align: right;">Row</th><th style = "text-align: left;">well</th><th style = "text-align: left;">row</th><th style = "text-align: left;">col</th><th style = "text-align: left;">Drug</th><th style = "text-align: left;">Concentration</th><th style = "text-align: left;">Bacteria</th></tr><tr class = "subheader headerLastRow"><th class = "rowNumber" style = "font-weight: bold; text-align: right;"></th><th title = "String" style = "text-align: left;">String</th><th title = "String" style = "text-align: left;">String</th><th title = "Int16" style = "text-align: left;">Int16</th><th title = "Union{Missing, InlineStrings.String1}" style = "text-align: left;">String1</th><th title = "Union{Missing, Float64}" style = "text-align: left;">Float64?</th><th title = "Union{Missing, InlineStrings.String31}" style = "text-align: left;">String31</th></tr></thead><tbody><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">1</td><td style = "text-align: left;">A01</td><td style = "text-align: left;">A</td><td style = "text-align: right;">1</td><td style = "text-align: left;">A</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">E. coli</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">2</td><td style = "text-align: left;">B01</td><td style = "text-align: left;">B</td><td style = "text-align: right;">1</td><td style = "text-align: left;">A</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">S. enterocolitis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">3</td><td style = "text-align: left;">C01</td><td style = "text-align: left;">C</td><td style = "text-align: right;">1</td><td style = "text-align: left;">A</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">C. trachomatis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">4</td><td style = "text-align: left;">D01</td><td style = "text-align: left;">D</td><td style = "text-align: right;">1</td><td style = "text-align: left;">A</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">N. gonorrhoeae</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">5</td><td style = "text-align: left;">E01</td><td style = "text-align: left;">E</td><td style = "text-align: right;">1</td><td style = "text-align: left;">B</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">E. coli</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">6</td><td style = "text-align: left;">F01</td><td style = "text-align: left;">F</td><td style = "text-align: right;">1</td><td style = "text-align: left;">B</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">S. enterocolitis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">7</td><td style = "text-align: left;">G01</td><td style = "text-align: left;">G</td><td style = "text-align: right;">1</td><td style = "text-align: left;">B</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">C. trachomatis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">8</td><td style = "text-align: left;">H01</td><td style = "text-align: left;">H</td><td style = "text-align: right;">1</td><td style = "text-align: left;">B</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">N. gonorrhoeae</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">9</td><td style = "text-align: left;">A02</td><td style = "text-align: left;">A</td><td style = "text-align: right;">2</td><td style = "text-align: left;">A</td><td style = "text-align: right;">20.0</td><td style = "text-align: left;">E. coli</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">10</td><td style = "text-align: left;">B02</td><td style = "text-align: left;">B</td><td style = "text-align: right;">2</td><td style = "text-align: left;">A</td><td style = "text-align: right;">20.0</td><td style = "text-align: left;">S. enterocolitis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">11</td><td style = "text-align: left;">C02</td><td style = "text-align: left;">C</td><td style = "text-align: right;">2</td><td style = "text-align: left;">A</td><td style = "text-align: right;">20.0</td><td style = "text-align: left;">C. trachomatis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">12</td><td style = "text-align: left;">D02</td><td style = "text-align: left;">D</td><td style = "text-align: right;">2</td><td style = "text-align: left;">A</td><td style = "text-align: right;">20.0</td><td style = "text-align: left;">N. gonorrhoeae</td></tr></tbody></table></div>

This is inpsired by the very useful
[`{plater}`](https://docs.ropensci.org/plater/) R package for layout of
the metadata file.

## Formatting Functions

Plates also comes with a number of convenience functions for formatting
to and from well IDs,

Most of these functions start with the `well_*` prefix.

For the `well_*_index()` functions, by default `Plates.jl` indexes down
the column first, as this is how data is stored in Julia. This means
`A01` is `1`, `H01` is 8, and `A02` is 9. You can index across the rows
first by setting `colwise = false`.

``` julia
ind = [13, 12, 8, 9]
well_from_index.(ind)
```

    4-element Vector{String}:
     "E02"
     "D02"
     "H01"
     "A02"

``` julia
well_from_index.(ind, colwise = true)
```

    4-element Vector{String}:
     "E02"
     "D02"
     "H01"
     "A02"

``` julia
well_from_index.(ind, 384, colwise = true)
```

    4-element Vector{String}:
     "M01"
     "L01"
     "H01"
     "I01"

``` julia
rows = [1, "A", 8, "H"]
well_from_row_col.(rows, 3)
```

    4-element Vector{String}:
     "A03"
     "A03"
     "H03"
     "H03"

``` julia
wells = ["a1", "H01", "H1", "c6", "h1", "A12"]
well_to_row_let.(wells)
```

    6-element Vector{String}:
     "A"
     "H"
     "H"
     "C"
     "H"
     "A"

``` julia
well_to_row_num.(wells)
```

    6-element Vector{Int64}:
     1
     8
     8
     3
     8
     1

``` julia
well_to_col_num.(wells)
```

    6-element Vector{Int16}:
      1
      1
      1
      6
      1
     12

``` julia
well_format.(wells)
```

    6-element Vector{String}:
     "A01"
     "H01"
     "H01"
     "C06"
     "H01"
     "A12"
