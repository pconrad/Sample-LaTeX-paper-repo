#!/bin/python
# bib2md converts a BibTeX file to a github style Markdown file
# Authors: Leif Dreizler and Phill Conrad, UCSB

import re

fileToRead = 'paper.bib'
fileToWrite = 'REFERENCES.md'

title = 'SBL_Paper\n=========\n\n'
header = 'start-of-references\n\n'
footer ='end-of-references\n'
delimiter = '---\n\n'
sentinels = ["author", "title", "booktitle", "url"]

def bibtoMD(read, write):
    with open(read,'r') as infile:
        with open(write,'w') as outfile:
            outfile.write(title+header)
            for line in infile:
                split = line.split('=',1)
                key = split[0].strip()
                
                if key in sentinels:
                    outfile.write(key.title() + ": ")
                
                elif line[0] =='}':
                    outfile.write(delimiter)
                    continue
                else:
                    continue

                value = split[1]
                outfile.write(re.sub('.*?{|}.*','',value) +'\n')
            outfile.write(footer)
bibtoMD(fileToRead, fileToWrite)
