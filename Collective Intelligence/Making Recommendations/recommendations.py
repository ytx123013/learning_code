#coding=utf-8  

critics={'Lisa Rose': {'Lady in the Water': 2.5, 'Snakes on a Plane': 3.5,
 'Just My Luck': 3.0, 'Superman Returns': 3.5, 'You, Me and Dupree': 2.5, 
 'The Night Listener': 3.0},
'Gene Seymour': {'Lady in the Water': 3.0, 'Snakes on a Plane': 3.5, 
 'Just My Luck': 1.5, 'Superman Returns': 5.0, 'The Night Listener': 3.0, 
 'You, Me and Dupree': 3.5}, 
'Michael Phillips': {'Lady in the Water': 2.5, 'Snakes on a Plane': 3.0,
 'Superman Returns': 3.5, 'The Night Listener': 4.0},
'Claudia Puig': {'Snakes on a Plane': 3.5, 'Just My Luck': 3.0,
 'The Night Listener': 4.5, 'Superman Returns': 4.0, 
 'You, Me and Dupree': 2.5},
'Mick LaSalle': {'Lady in the Water': 3.0, 'Snakes on a Plane': 4.0, 
 'Just My Luck': 2.0, 'Superman Returns': 3.0, 'The Night Listener': 3.0,
 'You, Me and Dupree': 2.0}, 
'Jack Matthews': {'Lady in the Water': 3.0, 'Snakes on a Plane': 4.0,
 'The Night Listener': 3.0, 'Superman Returns': 5.0, 'You, Me and Dupree': 3.5},
'Toby': {'Snakes on a Plane':4.5,'You, Me and Dupree':1.0,'Superman Returns':4.0}}

from math import sqrt

# 欧几里得距离
def Euclidean_Distance(prefs_data,person1,person2):
	sim = {}
	for movie in prefs_data[person1]:
		if movie in prefs_data[person2]:
			sim[movie] = 1
	if len(sim) == 0:
		return 0

	sum_of_distance = sum([pow(prefs_data[person1][movie] - prefs_data[person2][movie],2)
						for movie in sim])
	return 1/(1+sqrt(sum_of_distance))

# 计算两个人之间皮尔逊相关系数		
def Pearson_Correlation_Coefficient(prefs,p1,p2):
	si={}
	for item in prefs[p1]: 
		if item in prefs[p2]: 
			si[item]=1

	# if they are no ratings in common, return 0
	if len(si)==0: 
		return 0

	# Sum calculations
	n=len(si)

	# Sums of all the preferences
	sum1=sum([prefs[p1][it] for it in si])
	sum2=sum([prefs[p2][it] for it in si])

	# Sums of the squares
	sum1Sq=sum([pow(prefs[p1][it],2) for it in si])
	sum2Sq=sum([pow(prefs[p2][it],2) for it in si])	

	# Sum of the products
	pSum=sum([prefs[p1][it]*prefs[p2][it] for it in si])

	# Calculate r (Pearson score)
	num=pSum-(sum1*sum2/n)
	den=sqrt((sum1Sq-pow(sum1,2)/n)*(sum2Sq-pow(sum2,2)/n))
	if den==0: 
		return 0
	r=num/den
	return r

def topMatches(prefs_data,people,n = 5, similarity_func = Pearson_Correlation_Coefficient):
	scores = [(similarity_func(prefs_data,people,other),other) 
		for other in prefs_data if other != people]
	scores.sort()
	scores.reverse()
	return scores[0:n]

top = topMatches(critics,'Toby',n = 4)
print top

# 加权进行计算
def getRecommendations(prefs_data,person,similarity_func = Pearson_Correlation_Coefficient):
	# 每种item的评分总和
	totals = {}
	# 每种item相似度之和
	sim_sum = {}
	for other_person in prefs_data:
		# 排除自己
		if other_person != person:
			# 算出关联度
			sim = similarity_func(prefs_data,person,other_person)
			if sim <= 0:
				continue
			for item in prefs_data[other_person]:
				# 评价未看过的电影
				if item not in prefs_data[person]:
					totals.setdefault(item,0)
					# 评分＊相似系数
					totals[item] += prefs_data[other_person][item]*sim
					sim_sum.setdefault(item,0)
					sim_sum[item] += sim


	rankings = [(total/sim_sum[item],item) for item,total in totals.items()]
	rankings.sort()
	rankings.reverse()
	return rankings;

rank = getRecommendations(critics,'Toby')
print rank

# 将user和movie反转
def transformPrefs(prefs_data):
	result = {}
	for person in prefs_data:
		for item in prefs_data[person]:
			result.setdefault(item,{})
			result[item][person] = prefs_data[person][item]
	return result

result = transformPrefs(critics)
# print result

print getRecommendations(result,'Just My Luck')
# distance = Pearson_Correlation_Coefficient(critics,'Lisa Rose','Gene Seymour')
# print distance