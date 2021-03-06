#!/bin/bash

#noisy
set -x

#log the path
echo $PATH

#log node version
node -v

# install fonts
cp ./src/data/fonts/*.ttf /usr/local/share/fonts
cp ./src/data/fonts/*.otf /usr/local/share/fonts

# update repo
git pull

# install dependencies
npm install --production

# libssl_conf.so workaround (see https://stackoverflow.com/questions/53355217/genymotion-throws-libssl-conf-so-cannot-open-shared-object-file-no-such-file-o)
export OPENSSL_CONF=/etc/ssl/

# tweet

if
  [ -z "$2" ]
then 
  # tweet random headline
  echo "generating random headline"
  node mtgnews --tweet --discord
else
  # tweet specified headline
  echo "generating headline with origin \"#$2#\""  
  node mtgnews --tweet --discord -o "#$2#"
fi

#silent
set +x
