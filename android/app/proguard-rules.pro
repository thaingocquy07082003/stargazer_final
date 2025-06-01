-keep class org.tensorflow.** { *; }
-keep class org.tensorflow.** { *; }
-keep class org.tensorflow.**$* { *; }
-keep class org.tensorflow.lite.annotations.UsedByReflection
-keep @org.tensorflow.lite.annotations.UsedByReflection class *
-keepclassmembers class * {
    @org.tensorflow.lite.annotations.UsedByReflection *;
}
-dontwarn org.tensorflow.lite.gpu.GpuDelegateFactory$Options
-dontwarn org.tensorflow.lite.gpu.GpuDelegateFactory$Options$GpuBackend