import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_formulario_reativo/body.dart';

import 'controller.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<Controller>(Controller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});


  @override
  Widget build(BuildContext context) {

  final controller = GetIt.I.get<Controller>();
  
    return Scaffold(
      appBar: AppBar(title: Observer(builder: (context) => Text(controller.isValid ? "Validado" : "Não validado"))),
      body: BodyWidget(),
    );
  }


}
