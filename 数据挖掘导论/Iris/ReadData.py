#coding=utf-8
import pandas as pd
import os,sys

print os.getcwd()

headerNames = ['sepal length','sepal width','petal length','petal width','class']
irisData = pd.read_csv('../Iris/data/iris.data',header=None,names=headerNames)

# irisData.columns = ['萼片长度','萼片宽度','花瓣长度','花瓣宽度','类型']

# print irisData