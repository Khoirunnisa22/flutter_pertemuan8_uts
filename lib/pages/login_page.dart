import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login", style: TextStyle(fontSize: 24)),
              TextFormField(
                controller: _usernameCtrl,
                decoration: const InputDecoration(labelText: "Username"),
                validator: (value) => value!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: _passwordCtrl,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) =>
                    value!.length < 6 ? "Minimal 6 karakter" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final auth = context.read<AuthController>();
                    if (auth.login(_usernameCtrl.text, _passwordCtrl.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login Berhasil")),
                      );
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Periksa kembali input Anda")),
                      );
                    }
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
