#coding=utf-8
import matplotlib.pyplot as plt
import numpy as np

X = np.linspace(-np.pi,np.pi,256)
C,S = np.cos(X), np.sin(X)


#simple plot
#
# plt.plot(X,C)
# plt.plot(X,S)

# plt.show()

#定义一个图片
plt.figure(figsize = (8,6), dpi = 80)
# plt.subplot(1, 1, 1)
# 设置颜色和宽度
plot1, = plt.plot(X,C,color = "blue", linewidth = 1.0, linestyle = "-")
plot2, = plt.plot(X, S, color="green", linewidth=1.0, linestyle="-")
# 设置x 轴范围上下限
plt.xlim(-4.0,4.0)
plt.ylim(-1.0,1.5)
# 显示指定x轴的值
plt.xticks(np.linspace(-np.pi,np.pi,3))
plt.yticks([-1,0,1])

# get current axis
ax = plt.gca()
# 设置边界线颜色
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
# 将下边界横线移动到y = 0 处
ax.xaxis.set_ticks_position('bottom')
ax.spines['bottom'].set_position(('data',0))
# ax.yaxis.set_ticks_position('right')
# ax.spines['right'].set_position(('data',1))
# 将左边界线移动到x = 0处
ax.yaxis.set_ticks_position('left')
ax.spines['left'].set_position(('data',0))

# 添加每条线的说明
plt.legend([plot1,plot2],["cos","sin"],loc='upper left')




t = 2
# 绘制一条从 (t,0)到(t,cos(t))的对准线
plt.plot([t,t],[0,np.cos(t)],color='blue', linewidth=1.5, linestyle="--")
# 在2,cos(2)添加两个点
plt.scatter([t,],[np.cos(t),])
# 注释点
plt.annotate('cos(%s)=%s'%(t,np.cos(t)),xy = (t,np.cos(t)),xytext=(-100, -50),xycoords='data',textcoords='offset points',arrowprops=dict(arrowstyle="->", connectionstyle="arc3,rad=.2"))

# 设置x轴和y轴值显示的属性
for label in ax.get_xticklabels() + ax.get_yticklabels():
    label.set_fontsize(16)
    label.set_bbox(dict(facecolor='white', edgecolor='None', alpha=0.65 ))

plt.savefig("111.png", dpi = 72)

plt.show()