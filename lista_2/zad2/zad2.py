import matplotlib.pyplot as plt
import numpy as np

x = np.arange(0.0, 40, 0.1)

plt.plot(x, np.exp(x)*np.log(1+np.exp(-x)))
plt.show()
