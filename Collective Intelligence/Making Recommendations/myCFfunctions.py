#coding=utf-8
from math import sqrt

# 计算两个users/items的皮尔逊系数
def Pearson_Correlation_Coefficient(info_list01,info_list02):
	if len(info_list01) != len(info_list02):
		print 'length not equal'
		return

	len_of_info = len(info_list01)
	sum_01 = sum([item for item in info_list01])
	sum_02 = sum([item for item in info_list02])
	# 乘积之和
	pSum = sum([info_list01[index]*info_list02[index] for index in range(0,len_of_info)])

	sqSum_01 = sum([pow(info_list01[index],2) for index in range(0,len_of_info)])
	sqSum_02 = sum([pow(info_list02[index],2) for index in range(0,len_of_info)])
	sumSq_01 = pow(sum_01,2)
	sumSq_02 = pow(sum_02,2)

	top = len_of_info * pSum - sum_01 * sum_02
	down = sqrt(len_of_info * sqSum_01 - sumSq_01) * sqrt(len_of_info * sqSum_02 - sumSq_02)
	coefficient = top/down
	return coefficient