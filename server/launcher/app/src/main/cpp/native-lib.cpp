#include <jni.h>
extern "C" JNIEXPORT jint JNICALL
Java_shiroko_Main_cppMain(JNIEnv *env, jclass clazz, jobjectArray args)
{
    // 只用于占位
    // 在 build.gradle 中已经注释了 cpp 相关的内容，cpp 的部分由动态库提供
    return 0;
}