#!/bin/bash

docker run -d -it --rm --name hometask-static -v $PWD:/mnt -p 8081:80 hometask-image:v1 /bin/sh &&
cat <<EOF | docker exec -i hometask-static sh 
rm /var/www/dynamic/index.php
cp /mnt/index.html /var/www/dynamic/index.html
/usr/sbin/apache2ctl restart
EOF
