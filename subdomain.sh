#!/bin/bash
read -p "enter domain name: " domain
if [ ! -d "$domain"  ]; then
        mkdir -p $domain
fi
assetfinder --subs-only $domain > $domain/output.txt
amass enum -silent -passive -norecursive -noalts -d $domain >>$domain/output_subs.txt
sublist3r -d $domain -o$domain/output_subs.txt
./findomain-linux -q -t $domain >> $domain/output_subs.txt
subfinder -silent -d $domain -o $domain/output_subs.txt
~/subbrute/./subbrute.py $domain >> $domain/output_subs.txt
cat $domain/output.txt  | sort -u | wc  -l
