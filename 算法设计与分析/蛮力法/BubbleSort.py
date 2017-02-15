import random


input_data = range(0,100,1)
random.shuffle(input_data)
print input_data

def swap(a,b):
    return b,a

def bubbleSort(input_data):
    length = len(input_data)
    for i in range(0,length-1):
        for j in range(0,length-1-i):
            if input_data[j] > input_data[j+1]:
                input_data[j],input_data[j+1] = swap(input_data[j],input_data[j+1])


bubbleSort(input_data)
print input_data