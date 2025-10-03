#!/bin/bash
# Build Script for Mini SFA Login App

echo "🚀 Building Mini SFA Login App..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build APK
echo "🏗️ Building release APK..."
flutter build apk --release

# Build App Bundle (for Play Store)
echo "📱 Building App Bundle..."
flutter build appbundle --release

echo "✅ Build completed!"
echo "📁 APK Location: build/app/outputs/flutter-apk/app-release.apk"
echo "📁 Bundle Location: build/app/outputs/bundle/release/app-release.aab"
echo "📏 APK Size: $(du -h build/app/outputs/flutter-apk/app-release.apk | cut -f1)"