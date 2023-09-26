#!/usr/bin/env sh
ABI="arm64-v8a"
DIST_DIR="/data/local/tmp"
adb push ./build/libs/$ABI/libshiroko.so $DIST_DIR
adb push ./build/shiroko $DIST_DIR
