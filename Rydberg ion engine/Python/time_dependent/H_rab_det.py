from qutip import*
from operators import*
from H1_coeff import*
from H2_coeff import*


domain = 1000
npts = 10000

dv = 0.1
r0 = 0.1
k0 = 1.0
k1 = dv*k0*r0
k2 = dv*(dv + 1)*k0*(r0**2)/2.0
omega = 1.0
bigomega = 1.0
delta = 1.0
gamma = 1.0

H0 = np.sqrt(3.0)*omega*(x**2.0 + p**2.0) + (k0 - k1*x + k2*x**2.0)*n1*n2
H1 = sx1 + sx2
H2 = n1 + n2
H = [H0, [H1, H1_coeff], [H2, H2_coeff]]