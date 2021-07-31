import 'package:auth_playground/providers/auth_provider.dart';
import 'package:auth_playground/repositories/auth_repo.dart';
import 'package:auth_playground/screens/home_screen.dart';
import 'package:auth_playground/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

String accessToken = null;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FlutterSecureStorage storage = FlutterSecureStorage();
  accessToken = await storage.read(key: "access_token");

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
      home: accessToken != null
          ? HomeScreen()
          : authProvider.isLoggedIn
              ? HomeScreen()
              : LoginScreen(),
    );
  }
}
