using PyCall 
using Base.Threads 
using OrdinaryDiffEq
using Simpson
using StaticArrays

using BenchmarkTools

np = pyimport("numpy")

#Let us begin this code defining our set of equations to integrate
#This present function defines the ODE's, where p is a vector of parameters and y the variables
function set_odes(y, p, t)
    #parameters
    omega, big_omega, delta, gamma, k0, k1, k2 = p 

    #bosonic variables
    #linear 
    x = y[1]
    p = y[2]
   
    #electronic variables 
    sx = y[3]
    sy = y[4]
    sz = y[5]
    nr = 0.5 + sz/2.0  
    cf = sqrt(3.0)

    #quadratic
    x2 = y[6]
    p2 = y[7]
    xp = y[8]

    #equations 
    dx = cf*omega*p
    dp = -cf*omega*x - 0.5*k1*nr^2 - k2*x*nr^2.0 
    dx2 = 2.0*cf*omega*xp
    dp2 = - 2.0*cf*omega*xp - k1*p*nr^2.0 + 2.0*k2*xp*nr^2.0
    dxp = cf*omega*(x2 - p2) - 0.5*k1*x*nr^2 - k2*x2*nr^2.0
    dsx = -(k0 + k1*x + k2*x2)*sy*nr - delta*sy - 0.5*gamma*sx 
    dsy = (k0 + k1*x + k2*x2)*sx*nr - 2.0*big_omega*sz + delta*sx - 0.5*gamma*sy
    dsz = 2.0*big_omega*sy - gamma*nr

    @SVector[dx, dp, dx2, dp2, dxp, dsx, dsy, dsz]

end 