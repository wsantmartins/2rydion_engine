import numpy as np
import matplotlib.pyplot as plt

def H1_coeff(t, args):

    a_max = args['max_value1']
    a_min = args['min_value1']
    T = args['period1']
    
    #angular coefficient 
    ang = 4.0*(a_max - a_min)/T

    #linear coefficients
    lin1 = a_max - 2.0*a_min
    lin2 = 4.0*a_max - 3.0*a_min

    a1 = lambda t: a_min
    a2 = lambda t: ang*(t % T)  - lin1
    a3 = lambda t: a_max
    a4 = lambda t: lin2 - ang*(t % T)

    return np.piecewise(t, [(0.0 <= t % T)*(t % T < T/4.0),
    (T/4.0 <= t % T)*(t % T < T/2.0),
    (T/2.0 <= t % T)*(t % T < 3.0*T/4.0),
    (3.0*T/4.0 <= t % T)*(t % T < T)],
    [a1, a2, a3, a4]) 
