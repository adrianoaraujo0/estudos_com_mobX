import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_flutterando/src/modules/init/app_module.dart';
import 'package:flutter_modular_flutterando/src/modules/init/app_widget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: const AppWidget()));



