#!/bin/bash
#!/bin/bash

# Define target domain and output files
TARGET_DOMAIN="example.com"
SUBDOMAINS_FILE="subdomains.txt"
WAYBACKURLS_FILE="waybackurls.txt"

# Use waybackurls to extract JS and JSON files of target domain
cat $SUBDOMAINS_FILE | while read subdomain; do
    echo "Extracting URLs for subdomain $subdomain"
    waybackurls $subdomain.$TARGET_DOMAIN | grep -iE "\.js$|\.json$" >> $WAYBACKURLS_FILE
done
Ss

# Define proxy settings
PROXY_HOST="127.0.0.1"
PROXY_PORT="8080"
export http_proxy="http://$PROXY_HOST:$PROXY_PORT"
export https_proxy="https://$PROXY_HOST:$PROXY_PORT"
Ssss
for i in $(cat waybackurls.txt); do
    curl -k -x "127.0.0.1:8080" $i
done
