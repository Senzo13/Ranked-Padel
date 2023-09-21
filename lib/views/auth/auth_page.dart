import 'package:flutter/material.dart';
import 'package:ranked_padel/viewmodels/auth/auth_viewmodel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _viewModel = LoginViewModel();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username')),
          TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password')),
          ElevatedButton(
            onPressed: () async {
              final user = await _viewModel.login(
                  _usernameController.text, _passwordController.text);
              if (user != null) {
                // Naviguer vers la page d'accueil ou afficher un message de succès
              } else {
                // Afficher un message d'erreur
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
