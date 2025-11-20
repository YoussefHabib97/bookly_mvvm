# 📚 Bookly

A clean, modern Flutter application that integrates with **Google Books API v1** to allow users to search for books, view detailed information, and explore smart suggestions based on book categories. Built using **MVVM architecture**, state management with **BLoC**, and several essential Flutter packages.

---

## 🚀 Features

### 🔍 Book Search

* Users can search for books using keywords.
* Real-time fetching from **Google Books API v1**.
* Clean UI for browsing search results.

### 📘 Book Details View

* Displays full book information: title, authors, description, rating, categories, and more.
* Shows **suggested books** based on the category of the currently viewed book.
* Smooth navigation powered by BLoC and MVVM.

### ⭐ Local Storage

* Persistent theme switching using SharedPreferences.

### 🎨 Light & Dark Mode

* Fully supports dynamic theming.
* Clean design that adapts seamlessly to both themes.

---

## 🏗️ Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture for a clean and scalable codebase:

* **Model:** Data models for books and API responses.
* **View:** Flutter widgets for UI screens.
* **ViewModel:** Handles logic, API calls, and state via BLoC.

---

## 🛠️ Tech Stack & Packages

* **Flutter** (3.19.3)
* **Google Books API v1**
* **BLoC / flutter_bloc** – state management
* **Dio** – for networking
* **Shared Preferences** – for local storage
* **GetIt** – for dependency injection
* **GoRouter** – for navigation and routing
* **Equatable** – for clean state comparisons
* **Skeletonizer** – for clean loading transitions

---

## 📡 API Integration

The app communicates with Google Books API v1:

* Search endpoint: `/volumes?q={query}`
* Book details: `/volumes/{id}`

Suggestion system uses:

* First category of current book → fetches more books via category query.

---

## 📱 Screens

* **Home Screen** – Featured books / search entry.
* **Search Screen** – Search field + results list.
* **Book Details Screen** – Book info + category suggestions.

---

## ⚠️ IMPORTANT NOTICE:

###

This project will **NOT** work without JDK 11, you can install Eclipse Adoptium's Temurin JDK 11 [here](https://adoptium.net/temurin/releases?version=11&os=any&arch=any)

Please go to this directory and update the JDK 11 path to your own machine's directory
```
bookly_mvvm/
      ├── android/gradle.properties
                     ├── org.gradle.java.home="C:\\Program Files\\Eclipse Adoptium\\jdk-11.0.28.6-hotspot"

```

## ▶️ How to Run

###

1. Clone the repo:

   ```bash
   git clone https://github.com/YoussefHabib97/bookly_mvvm.git
   ```
2. Install dependencies:

   ```bash
   flutter pub get
   ```
3. Run the app:

   ```bash
   flutter run
   ```

---

## 📦 Project Structure (MVVM)

```
lib/
 ├── core/
 │    ├── api/
 │    ├── errors/
 │    ├── utils/
 │    └── service_locator.dart
 ├── features/
 │    └── book/
 │         ├── data/
 │         │     ├── models/
 │         │     └── repositories/
 │         ├── domain/
 │         │     └── use_cases/
 │         └── presentation/
 │               ├── views/
 │               ├── viewmodels/
 │               └── widgets/
 └── main.dart
```

---

## 📄 License

This project is open-source and available under the MIT License.

---

## ✨ Contributions

Pull requests are welcome! If you'd like to improve features, performance, or documentation, feel free to submit changes.
