__precompile__()

module JuMIT

#const depsfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
#if isfile(depsfile)
#	include(depsfile)
#else
#	error("JuMIT not properly installed. Please run Pkg.build(\"JuMIT\") then restart Julia.")
#end

# include modules (note: due to dependencies, order is important!)
include("Grid.jl")
include("Poisson.jl")
include("Interpolation.jl")
include("Operators.jl")
include("DSP.jl")
include("Wavelets.jl")
include("Smooth.jl")
include("IO.jl")
include("Models.jl")
include("Acquisition.jl")
include("Coupling.jl")
include("Data.jl")
include("Interferometry.jl")
include("Gallery.jl")
include("Analytic.jl")
include("Fdtd.jl")
include("Misfits.jl")
include("Inversion.jl")
include("FWI.jl")
include("CICA.jl")
include("Conv.jl")
include("ConvMix.jl")
include("DeConv.jl")
include("DeConvOP.jl")
include("Plots.jl")

end # module
