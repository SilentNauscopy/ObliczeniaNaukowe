module blocksys
include("better_gauss.jl")
include("better_withmaster.jl")
include("generate.jl")
export Gauss, GaussWithMaster, generate
end
