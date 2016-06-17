#coding=utf-8
import pandas as pd
import numpy as np
from pandas import DataFrame
from pandas import Series
import re
import json
db = json.load(open('rcs/foods-2011-10-03.json'))
# print db
nutrients = DataFrame(db[0]['nutrients'])
print nutrients