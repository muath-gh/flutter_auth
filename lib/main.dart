import 'package:auth_playground/providers/auth_provider.dart';
import 'package:auth_playground/repositories/auth_repo.dart';
import 'package:auth_playground/screens/home_screen.dart';
import 'package:auth_playground/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MultiProvider(
    providers: providers,
    child: MainPage(),
  ));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(RealAuthRepo())),
];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return MaterialApp(
      home: authProvider.isLoggedIn ? HomeScreen() : LoginScreen(),
    );
  }
}
