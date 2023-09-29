#!/usr/bin/env sh
adb push ./build/shiroko /data/local/tmp

cmd="CLASSPATH=/data/local/tmp/shiroko app_process /system/bin icu.humxc.shiroko.Main"
adb shell "$cmd" "$@"