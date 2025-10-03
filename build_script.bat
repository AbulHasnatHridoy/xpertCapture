@echo off
REM Build Script for Mini SFA Login App (Windows)

echo 🚀 Building Mini SFA Login App...

REM Clean previous builds
echo 🧹 Cleaning previous builds...
flutter clean

REM Get dependencies
echo 📦 Getting dependencies...
flutter pub get

REM Build APK
echo 🏗️ Building release APK...
flutter build apk --release

REM Build App Bundle (for Play Store)
echo 📱 Building App Bundle...
flutter build appbundle --release

echo ✅ Build completed!
echo 📁 APK Location: build\app\outputs\flutter-apk\app-release.apk
echo 📁 Bundle Location: build\app\outputs\bundle\release\app-release.aab

pause