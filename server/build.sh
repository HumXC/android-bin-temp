#!/usr/bin/env sh

# 获取脚本所在的目录
work_dir="$(dirname "$(realpath "$0")")"

[ ! -d $work_dir/build ] && mkdir $work_dir/build

NDK_PROJECT_PATH=$work_dir ndk-build

rm -r $work_dir/build/libs
rm -r $work_dir/obj
mv -f $work_dir/libs $work_dir/build/

launcher_dir=$work_dir/launcher

$launcher_dir/gradlew build -p $launcher_dir

shiroko=$work_dir/build/shiroko
[ -e $shiroko ] && rm $shiroko

cp $launcher_dir/app/build/outputs/apk/release/app-release-unsigned.apk $shiroko

rm -r $launcher_dir/app/build
rm -r $launcher_dir/.gradle
