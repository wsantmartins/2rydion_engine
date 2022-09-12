import numpy as np 
import matplotlib.pyplot as plt
from qutip import*
plt.plot([1,np.sqrt(2),3,4,5])
plt.show()
print(basis(2,0)*basis(2,0).dag()+basis(2,1)*basis(2,1).dag()+sigmay())