import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Nombre d'onglets
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Onglet 1'),
              Tab(text: 'Onglet 2'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Contenu de l'onglet 1
            Center(
              child: Text('Contenu de l\'onglet 1'),
            ),

            // Contenu de l'onglet 2
            Center(
              child: Text('Contenu de l\'onglet 2'),
            ),
          ],
        ),
      ),
    );
  }
}
