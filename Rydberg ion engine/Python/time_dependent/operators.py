from qutip import*
#Hilbert space truncated to 10 bosons
N = 10 

#annihilation and creation operators
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