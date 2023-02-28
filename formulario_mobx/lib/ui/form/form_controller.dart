import 'package:flutter/material.dart';
import 'package:formulario_mobx/model/client.dart';
import 'package:mobx/mobx.dart';
part 'form_controller.g.dart';

class FormController = _FormControllerBase with _$FormController;

abstract class _FormControllerBase with Store {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @observable
  Client? client;


  String? validationName(){
    if(client?.name != null){
      return client!.name;
    }else{
      return null;
    }
  }

  String? validationEmail(){
    if(client?.email != null){
      return client!.email;
    }else{
      return null;
    }
  }
  
  String? validationUsername(){
    if(client?.username != null){
      return client!.username;
    }else{
      return null;
    }
  }

}