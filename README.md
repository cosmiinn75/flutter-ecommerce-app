# Flutter E-Commerce App

A responsive food delivery e-commerce mobile application built with **Flutter** and **Dart**.

The project was developed as a hands-on Flutter learning project, with a focus on building reusable UI components, managing application state, structuring a larger Flutter project, handling navigation, persisting local data, and implementing a complete food ordering flow.

## Demo

<p align="center">
  <img src="assets/food_delivery_app.gif" width="350" alt="Flutter E-Commerce App Demo">
</p>

## Features

### Product Browsing

- Browse popular food products
- Browse recommended products
- Interactive product carousel
- Product ratings and information
- Dedicated product detail pages
- Product images, descriptions and pricing
- Responsive layouts for different screen sizes

### Shopping Cart

- Add products to cart
- Increase or decrease product quantities
- Remove products from cart
- Calculate cart totals
- Persistent cart storage
- Cart history
- Restore cart data after restarting the application

### Authentication

- Sign up page
- Sign in page
- Input validation
- Local mock authentication flow
- Persistent login state using `SharedPreferences`
- User information stored locally

> Authentication is currently mocked locally and is not connected to a production backend.

### User Experience

- Splash screen
- Bottom navigation
- Custom reusable widgets
- Responsive dimensions
- Smooth page transitions
- Custom fonts and styling
- Popular and recommended food sections
- Account page
- Cart history page

## Tech Stack

- **Flutter**
- **Dart**
- **GetX**
- **SharedPreferences**
- **Material Design**

Additional packages used include:

- `get`
- `dots_indicator`
- `persistent_bottom_nav_bar_v2`
- `shared_preferences`
- `intl`

## State Management & Navigation

The application uses **GetX** for:

- State management
- Dependency injection
- Controller management
- Application routing
- Page transitions

Controllers are separated from the UI and communicate with repository classes responsible for retrieving and storing application data.

## Architecture

The project is organized into separate layers for UI, application state and data access.

```text
lib/
├── base/
├── data/
│   ├── api/
│   ├── controller/
│   ├── model/
│   └── repository/
├── helper/
├── pages/
│   ├── account/
│   ├── auth/
│   ├── cart/
│   ├── food/
│   ├── home/
│   └── splash/
├── route/
├── utils/
├── widget/
└── main.dart
```

### Data Flow

```text
UI
 ↓
GetX Controller
 ↓
Repository
 ↓
Local JSON / SharedPreferences
```

This separation keeps UI code independent from most data-management logic and makes it easier to replace local data with a real backend API in the future.

## Product Data

Product information is currently loaded from local JSON files stored inside:

```text
assets/data/
```

Popular and recommended products are handled independently through dedicated repositories and controllers.

This allows the application to simulate API-driven product loading while keeping the project fully runnable without an external backend.

## Local Persistence

`SharedPreferences` is used to persist application data locally.

Currently persisted data includes:

- Shopping cart
- Cart history
- Authentication state
- User information

This means cart contents and selected application state can survive application restarts.

## Routing

Application navigation is handled using **GetX named routes**.

Current routes include:

```text
Splash
  ↓
Home
  ├── Popular Product Details
  ├── Recommended Product Details
  ├── Cart
  └── Sign In
```

## Responsive UI

The application uses reusable dimension utilities together with Flutter's screen dimensions to adapt UI elements across different device sizes.

Custom widgets are used throughout the application to keep styling and behavior consistent.

## Assets

The project contains:

```text
assets/
├── data/
├── fonts/
├── image/
└── food_delivery_app.gif
```

The **Roboto** font family is included locally with regular, medium and bold weights.

## Getting Started

### Prerequisites

Make sure you have installed:

- Flutter SDK
- Dart SDK
- Android Studio, IntelliJ IDEA, or VS Code
- Android SDK
- An Android emulator or physical Android device

Check your Flutter installation:

```bash
flutter doctor
```

### Clone the Repository

```bash
git clone https://github.com/cosmiinn75/flutter-ecommerce-app.git
```

Move into the project:

```bash
cd flutter-ecommerce-app
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Current Limitations

This project currently uses local/mock data for some functionality.

- Product data is loaded from local JSON files
- Authentication is mocked locally
- No production backend is connected
- No real payment processing is implemented
- User accounts are not stored on a remote server

These choices allow the project to focus on Flutter development, application architecture and client-side state management.

## Possible Future Improvements

- Connect the application to a REST API
- Replace mock authentication with real authentication
- Add secure token storage
- Add backend user accounts
- Add real product search
- Add product categories and filtering
- Add favorites / wishlist
- Add delivery addresses
- Add checkout flow
- Integrate online payments
- Add order tracking
- Improve error handling
- Add loading and empty states
- Add unit and widget tests

## What I Practiced

This project helped me practice and understand:

- Flutter widget composition
- Stateful and stateless widgets
- Responsive mobile layouts
- Navigation between screens
- GetX state management
- Dependency injection
- Controller and repository separation
- JSON parsing
- Local data persistence
- Shopping cart state
- Reusable UI components
- Form inputs and validation
- Organizing a larger Flutter codebase

## Project Status

**Learning project / Work in progress**

The core food browsing, product details, shopping cart, cart persistence, authentication UI and navigation flows are implemented.

The next major step would be replacing local/mock data with a real backend API.

## Author

**Cosmin**

GitHub: [@cosmiinn75](https://github.com/cosmiinn75)
