#!/bin/sh


cd etherpad-lite
#bin/run.sh --root

SCRIPTPATH=`pwd -P`
exec node "$SCRIPTPATH/node_modules/ep_etherpad-lite/node/server.js" $*
