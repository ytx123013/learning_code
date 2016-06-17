import matplotlib.pyplot as plt
import numpy as np

n = 12
X = np.arange(n)
y1 = np.random.uniform(0.5,1.0,n)
y2 = np.random.uniform(0.5,1.0,n)

plt.bar(X,+y1, facecolor = 'blue',alpha = 0.5, edgecolor = 'white')
plt.bar(X,-y2, facecolor = 'red',alpha = 0.4, edgecolor = 'white')

for x, y in zip(X, y1):
    plt.text(x + 0.4, y + 0.05, '%.2f' % y, ha='center', va='bottom')


for x, y in zip(X, y2):
    plt.text(x + 0.4, -y - 0.05, '%.2f' % y, ha='center', va= 'top')

plt.ylim(-1.5,1.5)
plt.show()