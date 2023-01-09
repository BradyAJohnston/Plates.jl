module Plates
import CSV, 
        DataFrames

export well_from_index, 
        n_cols, 
        n_rows, 
        well_to_row_let, 
        well_to_row_num, 
        well_to_col_num, 
        well_from_row_col, 
        well_from_index, 
        well_join, 
        well_format, 
        well_to_index, 
        
        read_meta

include("well.jl")
include("read.jl")
end
