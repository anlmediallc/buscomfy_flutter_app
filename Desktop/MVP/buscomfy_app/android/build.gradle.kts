buildscript {
    repositories {
        google()
        mavenCentral()
        jcenter() // Optional: some libraries still need it
        maven {
            url = uri("https://storage.googleapis.com/download.flutter.io")
            metadataSources {
                mavenPom()
                artifact()
            }
        }
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.1.1")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
        jcenter()
        maven {
            url = uri("https://storage.googleapis.com/download.flutter.io")
            metadataSources {
                mavenPom()
                artifact()
            }
        }
    }
}
