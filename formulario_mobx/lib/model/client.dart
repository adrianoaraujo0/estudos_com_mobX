
import 'dart:developer';

import 'package:mobx/mobx.dart';

class Client{
  
  @observable
  String? name;
  @action
  void changeName(String? newName) {
    log("${newName}");
    name = newName;
  }

  @observable
  String? email;
  @action
  void changeEmail(String? newEmail) => email = newEmail;

  @observable
  String? username;
  @action
  void changeUsername(String? newUsername) => username = newUsername;


}