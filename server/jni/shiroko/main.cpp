#include "main.h"
#include <android/log.h>
#include <iostream>
#define LOG_TAG "Shiroko"
#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, __VA_ARGS__)
int main(int argc, char const *argv[])
{
    std::cout << "Hello World!" << std::endl;
    LOGD("Hello World!");
    return 0;
}
