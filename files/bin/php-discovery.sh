#!/bin/bash

for file in $(find /etc/php-fpm.d/ -type f -name '*.conf'); do
   for pool in $(perl -n -e'/^\[(.+)\]$/ && print "$1\n"' $file); do
      list="$list,"'{"{#POOL}":"'$pool'"}'
   done
done

echo '{"data":['${list#,}' ]}'
