plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")

}

android {
    namespace = "icu.humxc.shiroko"
    compileSdk = 34

    defaultConfig {
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        // If you want to uncomment and use externalNativeBuild in the future
        // externalNativeBuild {
        //     cmake {
        //         cppFlags("-std=c++20")
        //     }
        // }
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    // If you want to uncomment and use externalNativeBuild in the future
    // externalNativeBuild {
    //     cmake {
    //         path = "src/main/cpp/CMakeLists.txt"
    //         version = "3.22.1"
    //     }
    // }

    buildFeatures {
        viewBinding = true
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.12.0")
}
