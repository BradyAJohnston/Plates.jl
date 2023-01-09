function read_meta(file::String)
    lines = readlines(file)
    n_cols = length(split(lines[1], ",")) - 1
    n_rows = Int(n_cols * 2 / 3)

    n_meta = length(lines) / (n_rows + 1)

    meta_dfs = DataFrames.DataFrame()
    for i in 1:n_meta
        row_start = Int((i - 1) * (n_rows + 2) + 2)
        row_end = Int(row_start + n_rows - 1)
        
        meta_value =   split(lines[row_start-1], ",")[1]
        
        # use the particular section of lines that are already read in
        # and treat them as IO for CSV to read from
        segment = IOBuffer(join(lines[row_start:row_end], "\n"))
        dat = DataFrames.DataFrame(CSV.File(segment, header = false))

        DataFrames.rename!(dat, prepend!([Symbol("$i") for i in 1:n_cols], [:row]))
        dat = DataFrames.stack(dat, DataFrames.Not(:row))
        
        DataFrames.rename!(dat, :variable => :col)
        DataFrames.rename!(dat, :value => Symbol("$meta_value"))
        DataFrames.transform!(dat, :col => (x -> parse.(Int16, string.(x))) =>  :col)
        DataFrames.transform!(dat, :row => (x -> string.(x)) => :row)
        
        if i == 1
            meta_dfs = dat
        else
            DataFrames.leftjoin!(meta_dfs, dat, on = [:row, :col])
        end

    end
    
    DataFrames.transform!(meta_dfs, [:row, :col] => well_from_row_col => :well)
    return DataFrames.select!(meta_dfs, :well, :row, :col, :)

end