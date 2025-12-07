# Architecture-First Navigation

A Flutter application demonstrating architecture-first navigation patterns with state-driven routing and full browser history support.

## Overview

This project implements a two-tab application where each tab maintains its own independent navigation stack. All navigation is driven by state changes through the BLoC pattern. The application state (active tab and navigation stacks) is fully represented in the browser URL, enabling full browser back/forward button support.

## Architecture

### Key Principle

**Business Logic Layer (BLoC) must never directly call navigation functions.** All navigation changes must be derived purely from changes in the application's top-level state object.


## How It Works

### 1. State-Driven Navigation

All screens dispatch navigation events to `NavigationBloc` instead of calling `context.go()` directly:

```dart
// ❌ Wrong - Direct navigation
onPressed: () => context.go('/home/subroute1')

// ✅ Correct - State-driven navigation
onPressed: () {
  context.read<NavigationBloc>().add(
    NavigationNavigateToEvent('/home/subroute1'),
  );
}
```

### 2. State Listener

The `BlocListener` in `main.dart` observes state changes and performs navigation:

```dart
BlocListener<NavigationBloc, NavigationState>(
  listener: (context, state) {
    final router = GoRouter.router;
    if (state is NavigationNavigateState) {
      router.go(state.route);
    }
  },
  // ...
)
```


## Getting Started

### Prerequisites

- Flutter SDK (>=3.1.0)
- Dart SDK

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

```bash
flutter run
```

For web:
```bash
flutter run -d chrome
```

## Dependencies

- `go_router: ^13.2.0` - Declarative routing (Navigation 2.0 wrapper) 
- `flutter_bloc: ^9.1.0` - State management using BLoC pattern
- `bloc: ^9.1.0` - Core BLoC library



### Navigating to a Route 

```dart
// In any screen
ElevatedButton(
  onPressed: () {
    context.read<NavigationBloc>().add(
      NavigationNavigateToEvent('/home/subroute1'),
    );
  },
  child: Text('Navigate'),
)
```
