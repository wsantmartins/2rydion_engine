from qutip import*
from operators import*
from H1_coeff import*
from H2_coeff import*
from H3_coeff_ryd import*
from H4_coeff_ryd import*

domain = 1000
npts = 10000

dv = 0.1
r0 = 0.1
omega = 1.0
delta = 1.0
gamma = 1.0

H0 = np.sqrt(3.0)*omega*(x**2.0 + p**2.0) +  delta*(n1 + n2) 
H1 = sx1 + sx2
H2 = n1*n2
H3 = -dv*r0*x*n1*n2
H4 = dv*(dv + 1.0)*(r0**2.0)*(x**2.0)*n1*n2

H = [H0, [H1, H1_coeff], [H2, H2_coeff], [H3, H3_coeff_ryd], [H4, H4_coeff_ryd]]