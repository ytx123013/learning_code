import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(-np.pi,np.pi,256)
y = np.sin(2*x)

plt.plot(x, y,color = 'blue', alpha = 1.0)
# plt.plot(x, y - 1)
plt.fill_between(x, y, color = 'blue', alpha = .25)
plt.xlim(-np.pi,np.pi)
plt.show()