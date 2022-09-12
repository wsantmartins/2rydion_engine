#quench piecewise function
#The present function aim to describe our piecewise function that describe the quench parameters 
using PyCall 
using Base.Threads 
using OrdinaryDiffEq
using Simpson
using StaticArrays
using PyPlot
using BenchmarkTools

include("parameters.jl")
include("eq_solver.jl")
include("quench_a.jl")
include("quench_b.jl")
np = pyimport("numpy")

#parameters
p = @SVector[omega, big_omega, delta, gamma, k0, k1, k2]

#initial values condition

y0 = @SVector[x0, p0, x20, p20, xp0, sx0, sy0, sz0]

#defining a problem
prob = ODEProblem(set_odes, y0, tspan, p)
#solving a previous defined problem
sol = solve(prob,  Rodas4(), abstol=1e-12, reltol=1e-12, maxiters=1e10, saveat=dt, save_everystep=false)
s_sol = convert(Array, sol)

plot(t, x)
show()
