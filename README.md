# 💰 Expense Tracker App


A modern, responsive, and aesthetically pleasing Expense Tracker application built with Flutter. This app helps users manage their personal finances by tracking daily expenses across various categories with a sleek dark-mode UI.

## 📸 Screenshots

| Dashboard & Wallet | Add Expense & List |
|:---:|:---:|
| <img src="../expense_tracker/lib/assets/screenshots/dashboard.jpg" alt="Dashboard" width="300"/> | <img src="../expense_tracker/lib/assets/screenshots/add_Expense.jpg" alt="Add Expense" width="300"/> |
| *View total balance and charts* | *Easy input and organized lists* |


## ✨ Features

* **Dashboard Overview:**
    * **Smart Wallet:** Real-time display of total expenses with a matte-styled card.
    * **Chart Visualization:** Visual breakdown of spending habits.
* **Expense Management:**
    * **Add New Expenses:** Intuitive modal with Title, Amount, Date Picker, and Category selection.
    * **Categorization:** Organize spending into **Food, Travel, Leisure, and Work**.
    * **Swipe to Delete:** Easily remove items by swiping, with a red alert background.
    * **Undo Action:** Accidentally deleted an item? Restore it immediately via the SnackBar notification.
* **Modern UI/UX:**
    * **Dark Mode Design:** Features a custom dark color palette (Charcoal to Black gradients) and card styling.
    * **Responsive Layout:** Adapts layout for portrait and landscape modes (or wider screens).
    * **Platform Adaptation:** Native-feeling alert dialogs for both iOS (Cupertino) and Android.

## 🛠️ Tech Stack & Packages

* **Framework:** Flutter & Dart
* **State Management:** Flutter Riverpod
* **Dependencies:**
    * `uuid`: For generating unique IDs for transaction items.
    * `intl`: For date formatting.
    * `google_fonts`: For custom typography.
    * `flutter_riverpod`: For efficient state management.

## 📂 Project Structure

```text
lib/
├── models/
│   └── expense_model.dart    # Expense data model & Enum logic
├── providers/
│   └── expenses_provider.dart # Riverpod state management
├── widgets/
│   ├── chart/                # Chart visualization widgets
│   ├── expenses_list/        # List view & Wallet card logic
│   │   ├── expense_item_widget.dart
│   │   ├── expenses_list.dart
│   │   └── wallet.dart
│   ├── add_expense_widget.dart # Form to input new data
│   └── expenses.dart         # Main screen composition
└── main.dart                 # App entry point & Theme config
```

## 🚀 Getting Started

### 1.Clone the repository:
``` git clone [https://github.com/yourusername/expense-tracker.git](https://github.com/yourusername/expense-tracker.git) ```

### 2.Install Dependencies
```
cd expense-tracker
flutter pub get
```

### 3.Run the App
```
flutter run
```

## 🎨 Theme & Styling

* The app utilizes a custom ColorScheme seeded from a vibrant yellow-green, set against a dark scaffolding for high contrast and readability.


**⚠️ Note: This is a learning project created to explore Flutter development and State Management.**