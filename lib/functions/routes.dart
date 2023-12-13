import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';
import 'package:tubes_smart_home/pages/_pages.dart';

class RouteGenerator {
  static List pages = [
    const MyHomePage(),
    const MyActivityLog(),
    const MySettingsPage(),
  ];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyNavbarCustom());
      case '/add-person':
        return MaterialPageRoute(builder: (_) => const MyAddPersonPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: const Center(child: Text("Error")),
        );
      },
    );
  }
}
