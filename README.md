
# Animooo
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Mohamed-Hazem-Shawqy/Animooo)

Animooo is a cross-platform application built with Flutter that allows users to explore, create, and manage a collection of animals and categories. It features a complete authentication system, dynamic content feeds, and management capabilities for animals and categories.

## Key Features

- **User Authentication**: Secure user registration, login, and session management using token-based authentication (access and refresh tokens). Includes OTP verification for sign-up and a "Forgot Password" flow.
- **Category Management**: Users can create new animal categories with names, descriptions, and images.
- **Animal Management**: Full CRUD (Create, Read, Update, Delete) functionality for animal entries, including details like name, price, description, and image.
- **Dynamic Home Screen**: A central dashboard displaying a list of all categories and animals. Users can filter the animal list by selecting a category.
- **Search Functionality**: Users can search for specific animals or categories.
- **Profile Management**: A dedicated section for users to view their profile details.
- **Robust Architecture**: Built using Clean Architecture principles, separating business logic from UI for better scalability and maintainability.
- **State Management**: Utilizes the BLoC/Cubit pattern for predictable and efficient state management.
- **Offline Handling**: Includes a built-in check for internet connectivity and displays a notification to the user when offline.

## Tech Stack & Architecture

- **Framework**: Flutter
- **Architecture**: Clean Architecture (Data, Domain, Presentation layers)
- **State Management**: `flutter_bloc` (BLoC/Cubit)
- **Networking**: `dio` for handling API requests and `pretty_dio_logger` for logging.
- **Dependency Injection**: `get_it` for service location.
- **Routing**: Custom routing manager for named routes.
- **Local Storage**: `shared_preferences` for non-sensitive data and `flutter_secure_storage` for tokens.
- **Localization**: `easy_localization` for multi-language support (English and Arabic).
- **Backend Integration**: Firebase is used for App Distribution. A custom RESTful API  powers the backend, developed and tested locally using XAMPP.


## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

- Flutter SDK (version 3.10.0 or higher)
- A code editor like Android Studio or VS Code

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Mohamed-Hazem-Shawqy/Animooo.git
    ```

2.  **Navigate to the project directory:**
    ```bash
    cd Animooo
    ```

3.  **Install the dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Run the application:**
    ```bash
    flutter run
    ```
    
### Firebase Configuration
This project is configured to connect to a Firebase backend. To connect to your own Firebase instance, you will need to:
1.  Create a new project on the [Firebase Console](https://console.firebase.google.com/).
2.  Replace the `android/app/google-services.json` file with your own configuration file.
3.  Update the `lib/firebase_options.dart` with the options for your Firebase project.

## Project Structure

The project is organized into a feature-based structure following Clean Architecture principles.

```
lib/
├── app/              # Main application widget and setup
├── core/             # Shared logic, widgets, and utilities
│   ├── cubits/       # Core Cubits (e.g., internet connection)
│   ├── database/     # API services (Dio client, endpoints)
│   ├── entity/       # Core business entities
│   ├── models/       # Core data models
│   ├── services/     # Service locator (GetIt) and helpers
│   ├── utils/        # Constants, colors, styles, routing
│   └── widgets/      # Common reusable widgets
├── feature/          # Feature-based modules
│   ├── auth/         # Authentication (Sign up, Login)
│   ├── category/     # Category management
│   ├── add_new_animal/ # Animal management
│   ├── home/         # Home screen
│   ├── otp/          # OTP verification
│   ├── new_password/ # Password reset flow
│   ├── profile/      # User profile
│   └── ...           # Other features
└── main.dart         # Application entry point
