import pandas as pd

headerNames = ['sepal length','sepal width','petal length','petal width','class']
irisData = pd.read_csv('data/iris.data',header=None,names=headerNames)
