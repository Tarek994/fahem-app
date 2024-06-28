import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/resources/routes_manager.dart';
// Import other necessary files

// void main() {
//   runApp(MyAppe());
// }

class MyAppe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.accountsScreen, // Set initial route to accounts screen
    );
  }
}