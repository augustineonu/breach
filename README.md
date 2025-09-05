# breach

# Breach Mobile App

This is the **Breach mobile test implementation**, converted from the provided web designs into a responsive Flutter mobile app. The app supports guest browsing, authentication (signup/login), category/interest selection, and realtime blog streams via WebSocket.

## 🚀 Features Implemented

- **Authentication**: Register & Login (with token + userId response)
- **Guest Mode**: View posts & categories without logging in
- **Onboarding**: Select categories of interest after signup
- **Home Page**: Displays blog posts from user interests across tabs (Featured, Popular, Recent)
- **Realtime Streams**: Integrated WebSocket (`wss://breach-api-ws.qa.mvm-tech.xyz`) to display live posts on home screen
- **Reusable Components**: Shared widgets (buttons, cache images, snackbars)
- **Error Handling**: Unified API service with custom ApiException for cleaner error messages
- **Responsive UI**: Mobile-first responsive design, adapting from web designs to Flutter

## 📱 Demo Videos

### Android Demo
🎬 **[Android Demo Video](https://drive.google.com/file/d/1IfzEdQHFyc_9LKDQoYYq3YKQ27wJkaRN/view?usp=sharing)** - See the app in action on Android device

### iOS Demo
🎬 **[iOS Demo Video](https://drive.google.com/file/d/1TlhcRc_lc2bHaM4kc9EnnSnVgHjYdYXM/view?usp=sharing)** - See the app in action on iOS device

## 🏗️ Project Structure

We followed a **Clean MVVM-style architecture**:

```
lib/
│── core/                # shared app-wide utilities
│   ├── constants/       # endpoints, colors, assets
│   ├── network/         # api service, exceptions
│   ├── service/         # websocket service
│   ├── utils/           # helpers (snackbar, utils, local storage)
│   └── widgets/         # reusable widgets (button, cache image, etc.)
│
│── features/
│   ├── auth/            # authentication module
│   │   ├── data/        # models, repositories
│   │   ├── domain/      # controllers, bindings
│   │   └── pages/       # auth UI
│   │
│   └── home/            # home module (posts, streams)
│       ├── data/        # models, repositories
│       ├── domain/      # controllers, bindings
│       └── pages/       # home + guest UI
│
└── main.dart            # entry point
```

This separation makes it easy to locate:
- **Models** → in `data/models`
- **Controllers** → in `domain/controllers`
- **Repositories** → in `data/repositories`
- **Pages** → in `pages/`

## 🔧 How to Generate a Build

Run the following commands to build the app:

### Manual Build Commands

```bash
# Get dependencies
flutter pub get

# Run code generation (if needed)
flutter pub run build_runner build --delete-conflicting-outputs

# Build APK (release)
flutter build apk --release

# Build for iOS (requires macOS)
flutter build ios --release
```

### Automated Build Script

Or simply run the provided bash script:

**build.sh**
```bash
#!/bin/bash

# exit on error
set -e

echo "📦 Getting dependencies..."
flutter pub get

echo "⚡ Running build runner..."
flutter pub run build_runner build --delete-conflicting-outputs || true

echo "📱 Building release APK..."
flutter build apk --release

echo "✅ Build complete! Find your APK at: build/app/outputs/flutter-apk/app-release.apk"
```

## 📖 How to Follow the Code

### Entry Point
Start at **`main.dart`** → sets up GetMaterialApp, routes, and initial binding.

### 🔐 Auth Flow
- **`auth_controller.dart`** → handles login/register with repository
- **`auth_repository.dart`** → talks to `api_service.dart`
- **After login** → token is used to fetch/save interests

### 🎯 Onboarding Flow
- **`onboarding_controller.dart`** → manages category selection
- Calls repository to save interests

### 🏠 Home Flow
- **`home_controller.dart`** → fetches blog posts based on user interests
- Uses random categories for Featured, Popular, Recent tabs
- Handles sorting (e.g. Recent tab)

### 🌐 WebSocket Streams
- **`websocket_service.dart`** → connects with token
- **`home_controller.dart`** subscribes to updates
- **UI** → `StreamCard` widget displays incoming posts

### 🎨 UI Components
- **`app_button.dart`**, **`app_cache_image.dart`**, **`app_snackbar.dart`** → reusable building blocks

## 🛠️ Tech Stack

- **Flutter** - Cross-platform mobile framework
- **GetX** - State management, routing, and dependency injection
- **WebSocket** - Real-time communication
- **HTTP** - API communication
- **Cached Network Image** - Image caching and optimization
- **Flutter Screenutil** - Responsive design utilities

## 📋 Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- iOS development setup (for iOS builds)

---

**Built with ❤️ using Flutter**