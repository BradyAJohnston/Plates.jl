using Plates
using Test

@testset "Plates.jl" begin
    # Write your tests here.
    plate = Plates.read_meta("metadata.csv")
    @test Plates.well_from_index(12) == "D02"
    @test Plates.well_from_index(8)  == "H01"
    @test Plates.well_from_index(13) == "E02"
    @test Plates.well_from_index(13, colwise=false) == "B01"
    @test Plates.well_from_index(12, colwise=false) == "A12"
    
    @test Plates.well_to_index("a1") == 1
    @test Plates.well_to_index("H01") == Plates.well_to_index("h1")
    @test Plates.well_to_index("H01") == Plates.well_to_index("h01")
    @test Plates.well_to_index("H01") == Plates.well_to_index("H1")
    @test plate[1, 1] == "A01"
    @test plate[3, :Bacteria] == "C. trachomatis"
    @test plate[well_to_index("h11"), :Concentration] == 1.024e-5
    @test sum(plate[1:10, :Concentration]) == 840
end
