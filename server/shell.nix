# 不建议在 Android studio 里使用此 nix 环境
# 此环境可以在命令行中使用

{ pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
    config.android_sdk.accept_license = true;
  }
}:
let
  ndkVersions = "25.1.8937393";
  # 对应 ./launcher/app/build.gredle 中 android.defaultConfig 的 minSdk 和 targetSdk
  minSdk = "21";
  targetSdk = "33";
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    toolsVersion = "26.1.1";
    platformToolsVersion = "33.0.3";
    buildToolsVersions = [ "30.0.3" ];
    includeEmulator = false;
    platformVersions = [ minSdk targetSdk ];
    includeSources = false;
    includeSystemImages = false;
    cmakeVersions = [ "3.22.1" ];
    includeNDK = true;
    ndkVersions = [ ndkVersions ];
    useGoogleAPIs = false;
    useGoogleTVAddOns = false;
    includeExtras = [
      "extras;google;gcm"
    ];
  };
in
(pkgs.buildFHSUserEnv {
  name = "android-sdk-env";
  targetPkgs = pkgs: (with pkgs;
    [
      glibc
      jdk17
      zlib
    ]) ++ [ androidComposition.androidsdk ];
  runScript = "bash";
  profile =
    ''
      export ANDROID_HOME=${androidComposition.androidsdk}/libexec/android-sdk
      export NDK_DIR=$ANDROID_HOME/ndk/${ndkVersions}
      
      export PREBUILT=$NDK_DIR/toolchains/llvm/prebuilt/linux-x86_64/
      
      export PATH=$PATH:$ANDROID_HOME/ndk/${ndkVersions}
      export PATH=$PATH:$ANDROID_HOME/tools
      export PATH=$PATH:$ANDROID_HOME/tools/bin
      export PATH=$PATH:$ANDROID_HOME/platform-tools
      export PATH=$PATH:$PREBUILT/linux-x86_64/bin/
      
      echo ANDROID_HOME: $ANDROID_HOME
    '';
}).env

#   pkgs.mkShell
# {
#   buildInputs = [
#     androidComposition.androidsdk
#     pkgs.glibc
#     pkgs.android-studio
#     pkgs.cmake
#   ];
#   shellHook = ''
#     export ANDROID_HOME=${androidComposition.androidsdk}/libexec/android-sdk
#     echo ANDROID_HOME: $ANDROID_HOME

#     export SYSROOT=$ANDROID_HOME/ndk/${ndkVersions}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/
#     echo SYSROOT: $SYSROOT

#     export PATH=$PATH:$ANDROID_HOME/ndk/${ndkVersions}
#     export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
#     export CFLAGS="I$SYSROOT/usr/include"
#     export LDFLAGS="-L$SYSROOT/usr/lib -lz"

#   '';
# }
