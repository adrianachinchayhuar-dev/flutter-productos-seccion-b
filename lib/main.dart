
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sección B - Productos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1673F9),
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
