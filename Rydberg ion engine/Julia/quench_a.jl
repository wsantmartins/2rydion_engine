#quench piecewise function
#The present function aim to describe our piecewise function that describe the quench parameters 
using PyCall 
using PyPlot

np = pyimport("numpy")

function quench_a(t, T, a_max, a_min)

    #angular coefficient 
    ang = 4.0*(a_max - a_min)/T

    #linear coefficients
    lin1 = a_max - 2.0*a_min
    lin2 = 4.0*a_max - 3.0*a_min

    if (0.0 <= t % T && t % T < T/4.0)
        a = a_min
    end
    
    if (T/4.0 <= t % T && t % T < T/2.0)
        a = ang*(t % T)  - lin1
    end

    if (T/2.0 <= t % T && t % T < 3.0*T/4.0)
        a = a_max
    end
    
    if (3.0*T/4.0 <= t % T && t % T < T)
        a = lin2 - ang*(t % T) 
    end

    return a
end
