README
================

# Plates

<div>

[![](https://github.com/bradyajohnston/Plates.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/bradyajohnston/Plates.jl/actions/workflows/CI.yml?query=branch%3Amain)

Build Status

</div>

Useful functions for working with plate-based data inside of Julia.

Primarily oriented around dealing with plate-based data in combination
with `DataFrames.jl`

## Installation

``` julia
using Pkg
Pkg.add(url = "https://github.com/bradyajohnston/Plates.jl.git")
```

      Activating project at `C:\Users\BradyJohnston\Documents\GitHub\Plates.jl`

``` julia
using Plates

first(read_meta("test/metadata.csv"), 12)
```

<div><div style = "float: left;"><span>12×6 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;"><table class = "data-frame" style = "margin-bottom: 6px;"><thead><tr class = "header"><th class = "rowNumber" style = "font-weight: bold; text-align: right;">Row</th><th style = "text-align: left;">well</th><th style = "text-align: left;">row</th><th style = "text-align: left;">col</th><th style = "text-align: left;">Drug</th><th style = "text-align: left;">Concentration</th><th style = "text-align: left;">Bacteria</th></tr><tr class = "subheader headerLastRow"><th class = "rowNumber" style = "font-weight: bold; text-align: right;"></th><th title = "String" style = "text-align: left;">String</th><th title = "String" style = "text-align: left;">String</th><th title = "Int16" style = "text-align: left;">Int16</th><th title = "Union{Missing, InlineStrings.String1}" style = "text-align: left;">String1</th><th title = "Union{Missing, Float64}" style = "text-align: left;">Float64?</th><th title = "Union{Missing, InlineStrings.String31}" style = "text-align: left;">String31</th></tr></thead><tbody><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">1</td><td style = "text-align: left;">A01</td><td style = "text-align: left;">A</td><td style = "text-align: right;">1</td><td style = "text-align: left;">A</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">E. coli</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">2</td><td style = "text-align: left;">B01</td><td style = "text-align: left;">B</td><td style = "text-align: right;">1</td><td style = "text-align: left;">A</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">S. enterocolitis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">3</td><td style = "text-align: left;">C01</td><td style = "text-align: left;">C</td><td style = "text-align: right;">1</td><td style = "text-align: left;">A</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">C. trachomatis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">4</td><td style = "text-align: left;">D01</td><td style = "text-align: left;">D</td><td style = "text-align: right;">1</td><td style = "text-align: left;">A</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">N. gonorrhoeae</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">5</td><td style = "text-align: left;">E01</td><td style = "text-align: left;">E</td><td style = "text-align: right;">1</td><td style = "text-align: left;">B</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">E. coli</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">6</td><td style = "text-align: left;">F01</td><td style = "text-align: left;">F</td><td style = "text-align: right;">1</td><td style = "text-align: left;">B</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">S. enterocolitis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">7</td><td style = "text-align: left;">G01</td><td style = "text-align: left;">G</td><td style = "text-align: right;">1</td><td style = "text-align: left;">B</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">C. trachomatis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">8</td><td style = "text-align: left;">H01</td><td style = "text-align: left;">H</td><td style = "text-align: right;">1</td><td style = "text-align: left;">B</td><td style = "text-align: right;">100.0</td><td style = "text-align: left;">N. gonorrhoeae</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">9</td><td style = "text-align: left;">A02</td><td style = "text-align: left;">A</td><td style = "text-align: right;">2</td><td style = "text-align: left;">A</td><td style = "text-align: right;">20.0</td><td style = "text-align: left;">E. coli</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">10</td><td style = "text-align: left;">B02</td><td style = "text-align: left;">B</td><td style = "text-align: right;">2</td><td style = "text-align: left;">A</td><td style = "text-align: right;">20.0</td><td style = "text-align: left;">S. enterocolitis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">11</td><td style = "text-align: left;">C02</td><td style = "text-align: left;">C</td><td style = "text-align: right;">2</td><td style = "text-align: left;">A</td><td style = "text-align: right;">20.0</td><td style = "text-align: left;">C. trachomatis</td></tr><tr><td class = "rowNumber" style = "font-weight: bold; text-align: right;">12</td><td style = "text-align: left;">D02</td><td style = "text-align: left;">D</td><td style = "text-align: right;">2</td><td style = "text-align: left;">A</td><td style = "text-align: right;">20.0</td><td style = "text-align: left;">N. gonorrhoeae</td></tr></tbody></table></div>

This is inpsired by the very useful
[`{plater}`](https://docs.ropensci.org/plater/) R package for layout of
the metadata file.
