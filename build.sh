#!/bin/bash

PLUGIN_NAME="enemy-names"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
