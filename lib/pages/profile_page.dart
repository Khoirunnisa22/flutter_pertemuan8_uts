import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthController>().isLoggedIn;

    return Scaffold(
      appBar: AppBar(title: Text("Halo, $username!")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Username: $username"),
            Text("Status: ${isLoggedIn ? "Login" : "Logout"}"),
          ],
        ),
      ),
    );
  }
}
