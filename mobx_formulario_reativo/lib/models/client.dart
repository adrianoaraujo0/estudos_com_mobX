import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {


  String? name = "";
  void changeName(String name) => this.name = name;

  String? cpf = "";
  void changeCpf(String cpf) => this.cpf = cpf; 
  
  String? email = "";
  void changeEmail(String email) => this.email = email;
  
}