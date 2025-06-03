import time
import pandas as pd
import numpy as np
import json
from collections import defaultdict

def generate_json(mapper,output_file_path=None,suffix=''):
    isNull_flag = False
    isUnique_flag = False
    if len(list(mapper['isNull'].unique()))==2:
        isNull_flag = True
    if len(list(mapper['isUnique_flag'].unique()))==2:
        isUnique_flag= True
        
    def gen_row(row,isNull_flag,isUnique_flag):
        row_isNull = ''
        row_isUnique =''
        
        if isNull_flag:
            