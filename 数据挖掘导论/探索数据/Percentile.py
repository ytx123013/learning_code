import sys
sys.path.append('..')
from Iris.ReadData import irisData

import numpy as np
from pandas import Series,DataFrame
# print irisData

# np.percentile(irisData[1])
index = [0,10,20,30,40,50,60,70,80,90,100]
sepal_length_percent = np.percentile(irisData['sepal length'],index)
sepal_width_percent = np.percentile(irisData['sepal width'],index)
petal_length_percent = np.percentile(irisData['petal length'],index)
petal_width_percent = np.percentile(irisData['petal width'],index)

sepal_length_s = Series(sepal_length_percent,index=index)
sepal_width_s = Series(sepal_width_percent,index=index)
petal_length_s = Series(petal_length_percent,index=index)
petal_width_s = Series(petal_width_percent,index=index)

dic = {
    'sepal length':sepal_length_s,
    'sepal width':sepal_width_s,
    'petal length':petal_length_s,
    'petal width':petal_width_s
}
df = DataFrame(dic,columns=['sepal length','sepal width','petal length','petal width'])
df.index.name = 'per'
print df
