#!/bin/bash

PLUGIN_NAME="enemy-names"

cd scripting
spcomp $PLUGIN_NAME.sp -i include -o ../plugins/$PLUGIN_NAME.smx
