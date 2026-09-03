#!/usr/bin/env python
import argparse
import pickle
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

parser = argparse.ArgumentParser()
parser.add_argument("-f", "--forward")
parser.add_argument("-r", "--reverse")
args = parser.parse_args()

f = args.forward
r = args.reverse

with open(f, 'rb') as r1, open(r, 'rb') as r2:
    r1_dist = pickle.load(r1)
    r2_dist = pickle.load(r2)
    
bar1 = plt.bar(r1_dist.keys(), r1_dist.values(), label = "Read 1", color='0')
bar2 = plt.bar(r2_dist.keys(), r2_dist.values(), label = "Read 2", color='0.8', alpha=0.7)
plt.yscale("log")
plt.title("Distribution of Read Lengths")
plt.xlabel("Read Length")
plt.ylabel("Frequency")
plt.legend()
plt.savefig("../distributions/SRR25630394.png")
