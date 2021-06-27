#! /usr/bin/env python3
#! /usr/bin python3

import csv
import re

def substitude(str):
    p = re.compile(r'[?]')
    m = re.findall(p, str)
    print(m)

    subs = re.split(p, str)
    print(" ".join(subs))
    return re.sub(p, "\'\'", str)


with open(r'./dbbrain_slow.csv','r',encoding="gbk") as f:
    reader = csv.reader(f)
    headers = next(reader)
    index = 0
    for row in reader:
        index += 1
        with open(r'./dbbrain{}.txt'.format(index),'w') as f1:
            f1.write(substitude(row[0]))
            f1.close()
    f.close()






