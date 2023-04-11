#!/bin/bash
set -e #exit from this script after error
DOMAIN_NAME=$1
if [ -z "$DOMAIN_NAME" ]; then
echo "The name domain is empty, please enter name for example.com"
exit 1
fi

IP_ADDRESS=$(nslookup $DOMAIN_NAME | awk '/^Address: / { print $2 }')
echo "<html><head><title>DNS Lookup Results</title></head><body>" > /usr/local/apache2/htdocs/index.html
echo "<h1>DNS Lookup Results for $DOMAIN_NAME</h1>" >> /usr/local/apache2/htdocs/index.html
echo "<p>IP Address: $IP_ADDRESS</p>" >> /usr/local/apache2/htdocs/index.html
echo "</body></html>" >> /usr/local/apache2/htdocs/index.html