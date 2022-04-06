#!/bin/bash

if [ -e $@ ]; then
  echo "Usage:"
  echo ""
  echo "  remote-compile.sh <@drush-alias>"
  echo ""
  exit 1
fi

echo "Compiling rdkafka.so..."
drush $@ ssh "rm -rf /tmp/acquia-php-rdkafka"
drush $@ ssh "git clone https://github.com/sreenivasulu-paruchuri/acquia-php-rdkafka.git /tmp/acquia-php-rdkafka"
drush $@ ssh "make -C /tmp/acquia-php-rdkafka clean"
drush $@ ssh "make -C /tmp/acquia-php-rdkafka"

echo "Downloading rdkafka.so..."
drush $@ ssh "cat /tmp/acquia-php-rdkafka/dist/rdkafka.so" > rdkafka.so

echo "Cleaning up..."
drush $@ ssh "rm -rf /tmp/acquia-php-rdkafka"

echo "Done!"
