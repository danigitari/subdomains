#!/bin/bash
mkdir $1;
cd $1;
echo -e "\e[1;34m gathering subdomains with findomain ....\e[0m"
findomain-linux -q -t $1 | sort -u > subdomains_$1.txt ;
echo -e "\e[1;34m gathering subdomains with subfinder ....\e[0m"
subfinder -silent -d $1 | sort -u > subdomains_$1.txt ;
echo -e "\e[1;34m gathering subdomains with amass ....\e[0m"
amass enum -d $1 | sort -u > subdomains_$1.txt ;
echo -e "\e[1;34m gathering subdomains with assetfinder ....\e[0m"
assetfinder --subs-only $1 | sort -u > subdomains_$1.txt;
echo -e "\e[1;34m gathering subdomains with crt.sh ....\e[0m"
curl https://crt.sh/?q=%.$1 | grep "$1" | cut -d '>' -f2 | cut -d '<' -f1 | grep -v " " | sort -u > subdomains_$1.txt
echo -e "\e[1;34m Probing subdomains with httprobe ....\e[0m"
cat subdomains_$1.txt | sort -u | httprobe -c 50 > hosts_$1.txt;
