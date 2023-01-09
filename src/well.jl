# handy vectors of the alphabet for indexing
LETTERS = LazyString.(Char.(65:89))
letters = LazyString.(Char.(97:122))


"""
# n_cols(n_wells::Int)
Calculate the number of columns in a plate, given the number of wells in the plate.
"""
function  n_cols(n_wells::Int)
    return Int(sqrt(n_wells * 3 / 2))
end


"""
# n_rows(n_wells::Int)
Calculate the number of rows in a plate, given the number of wells in the plate.
"""
function n_rows(n_wells::Int)
    return Int(sqrt(n_wells * 2 / 3))
end


"""
# well_to_row_let(well::String)
From a well ID string ('a1', 'C02', 'H12') extract the letter component of the well ID and return it as uppercase if requested.
"""
function well_to_row_let(well::String; upper = true)
    mm = match(r"[A-z]{1,2}", well).match
    if upper
        return uppercase(mm)
    else 
        return mm
    end
end

function well_to_row_num(well::String)
    letter = well_to_row_let(well)
    return findfirst(letter .== LETTERS)
end

function well_to_col_num(well::String)
    number = match(r"[0-9]{1,4}$", well).match
    return parse(Int16, number)
end

function well_from_row_col(row, col; pad = 2)
    if isa(row, Real)
        row = LETTERS[row]
    else# isa(row, String) 
        row = uppercase.(row)
    #else
     #   error("Row must be numeric or character.")
    end

    col = string.(col, pad = pad)
    
    return String.(row) .* String.(col)
end

function well_join(row, col)
    return well_from_row_col(row, col)
end

function well_format(well::String; pad = 2)
    row_i = well_to_row_num(well)
    col_i = well_to_col_num(well)
    
    return well_from_row_col(row_i, col_i; pad = pad)
end

function count_along_plate(x, y)
    modulo = mod(x, y)
    if modulo == 0
        modulo = y
    end
    return modulo
end

function well_from_index(index::Int; plate_size = 96, colwise = true)
    rows = n_rows(plate_size)
    cols = n_cols(plate_size)

    if colwise
        wells = ["$row$col" for col in string.(1:cols, pad = 2) for row in LETTERS[1:rows]]
    else 
        wells = ["$row$col" for row in LETTERS[1:rows] for col in string.(1:cols, pad = 2)]
    end

    return wells[index]
    
end

function well_to_index(well::String; plate_size = 96, colwise = true)
    col_i = well_to_col_num(well)
    row_i = well_to_row_num(well)

    rows = n_rows(plate_size)
    cols = n_cols(plate_size)

    if colwise
        return row_i + (col_i - 1) * rows
    else
        return col_i + (row_i - 1) * cols
    end
end