import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/registration_provider.dart';
import 'Providers/product_provider.dart';
import 'Screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>RegisteProvider()),
        ChangeNotifierProvider(create: (context)=>ProductProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:  false,
        home: SignupScreen(),
      ),
    );
  }
}