#协同过滤
[维基百科](https://en.wikipedia.org/wiki/Collaborative_filtering)里写的很清楚，不过有些专业术语看不懂  
也可以参考这篇文章[基于物品的协同过滤推荐算法——读“Item-Based Collaborative Filtering Recommendation Algorithms”](http://blog.csdn.net/huagong_adu/article/details/7362908)  
***
下面是我自己的一些总结  
协同过滤，就是根据与目标用相同爱好或者经验什么的群体，来给目标推荐信息。

##类型
***
* ###Memory-based  
	&emsp;&emsp;&nbsp;这种是根据用户的打分来计算用户/商品的相似度，主要用来进行推荐功能。最常见的例子是neighbourhood-based CF和item-based/user-based top-N recommendations  
	&emsp;&emsp;&nbsp;neighbourhood-based CF会先计算出目标用户/商品与其它的相似度，并根据所有的其它用户/商品的评分根据相似度加权算出平均数来给目标用户提供推荐。  
	&emsp;&emsp;&nbsp;计算商品/用户间的相似度计算一般使用Pearson Correlation和Vector Cosine。
	&emsp;&emsp;&nbsp;user-based top-N会用similarity-based vector model去标示与目标用户最相似的k个用户，在用这些用户的user-item matrices去标注出要推荐的一些列物品。  
	&emsp;&emsp;&nbsp;一般用的最多找寻相似的用户的算法是Locality-sensitive hashing。
<!--	计算users/items之间的相似性是这种类型的重要的一部分，现在用来计算的较多的算法是Pearson Correlation Coefficient、Cosine-based Similarity、Adjusted Cosine Similarity。
	此类型又可以分为以下两个字类型：
	1. User-based 
		此类型过程一般都是先收集目标的兴趣信息。  
		然后用上面说的算法找出与目标相似度较高的k个users/items。  
		最后会根据上一步产生的数据集合对目标进行预测并产生推荐结果。(taking the weighted average of all the rating)			
	2. Item-based  
		此类型过程-->
		

***
* ###Model-based

***
* ###Hybid


