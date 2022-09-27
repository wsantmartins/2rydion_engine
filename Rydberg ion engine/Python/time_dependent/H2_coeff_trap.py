import numpy as np
import matplotlib.pyplot as plt

def H2_coeff_trap(t, args):

    a_max = args['max_value2']
    a_min = args['min_value2']
    T = args['period2']

    #angular coefficient 
    ang = 4.0*(a_max - a_min)/T

    #linear coefficients
    lin1 = a_max - 2.0*a_min
    lin2 = 4.0*a_max - 3.0*a_min

    a1 = lambda t: (a_min)**2.0
    a2 = lambda t: (ang*((t + np.pi/2) % T)  - lin1)**2.0
    a3 = lambda t: (a_max)**2.0
    a4 = lambda t: (lin2 - ang*((t + np.pi/2) % T))**2.0

    return np.piecewise(t, [(0.0 <= (t + np.pi/2) % T)*((t + np.pi/2) % T < T/4.0),
    (T/4.0 <= (t + np.pi/2) % T)*((t + np.pi/2) % T < T/2.0),
    (T/2.0 <= (t + np.pi/2) % T)*((t + np.pi/2) % T < 3.0*T/4.0),
    (3.0*T/4.0 <= (t + np.pi/2) % T)*((t + np.pi/2) % T < T)],
    [a1, a2, a3, a4]) 