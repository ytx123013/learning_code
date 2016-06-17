#coding=utf-8
from datetime import datetime
from datetime import timedelta
from dateutil import parser
import pandas as pd

now = datetime.now()
# print now
# print now.year,now.month,now.day,now.hour,now.minute

date = datetime(2012,8,4)
# print date

delta = datetime(2011,1,7) - datetime(2000,1,1)
# print delta

date1 = date + timedelta(days=2)
# print date1

# 日期字符串化
time = datetime(2100,1,1)
str_time = str(time)
# print str_time
format_time = time.strftime('%Y/%m/%d')
# print format_time

# 字符串转日期
value = '2020-3-1'
date = datetime.strptime(value,'%Y-%m-%d')
# print date

# print parser.parse('Jan 30,1991')

# pd 的to_datetime
time = pd.to_datetime(value)
# print time