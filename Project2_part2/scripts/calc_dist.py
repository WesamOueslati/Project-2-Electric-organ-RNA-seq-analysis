#!/usr/bin/env python

import argparse
import gzip
import pickle
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument("-f", "--file")
args = parser.parse_args()

f = args.file

with gzip.open(f, 'rt') as fh:
    l_dist = {}
    i = 0
    for line in fh:
        if i%4 == 1:
            line = line.strip('\n')
            l = len(line)
            if l in l_dist:
                l_dist[l] += 1
            else:
                l_dist[l] = 1
        i += 1

print(sum(l_dist.values()))

f_name = Path(f).stem
output_file = f"../distributions/{f_name}.length_dist.pkl"
with open(output_file, 'wb') as fh:
    pickle.dump(l_dist, fh)