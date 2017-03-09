import numpy as np
import matplotlib.pylab as plt
import math

x = np.linspace(-10,10,1000)

y = 1 / (1 + math.e ** (-x))


plt.plot(x,y)
plt.xlabel('x')
plt.ylabel('y')
plt.title('sigmoid Function')
plt.grid()
plt.savefig("2.png")



plt.show()