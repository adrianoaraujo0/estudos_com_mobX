import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  
  _ItemModelBase({this.title, this.check = false});

  @observable
  String? title;

  @observable
  bool? check;

  @action
  void setTitle(String title) => this.title = title;

  @action
  void setCheck(bool check) => this.check = check;

}