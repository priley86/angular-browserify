#!/usr/bin/env bash

# This script continuously browserifies the client side JavaScript, same as the
# Gulp build would do. It gives faster turnaround times than a full Gulp
# build. It does not execute JSHint or minification, just the browserify stuff.
# Using this script only makes sense when index.html references the non-minified
# build (that is, dist/myapp.js, not dist/myapp.min.js).

# This script assumes that watchify is installed globally. To do that execute
# npm install -g watchify

# The watchify process is started in the background. Use
# pkill -f watchify or pkill -f "node.*watchify"
# to stop them.

bin_path=`dirname $0`
pushd $bin_path/.. > /dev/null
mkdir app/dist

watchify \
  --entry app/js/app.js \
  --outfile app/dist/app.js \
  --debug \
  --verbose \
  &

popd > /dev/null