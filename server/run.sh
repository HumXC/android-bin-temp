#!/usr/bin/env sh

cmd="LD_LIBRARY_PATH=/data/local/tmp/ CLASSPATH=/data/local/tmp/shiroko app_process /system/bin shiroko.Main"
adb shell $cmd "$@"
