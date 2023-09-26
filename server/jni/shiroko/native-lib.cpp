#include <jni.h>
#include <string>
#include "global.h"
#include "main.h"

extern "C" JNIEXPORT jint JNICALL
Java_shiroko_Main_cppMain(JNIEnv *env, jclass clazz, jobjectArray args)
{
    JNIEnv *GLOBAL_JNI = env;
    int argc = env->GetArrayLength(args);
    const char **argv = new const char *[argc];

    for (int i = 0; i < argc; i++)
    {
        jstring string = (jstring)env->GetObjectArrayElement(args, i);
        const char *rawString = env->GetStringUTFChars(string, 0);
        argv[i] = rawString; // Note: Not using strdup here
    }

    // Now, call the main function:
    int exitcode = main(argc, argv);

    // Clean up:
    for (int i = 0; i < argc; i++)
    {
        env->ReleaseStringUTFChars((jstring)env->GetObjectArrayElement(args, i), argv[i]);
    }
    delete[] argv;
    return static_cast<jint>(exitcode);
}