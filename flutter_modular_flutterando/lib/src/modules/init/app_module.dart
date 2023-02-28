import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_flutterando/src/modules/auth/auth_module.dart';
import 'package:flutter_modular_flutterando/src/modules/splash/view/splash_page.dart';

class AppModule extends Module {

  @override
  List<Bind<Object>> get binds => super.binds;  

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (context, args) => const SplashPage()),
    ModuleRoute("/login", module: AuthModule()),
  ];

  

}