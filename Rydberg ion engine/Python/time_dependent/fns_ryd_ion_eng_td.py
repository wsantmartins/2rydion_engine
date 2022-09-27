from operators import*
#from H_rab_det import*
from H_rab_ryd import*
#from H_rab_trap import*
from qutip import*
import numpy as np
import matplotlib.pyplot as plt

psi0 = tensor(basis(N, 0), basis(2, 0), basis(2, 0))
tspan = np.linspace(0, domain, npts)

result = mesolve(H, psi0, tspan, [np.sqrt(gamma)*sm1, np.sqrt(gamma)*sm2], 
[x, x**2, p, p**2, sx1, sy1, sz1], args={'max_value1': 2, 'min_value1': 0, 'period1': 20.0*np.pi, 'max_value2': 2, 'min_value2': 0, 'period2': 20.0*np.pi})


x_exp = result.expect[0]
x2_exp = result.expect[1]
p_exp = result.expect[2]
p2_exp = result.expect[3]
sx1_exp = result.expect[4]
sy1_exp = result.expect[5]
sz1_exp = result.expect[6]

plt.plot(tspan, sy1_exp)
plt.show()

np.savetxt('C:\\Users\\admin\\Dropbox\\Academia\\PhD\\Codes\\Rydberg ion engine\\Python\\time_dependent\\data\\x_op', np.c_[tspan, x_exp])
np.savetxt('C:\\Users\\admin\\Dropbox\\Academia\\PhD\\Codes\\Rydberg ion engine\\Python\\time_dependent\\data\\x2_op', np.c_[tspan, x2_exp])
np.savetxt('C:\\Users\\admin\\Dropbox\\Academia\\PhD\\Codes\\Rydberg ion engine\\Python\\time_dependent\\data\\p_op', np.c_[tspan, p_exp])
np.savetxt('C:\\Users\\admin\\Dropbox\\Academia\\PhD\\Codes\\Rydberg ion engine\\Python\\time_dependent\\data\\p2_op', np.c_[tspan, p2_exp])
np.savetxt('C:\\Users\\admin\\Dropbox\\Academia\\PhD\\Codes\\Rydberg ion engine\\Python\\time_dependent\\data\\sx_op', np.c_[tspan, sx1_exp])
np.savetxt('C:\\Users\\admin\\Dropbox\\Academia\\PhD\\Codes\\Rydberg ion engine\\Python\\time_dependent\\data\\sy_op', np.c_[tspan, sy1_exp])
np.savetxt('C:\\Users\\admin\\Dropbox\\Academia\\PhD\\Codes\\Rydberg ion engine\\Python\\time_dependent\\data\\sz_op', np.c_[tspan, sz1_exp])
