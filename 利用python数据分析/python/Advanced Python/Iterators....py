#coding=utf-8
nums = [1,2,3,4,5,6,7]

# Iterator
iterator = iter(nums)
print next(iterator)
print next(iterator)

it = nums.__iter__()
print next(it)
print next(it)

re_it = nums.__reversed__()
print next(re_it)
print next(re_it)

print '--------generator expressions---------'
# Generator
gen = (i for i in nums)
print gen.next();
print gen.next();

list = [i for i in nums]
print list

set = {i for i in nums}
print set

dic = {i:i*2 for i in nums}
print dic

print '---------generator--------------------'
