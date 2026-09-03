#!/usr/bin/env python

def extract_mapping(sam_file):
    mapping = {"mapped": 0, "unmapped": 0}
    with open(sam_file, 'r') as sam:
        for line in sam:
            if line.startswith('@'):
                continue
            cols = line.split('\t')
            flag = int(cols[1])
            if (flag & 256) == 256:
                continue
            if (flag & 4) != 4:
                mapping["mapped"] += 1
            else:
                mapping["unmapped"] += 1
    return mapping


if __name__ == "__main__":
    # SAM_FILE_PATH = '/projects/bgmp/oueslati/bioinfo/Bi621/PS/WesamOueslati-Bi621-PS8/alignment/zebraf_alignmentAligned.out.sam'
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('-f', '--file', help='input file path')
    args = parser.parse_args()

    file = args.file
    mapping = extract_mapping(file)
    print(mapping)