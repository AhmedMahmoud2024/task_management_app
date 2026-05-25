# task_management_app
This is week 3 and the Final Project for phase 1. The objective was to build a fully functional Task Management application while demonstrating production-level standards: asynchronous storage persistence, loose architectural coupling, defensive programming against edge cases, and custom UI/UX enhancements.

## 🧠 Engineering Approach & Problem Solving

Instead of just linking basic features together, I designed this app with scalability and debugging in mind, addressing several engineering constraints:

* *Smart Pre-loading Splash Sequence (The Bonus Challenge):* Instead of making the user wait on a frozen Home Screen while fetching data from the disk, I built a smart SplashScreen. It initiates the asynchronous disk reads via the StorageService during the loading sequence and passes the pre-loaded data directly to the HomeScreen, eliminating the layout popping effect completely.
* *Decoupled Architecture & Loose Coupling:* The UI layer is completely blind to how or where the data is saved. I encapsulated all serialization logic (jsonEncode/jsonDecode) and SharedPreferences disk interactions inside a dedicated StorageService. This means we can swap SharedPreferences for Hive or SQLite in the future without touching a single line of UI code.
* *Defensive Error Handling & Live Logging:* To ensure the app is production-ready for testing and debugging, I integrated dart:developer logs with proper try-catch blocks inside the data layer. If a storage read/write error occurs, the debugger catches the exact StackTrace without crashing the user's interface.
* *Dynamic UI Controls & Clean UX:* * Enforced strict input validation by blocking empty titles or strings with pure whitespaces using .trim().isEmpty within an interactive AlertDialog.
    * Utilized ListView.builder paired with unique element ValueKey IDs bound to each task's unique ID, ensuring optimal RAM footprint and flawless element state management during runtime modifications (toggles/deletions).
    * Implemented proper lifecycle memory management by explicitly overriding the dispose() method for text controllers to prevent memory leaks.

## 📂 Project Directory Layout

I organized the project utilizing a clean data-and-view separation pattern:

lib/
├── core/
│   └── services/
│       └── storage_service.dart # Handles defensive JSON encoding/decoding & disk I/O 
├── models/
│   └── task_model.dart          # Immutable data entity structure & serialization 
└── screens/
    ├── splash/
    │   └── splash_screen.dart   # Bootstrapper view & asynchronous data pre-loader
    └── home/
        ├── home_screen.dart     # Primary view with Custom AppBar & tasks functionality
        └── widgets/
            └── task_item.dart   # Modularized stateless list tile layout with ValueKeys