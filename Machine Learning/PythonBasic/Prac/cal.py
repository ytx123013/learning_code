#coding=utf-8
import numpy as np
from scipy.special import comb

def binomial_distribution(n,k,p):
    return comb(n,k) * p**k * (1-p) **(n-k)

def cal_probability(n,p):
    s = 0.0
    for i in range(n/2+1,n+1):
        s += binomial_distribution(n,i,p)
    return s


p = 0.6

total_count = [10,20,30,40,50]

for i in total_count:
    print '%d 次 :' % i, '为 %f' %cal_probability(i,p)


print comb(2,1,0.6)* 0.6 * 0.4
