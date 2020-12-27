# subdomains
wraps 6 domaiin enumeration tools togehter
- ofcourse u need to have all the tools installed 
- install sublist3r via apt-get 
other tricks to get subdomians
- using curl 
curl -fsSL "https://crt.sh/?CN=%25.safaricom.co.ke&exclude=expired" | pup 'td :contains(".safaricom.co.ke") text{}' | sort -n | uniq -c | sort -rn | column -t | awk '{ print $2}'
note u need to have pup installed
- install pup from https://github.com/ericchiang/pup
other tools turbolist3r , fierce 
