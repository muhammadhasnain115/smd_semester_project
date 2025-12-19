# Professional Flutter Scaffold Guide

Welcome to your professional Flutter scaffold! This guide will help you understand the structure and how to use it.

## 📁 Project Structure

```
lib/
├── app/
│   └── app.dart                    # Main app configuration
├── core/
│   └── theme/
│       └── app_theme.dart          # Theme configuration (light & dark)
├── features/
│   └── home/
│       └── presentation/
│           ├── pages/
│           │   └── home_page.dart  # Main home page with tabs
│           └── widgets/
│               └── app_drawer.dart # Navigation drawer
└── main.dart                       # App entry point
```

## 🎨 Features Included

### 1. **Material 3 Design**
- Modern UI with Material Design 3
- Beautiful color schemes
- Smooth animations and transitions

### 2. **Dark Mode Support**
- Automatic light and dark theme
- System theme detection
- Consistent styling across themes

### 3. **Navigation Components**
- **AppBar**: Top bar with title and action buttons
- **Drawer**: Side navigation menu with user profile
- **Bottom Navigation Bar**: Tab-based navigation (Home, Search, Profile)
- **Floating Action Button**: Quick action button

### 4. **Clean Architecture**
- Organized folder structure
- Separation of concerns
- Easy to scale and maintain

## 🚀 How to Use

### Running the App
```bash
# For Chrome (web)
flutter run -d chrome

# For Windows
flutter run -d windows

# For Android
flutter run -d android

# For iOS
flutter run -d ios
```

### Adding New Pages

1. Create a new file in `lib/features/your_feature/presentation/pages/`
2. Create your page widget:

```dart
import 'package:flutter/material.dart';

class YourNewPage extends StatelessWidget {
  const YourNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Page'),
      ),
      body: Center(
        child: Text('Your content here'),
      ),
    );
  }
}
```

3. Navigate to it:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const YourNewPage()),
);
```

### Customizing the Theme

Edit `lib/core/theme/app_theme.dart`:

```dart
// Change primary color
static const Color primaryColor = Color(0xFF6750A4); // Your color here

// Modify light theme
static ThemeData get lightTheme {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    // Add more customizations...
  );
}
```

### Adding Bottom Navigation Tabs

In `lib/features/home/presentation/pages/home_page.dart`:

1. Add a new tab widget:
```dart
class YourNewTab extends StatelessWidget {
  const YourNewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Your Tab Content'));
  }
}
```

2. Add it to the `_pages` list:
```dart
final List<Widget> _pages = [
  const HomeTab(),
  const SearchTab(),
  const ProfileTab(),
  const YourNewTab(), // Add here
];
```

3. Add a navigation destination:
```dart
destinations: const [
  // ... existing destinations
  NavigationDestination(
    icon: Icon(Icons.your_icon_outlined),
    selectedIcon: Icon(Icons.your_icon),
    label: 'Your Tab',
  ),
],
```

### Customizing the Drawer

Edit `lib/features/home/presentation/widgets/app_drawer.dart`:

```dart
// Add new menu items
ListTile(
  leading: const Icon(Icons.your_icon),
  title: const Text('Your Menu Item'),
  onTap: () {
    Navigator.pop(context);
    // Your action here
  },
),
```

## 🎯 Best Practices

1. **Use const constructors** whenever possible for better performance
2. **Follow the feature-based structure** for new features
3. **Keep widgets small and focused** - create reusable components
4. **Use theme colors** instead of hardcoded colors
5. **Handle navigation properly** - always pop the drawer before navigating

## 📚 Common Widgets

### Card
```dart
Card(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Text('Card content'),
  ),
)
```

### ListTile
```dart
ListTile(
  leading: Icon(Icons.star),
  title: Text('Title'),
  subtitle: Text('Subtitle'),
  trailing: Icon(Icons.arrow_forward),
  onTap: () {},
)
```

### SnackBar
```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Message')),
);
```

### Dialog
```dart
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Title'),
    content: const Text('Content'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('OK'),
      ),
    ],
  ),
);
```

## 🔧 Next Steps

1. **Add state management** (Provider, Riverpod, or Bloc)
2. **Add routing** (go_router or auto_route)
3. **Add API integration** (dio or http)
4. **Add local storage** (shared_preferences or hive)
5. **Add authentication** (Firebase Auth or custom)

## 📖 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design 3](https://m3.material.io/)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

## 💡 Tips for Beginners

1. **Hot Reload**: Press `r` in the terminal to reload changes instantly
2. **Hot Restart**: Press `R` to restart the app completely
3. **Debug**: Use `print()` statements or the debugger
4. **Widgets**: Everything in Flutter is a widget!
5. **State**: Learn the difference between StatelessWidget and StatefulWidget

Happy coding! 🚀
