import 'dart:developer';

import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  
  @observable
  bool loading = false;

  @observable
  bool loogedIn = false;

  @observable
  String email = "";

  @action
  void setEmail(String email) => this.email = email;

  @observable
  String password = "";

  @action
  void setPassword(String password) => this.password = password;

  @observable
  bool isObscured = false;

  @action
  void setIsObscured() => isObscured = !isObscured;

  @computed
  bool get isEmailValid=> RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  @computed
  bool get isPasswordValid=> password.length > 6;

  @computed
  bool get isFormValid=> isEmailValid && isPasswordValid;

  @action
  Future<void> login()async{
    loading = true;
    await Future.delayed(const Duration(seconds: 1));
    loading = false;
    loogedIn = true;
  }

}