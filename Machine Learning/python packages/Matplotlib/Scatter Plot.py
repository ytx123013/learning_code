import matplotlib.pyplot as plt
import numpy as np

n = 1024
x = np.random.normal(0,1,n)
y = np.random.normal(0,1,n)

color = np.arctan2(y,x)

plt.xlim(-2.0,2.0)
plt.ylim(-2.0,2.0)
plt.scatter(x,y,c=color,alpha =.5)

plt.show()