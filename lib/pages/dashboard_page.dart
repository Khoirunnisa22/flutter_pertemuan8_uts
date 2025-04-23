import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = context.watch<AuthController>().username;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                dashboardCard(Icons.add, "Counter", () {
                  Navigator.pushNamed(context, '/counter');
                }),
                dashboardCard(Icons.person, "Profile", () {
                  Navigator.pushNamed(context, '/profile/$username');
                }),
                dashboardCard(Icons.settings, "Settings", () {}),
                dashboardCard(Icons.logout, "Logout", () {
                  Navigator.pushReplacementNamed(context, '/login');
                }),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.lightBlue[100],
            width: double.infinity,
            child: Text("Selamat datang, $username !", textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget dashboardCard(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              const SizedBox(height: 8),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
