#！/usr/bin/env sh

# 获取脚本所在的目录
work_dir="$(dirname "$(realpath "$0")")"

[ ! -d "$work_dir"/build ] && mkdir "$work_dir"/build


rm -r "$work_dir"/app/build


"$work_dir"/gradlew build -p "$work_dir"

shiroko=$work_dir/build/shiroko
# shellcheck disable=SC2086
[ -e "$shiroko" ] && rm $shiroko

cp "$work_dir"/app/build/outputs/apk/release/app-release-unsigned.apk "$shiroko"

rm -r "$work_dir"/app/build
rm -r "$work_dir"/.gradle