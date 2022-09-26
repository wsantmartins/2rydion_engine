from parameters import*
from qutip import*
import numpy as np
import matplotlib.pyplot as plt

#annihilation and creation operators
a = destroy(N)
x = tensor(position(N), qeye(2), qeye(2))
p = tensor(momentum(N), qeye(2), qeye(2))

#Pauli matrices
sx1 = tensor(qeye(N), sigmax(), qeye(2))
sx2 = tensor(qeye(N), qeye(2), sigmax())
sy1 = tensor(qeye(N), sigmay(), qeye(2))
sy2 = tensor(qeye(N), qeye(2), sigmay())
sz1 = tensor(qeye(N), sigmaz(), qeye(2))
sz2 = tensor(qeye(N), qeye(2), sigmaz())
sp1 = tensor(qeye(N), sigmap(), qeye(2))
sp2 = tensor(qeye(N), qeye(2), sigmap())
sm1 = tensor(qeye(N), sigmam(), qeye(2))
sm2 = tensor(qeye(N), qeye(2), sigmam())
n1 = tensor(qeye(N), basis(2,0)*basis(2,0).dag(), qeye(2))
n2 = tensor(qeye(N), qeye(2), basis(2,0)*basis(2,0).dag())


H = np.sqrt(3.0)*omega*(x**2.0 + p**2.0) + (k0 - k1*x + k2*x**2.0)*n1*n2 + bigomega*(sx1 + sx2) + delta*(n1 + n2)
psi0 = tensor(basis(N, 0), basis(2, 0), basis(2, 0))
tspan = np.linspace(0, 1000, 100000)
result = mesolve(H, psi0, tspan, [np.sqrt(gamma)*sm1, np.sqrt(gamma)*sm2], [x, p, sx1, sy1, sz1])
#print(result.expect)
#fig, ax = plt.subplots()
#ax.plot(result.times, result.expect[0])
#ax.plot(result.times, result.expect[1])
#plt.show()
x_exp = result.expect[0]
p_exp = result.expect[1]
sx1_exp = result.expect[2]
sy1_exp = result.expect[3]
sz1_exp = result.expect[4]

plt.plot(tspan, sy1_exp)
plt.show()

np.savetxt('C:\\Users\\admin\\Dropbox\\Academia\\PhD\\Codes\\Rydberg ion engine\\Python\\x_op', np.c_[tspan, x_exp])

