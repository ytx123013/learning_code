import random


input_data = range(0,100,1)
random.shuffle(input_data)
print input_data

def swap(a,b):
    return b,a

def selectedSort(input_data):
    input_length = len(input_data)
    for i in range(0,input_length):
        min_index = i
        for j in range(i+1,input_length):
            if input_data[j] < input_data[min_index]:
                min_index = j
        input_data[i],input_data[min_index] = swap(input_data[i],input_data[min_index])

selectedSort(input_data)

print input_data