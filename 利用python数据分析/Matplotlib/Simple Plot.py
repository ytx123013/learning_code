#coding=utf-8
import matplotlib.pyplot as plt
import numpy as np
from numpy.random import randn

X = np.linspace(-np.pi,np.pi,256)
C,S = np.cos(X), np.sin(X)



#simple plot
#
plt.plot(X,C)
plt.plot(X,S)

# plt.show()

#
fig = plt.figure()
ax1 = fig.add_subplot(2,2,1)
ax2 = fig.add_subplot(2,2,2)
ax3 = fig.add_subplot(2,2,3)

ax2.scatter(np.arange(30), np.arange(30) + 3 * randn(30))

# 调整subplot间距离,wspace hspace用于控制宽度和高度的百分比
plt.subplots_adjust(wspace=0.2,hspace=0)
# plt.show()

#定义一个Figure
fig = plt.figure(figsize = (8,6), dpi = 80)
ax = fig.add_subplot(1,1,1)
# plt.subplot(1, 1, 1)
# 设置颜色和宽度和形态
plot1, =ax.plot(X,C,color = "blue", linewidth = 1.0, linestyle = "-")
plot2, =ax.plot(X, S, color="green", linewidth=2.0, linestyle="--")
# 设置x 轴范围上下限
ax.set_xlim(-4.0,4.0)
ax.set_ylim(-1.0,1.5)
# 显示指定x轴的值
ax.set_xticks(np.linspace(-np.pi,np.pi,3))
ax.set_yticks([-1,0,1])
# 设置x,y轴的名称
ax.set_xlabel('hehe')
ax.legend([plot1,plot2],["cos","sin"],loc='best')
# plt.show()

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

# plt.savefig("111.png", dpi = 72)

# plt.show()

# 标注
import pandas as pd
from pandas import DataFrame
from datetime import datetime
data = pd.read_csv('resources/spx.csv', index_col=0, parse_dates=True)
spx = data['SPX']
fig = plt.figure()
ax = fig.add_subplot(1,1,1)
spx.plot(ax=ax, style='k-')

crisis_data = [
    (datetime(2007, 10, 11), 'Peak of bull market'),
    (datetime(2008, 3, 12), 'Bear Stearns Fails'),
    (datetime(2008, 9, 15), 'Lehman Bankruptcy')
]

for date, label in crisis_data:
    ax.annotate(label, xy=(date, spx.asof(date) + 50),
                xytext=(date, spx.asof(date) + 200),
                arrowprops=dict(facecolor='black'),
                horizontalalignment='left', verticalalignment='top')

# Zoom in on 2007-2010
ax.set_xlim(['1/1/2007', '1/1/2011'])
ax.set_ylim([600, 1800])

ax.set_title('Important dates in 2008-2009 financial crisis')
plt.show()

