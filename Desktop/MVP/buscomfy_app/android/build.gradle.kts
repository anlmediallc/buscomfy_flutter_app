plugins {
    id("com.android.application")
    kotlin("android")
}

android {
    namespace = "com.yourcompany.buscomfy"
    compileSdk = 33

    defaultConfig {
        applicationId = "com.yourcompany.buscomfy"
        minSdk = 21
        targetSdk = 33
        versionCode = 1
        versionName = "1.0"
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
}
buildscript {
    repositories {
        google()
        mavenCentral()
        jcenter()  // ✅ Add this line if it's missing
        maven { url "https://storage.googleapis.com/download.flutter.io" }
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:8.1.1' // or your version
    }
maven {
    url "https://storage.googleapis.com/download.flutter.io"
    metadataSources {
        mavenPom()
        artifact()
    }
}



}

allprojects {
    repositories {
        google()
        mavenCentral()
        jcenter()  // ✅ Add this line if it's missing
        maven { url "https://storage.googleapis.com/download.flutter.io" }
    }
}
