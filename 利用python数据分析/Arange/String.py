#coding=utf-8
import pandas as pd
import numpy as np
from pandas import DataFrame
from pandas import Series
import re

# 拆分
val = 'a,b,   gehe'
a = [x.strip() for x in val.split(',')]
# print a

# 是否包含一个字符串
a = 'eh' in val
# print a

# 查询字符串第一次出现的位置
b = val.find('ge')
# print b

# 返回字串出现的次数
c = val.count('e')
# print c

# 替换
a = val.replace(',','33')
# print a
# 删除
b = val.replace('e','')
# print b

# 正则表达式
# 一个或多个空白'\s+'
a = 'aaaa   c  ,  v  dddd   aaa    '
b = re.split('\s+',a)
# print b

# 返回所有匹配住的匹配项
regex = re.compile('\s+')
b = regex.findall(a)
# print b

# 返回第一个匹配住的匹配项
text = """Dave dave@google.com
Steve steve@gmail.com
Rob rob@gmail.com
Ryan ryan@yahoo.com
"""
pattern = r'[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}'
# 对大小写不敏感
regex = re.compile(pattern,flags=re.IGNORECASE)
# 返回所有匹配项
a = regex.findall(text)
# print a
# 返回第一个匹配项
b = regex.search(text)
# print text[b.start():b.end()]


# 直接对Series中字符串截取
data = {'Dave': 'dave@google.com', 'Steve': 'steve@gmail.com',
        'Rob': 'rob@gmail.com', 'Wes': np.nan}
data = Series(data)
print data.str[0:5]