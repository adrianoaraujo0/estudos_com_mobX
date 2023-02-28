import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_flutterando/src/modules/auth/views/create_user_page.dart';
import 'package:flutter_modular_flutterando/src/modules/auth/views/login_page.dart';

class AuthModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (context, args)=> const LoginPage()),
    ChildRoute("/create", child: (context, args) => const CreateUserPage())
  ];

  @override
  List<Bind<Object>> get binds => super.binds;

}