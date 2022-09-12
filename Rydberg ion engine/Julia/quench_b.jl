#quench piecewise function
#The present function aim to describe our piecewise function that describe the quench parameters 
using PyCall 
using PyPlot

np = pyimport("numpy")

function quench_b(t, T, b_max, b_min)
    
    #angular coefficient
    ang = 4.0*(b_max - b_min)/T

    #linear coefficients
    lin1 = b_min
    lin2 = 3.0*b_max - 2.0*b_min

    if (0.0 <= t % T && t % T < T/4.0)
        b = ang*(t % T)  + lin1
    end
    
    if (T/4.0 <= t % T && t % T < T/2.0)
        b = b_max 
    end

    if (T/2.0 <= t % T && t % T < 3.0*T/4.0)
        b = lin2 - ang*(t % T)  
    end
    
    if (3.0*T/4.0 <= t % T && t % T < T)
        b = b_min 
    end
    
    return b
end