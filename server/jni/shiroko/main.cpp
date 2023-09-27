#include "main.h"
#include "global.h"

#include <android/log.h>
#include <iostream>
#define LOG_TAG "Shiroko"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
int main(int argc, char const *argv[])
{
    LOGI("Hello World!");

    std::cout << "Hello World!";
    for (int i = 0; i < argc; ++i)
    {
        std::cout << argv[i] << " ";
    }
    std::cout << GLOBAL_JNI;
    std::cout << std::endl;

    return 0;
}
