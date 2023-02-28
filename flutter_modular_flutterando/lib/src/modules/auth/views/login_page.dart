import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Tela de login")),
        body: Column(),
        floatingActionButton: FloatingActionButton(onPressed: () => Modular.to.pushNamed("/login/create")),
      ),
    );
  }
}