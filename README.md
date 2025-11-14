# Bookly Flutter App

A feature-rich mobile application built with Flutter for browsing and discovering books. This project uses the Google Books API and showcases clean architecture, state management, and elegant UI design.

## 📲 Features

- Search for books using the Google Books API
- Explore featured books, new releases, and categories
- View book details, author info, and descriptions
- Save books to your personal library or wishlist
- Responsive design for Android and iOS
- Smooth navigation and animations

## 🛠️ Tech Stack

- **Flutter**
- **Dart**
- **Provider** or **Bloc** for state management
- **REST API** integration (Google Books API)
- **Material Design**

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart (included with Flutter)
- Android Studio, VS Code, or IntelliJ IDEA

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/RamadanMohamed11/Bookly.git
   cd Bookly
   ```
2. Get Flutter packages:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
Bookly/
├── lib/
│   ├── features/
│   ├── core/
│   ├── data/
│   ├── presentation/
│   ├── widgets/
│   └── main.dart
├── assets/
│   ├── images/
│   └── icons/
├── test/
└── README.md
```

## 📦 Clean Architecture

- **Presentation Layer:** Screens and widgets
- **Domain Layer:** Entities, use cases, repositories (if using advanced architecture)
- **Data Layer:** API clients, models, repositories

## 🌐 API Integration

- Uses Google Books API for fetching book data
- Endpoints and API keys stored securely (refer to official docs)

## ✨ Customization

- Update API keys and endpoints in the configuration
- Customize app theme in `main.dart` or theme-related files

## 🛡️ License

This project is licensed under the MIT License

## 👤 Author

**Ramadan Mohamed**  
GitHub: [@RamadanMohamed11](https://github.com/RamadanMohamed11)

## 🙏 Acknowledgments

- Flutter Community
- Google Books API
- Open-source libraries and contributors
- Inspiration from book lovers globally
