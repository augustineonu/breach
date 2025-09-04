# breach

📂 Project Folder Structure (lib/)

lib/
│── main.dart
│
├── core/                   # App-wide utilities & configs
│   ├── bindings/           # Global bindings (dependencies injection)
│   ├── constants/          # App constants (colors, strings, images)
│   ├── network/            # Dio/HTTP setup, interceptors, API client
│   ├── utils/              # Helpers (validators, formatters, etc.)
│   └── widgets/            # Shared/reusable widgets (buttons, loaders, etc.)
│
├── features/               # Feature-first architecture
│   ├── auth/               # Authentication module
│   │   ├── data/           # Data layer (models, repositories impl)
│   │   ├── domain/         # Entities & repository contracts
│   │   ├── presentation/   # UI (pages, controllers, widgets)
│   │   └── auth_binding.dart
│   │
│   ├── home/               # Home module (visitor & logged-in home)
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   └── home_binding.dart
│   │
│   ├── onboarding/         # Onboarding module
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   └── onboarding_binding.dart
│   │
│   └── posts/              # Blog posts module
│       ├── data/
│       ├── domain/
│       ├── presentation/
│       └── posts_binding.dart
│
├── routes/                 # Centralized route management
│   ├── app_pages.dart
│   └── app_routes.dart
│
└── injection.dart          # Dependency injection setup


Why this setup?

Core → things shared across the whole app (network, widgets, theme).

Features → each domain (auth, home, onboarding, posts) is isolated into data / domain / presentation following clean architecture.

Bindings → GetX bindings per feature, makes DI clean.

Routes → one place to manage all navigation.
