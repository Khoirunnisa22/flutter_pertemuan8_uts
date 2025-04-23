import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';
import 'controllers/counter_controller.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/counter_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => CounterController()),
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/counter': (context) => const CounterPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/profile/')) {
          final username = settings.name!.split('/').last;
          return MaterialPageRoute(builder: (_) => ProfilePage(username: username));
        }
        return null;
      },
    );
  }
}
