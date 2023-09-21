import 'package:flutter/material.dart';
import 'package:ranked_padel/views/others/auth/auth_view.dart';
import 'package:ranked_padel/utils/preferences/user_preferences.dart';
import 'package:ranked_padel/views/others/navigation/base.dart';
import 'package:ranked_padel/views/tabs/home/home_view.dart';
import 'package:ranked_padel/main.dart';
import 'package:ranked_padel/views/others/splash/splash_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /* ROUTES PROTECTED BY AUTHENTICATION */
      case '/':
        // Utilisation du FutureBuilder pour gérer l'asynchronicité
        return MaterialPageRoute(
          builder: (_) => FutureBuilder<bool>(
            future: UserPreferences().isAuthenticated(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == true) {
                  return const HomeView();
                } else {
                  return const BaseLayout();
                }
              }
              // Pendant le chargement, affichez le LoadingScreen
              return const LoadingScreen();
            },
          ),
        );
      /* ROUTES NOT PROTECTED */
      case '/splash':
        return MaterialPageRoute(
            builder: (_) => const SplashView()); // Route du splash screen
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView());
        case '/home':
        return MaterialPageRoute(builder: (_) => const BaseLayout());
      // ... autres routes
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
