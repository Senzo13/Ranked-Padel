import 'package:flutter/material.dart';
import 'dart:async';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // Attendez 3 secondes avant de passer à l'écran suivant
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacementNamed('/login'); // Redirection vers l'écran principal
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue, // Couleur de fond de l'écran de chargement
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ranked Padel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            CircularProgressIndicator(), // Indicateur de chargement
          ],
        ),
      ),
    );
  }
}
