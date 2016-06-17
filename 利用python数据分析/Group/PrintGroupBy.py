import numpy as np
from pandas import DataFrame

def print_groupyby_one(grouped):
    for name, group in grouped:
        print 'name :\n',name
        print 'data :\n',group

def print_groupyby_two(grouped):
    for (k1, k2), group in grouped:
        print 'name :\n',k1,' ',k2
        print 'data :\n',group
