import 'package:flutter/material.dart';
import 'presentation/ui/pages/homepage.dart';
import 'presentation/ui/pages/user_page.dart';
import 'presentation/ui/pages/address_page.dart';
import 'presentation/ui/pages/company_page.dart';
import 'presentation/providers/user_provider.dart';
import 'presentation/providers/address_provider.dart';
import 'presentation/providers/company_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => CompanyProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "abc",
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/users': (context) => const UserPage(),
        '/addresses': (context) => const AddressPage(),
        '/companies': (context) => const CompanyPage(),
      },
    );
  }
}
