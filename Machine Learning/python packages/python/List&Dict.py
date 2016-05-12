list1 = [1,'a',333,'bcd']

list1[0] = 2

del list1[1]

len = len(list1)

list1.append('6666')
print list1

dic1 = {}

dic1['aaa'] = 'aaa'
dic1['bbb'] = 'bbb'

print dic1

for (k,v) in dic1.items():
	print k + " = " + v