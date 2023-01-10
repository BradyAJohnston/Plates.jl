using Plates
using Test


@testset "Basic Well IDs" begin
    # Write your tests here.
    @test Plates.well_from_index(12) == "D02"
    @test Plates.well_from_index(8)  == "H01"
    @test Plates.well_from_index(13) == "E02"
    @test Plates.well_from_index(13, colwise=false) == "B01"
    @test Plates.well_from_index(12, colwise=false) == "A12"

    @test Plates.well_from_row_col(1, 3) == "A03"
    @test Plates.well_from_row_col("A", 3) == "A03"
    @test Plates.well_from_row_col(8, 3) == "H03"
    @test Plates.well_from_row_col("H", 3) == "H03"
    
    @test Plates.well_to_index("a1") == 1
    @test Plates.well_to_index("H01") == Plates.well_to_index("h1")
    @test Plates.well_to_index("H01") == Plates.well_to_index("h01")
    @test Plates.well_to_index("H01") == Plates.well_to_index("H1")

    @test Plates.well_to_row_let("h01") == "H"
    @test Plates.well_to_row_let("h1") == "H"
    @test Plates.well_to_row_let("H1") == "H"
    @test Plates.well_to_row_let("A12") == "A"

    @test Plates.well_to_row_num("h01") == 8
    @test Plates.well_to_row_num("h1") == 8
    @test Plates.well_to_row_num("H1") == 8
    @test Plates.well_to_row_num("A12") == 1
    @test Plates.well_to_row_num("c6") == 3

    @test Plates.well_format("c6") == "C06"
    @test Plates.well_format("A06") == "A06"
    @test Plates.well_format("A6") == "A06"
    @test Plates.well_format("a6") == "A06"
    
    @test Plates.well_to_col_num("a6") == 6
    @test Plates.well_to_col_num("A06") == 6
    @test Plates.well_to_col_num("h7") == 7
    @test Plates.well_to_col_num("H07") == 7
    @test Plates.well_to_col_num("G07") == 7
end

@testset "Read Metadata" begin
    meta = Plates.read_meta("metadata.csv")
    @test size(meta)[1] == 96
    @test size(meta)[2] == 6
    @test meta[1, 1] == "A01"
    @test meta[3, :Bacteria] == "C. trachomatis"
    @test meta[well_to_index("h11"), :Concentration] == 1.024e-5
    @test sum(meta[1:10, :Concentration]) == 840
end
