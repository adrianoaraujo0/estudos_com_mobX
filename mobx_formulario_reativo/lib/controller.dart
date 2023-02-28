
import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:mobx_formulario_reativo/models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store{

  var client = Client();

 String? validateName(){
   if(client.name == null || client.name!.isEmpty){
    return "este campo é obrigatório.";
  }else if(client.name!.length < 3){
    return "Seu nome deve ser maior que 3 caracteres.";
  }else{
    return null;
  }
 }

 String? validateCpf(){
   if(client.cpf == null || client.cpf!.isEmpty){
    return "este campo é obrigatório.";
  }else if(client.cpf!.length < 13){
    return "Seu nome deve ser maior que 13 caracteres.";
  }else{
    return null;
  }
 }

  String? validateEmail(){
   if(client.email == null || client.email!.isEmpty){
    return "este campo é obrigatório.";
  }else if(client.email!.length < 13){
    return "Seu nome deve ser maior que 13 caracteres.";
  }else{
    return null;
  }
 }

  @computed
  bool get isValid {
    return validateName() == null && validateCpf() == null;
  }
}
