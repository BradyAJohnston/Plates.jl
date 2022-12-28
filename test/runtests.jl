using Plates
using Test

@testset "Plates.jl" begin
    # Write your tests here.
    @test Plates.well_from_index(12, colwise = false) == "A12"
    @test Plates.well_from_index(12, colwise = true) == "D02"
    @test Plates.well_from_index(8, colwise = true) == "H01"
    @test Plates.well_to_index("a1") == 1
    @test Plates.well_to_index("H01") == 8
end
