#coding=utf-8
from datetime import datetime
from datetime import timedelta
from dateutil import parser
from pandas import Series
from pandas import DataFrame
import pandas as pd
import numpy as np
from numpy.random import randn
import matplotlib.pyplot as plt

close_px_all = pd.read_csv('resources/stock_px.csv', parse_dates=True, index_col=0)
close_px_all.AAPL.plot()
pd.rolling_count(close_px_all.AAPL, 250).plot()
plt.show()