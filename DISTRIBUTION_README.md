# Mini SFA Login App - Distribution Guide

## 📱 Quick Install (Android)
1. Download `app-release.apk` from the releases
2. Enable "Install from Unknown Sources" in your Android settings
3. Install the APK file
4. Login with: **Username:** `admin` **Password:** `123456`

## 🛠️ Development Setup

### Prerequisites
- Flutter SDK (3.35.5 or later)
- Android Studio or VS Code
- Android SDK (API 21+)

### Installation Steps
```bash
# Clone repository
git clone https://github.com/AbulHasnatHridoy/xpertCapture.git
cd xpertCapture/login

# Install dependencies
flutter pub get

# Run on device
flutter run --release
```

### Build APK
```bash
flutter build apk --release
```

## 🎯 App Features
- **Login System:** Admin authentication
- **Dashboard:** Navigation to Orders, Visits, Profile
- **Back Navigation:** Easy navigation between pages
- **Logout:** Secure session management
- **Background Image:** Custom login background

## 🔧 Configuration
- **Package Name:** com.example.login
- **Min SDK:** API 21 (Android 5.0)
- **Target SDK:** Latest Flutter target
- **Login Credentials:** admin/123456

## 📁 Project Structure
```
lib/
├── main.dart              # App entry point
├── loginPage.dart         # Login screen
├── dashbord_page.dart     # Main dashboard
├── orders_page.dart       # Orders management
├── visits_page.dart       # Visits tracking
├── profile_page.dart      # User profile
└── Homepage.dart          # Alternative home page

android/                   # Android-specific code
assets/                    # App resources
└── xpertLoginBackground.jpg
```

## 🚀 Quick Start
1. Extract/Clone project files
2. Run `flutter pub get`
3. Connect device or start emulator
4. Run `flutter run --release`

## 📞 Support
For issues or questions, contact the development team or create an issue on GitHub.