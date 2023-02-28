import 'package:mobx/mobx.dart';
import 'package:observerlist/app/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: "Item 1",check: true),
    ItemModel(title: "Item 2",check: false),
    ItemModel(title: "Item 3",check: true),
    ItemModel(title: "Item 4",check: true),
    ItemModel(title: "Item 5",check: false),
    ItemModel(title: "Item 6",check: false),
  ].asObservable();

  @observable
  String filter = "";

  @action
  void addItem(ItemModel item) => listItems.add(item);

  @action
  void removeItem(ItemModel item) => listItems.remove(item);

  @action
  setFilter(String value) => filter = value;

  @computed
  List<ItemModel> get listFiltered {
    if(filter.isEmpty){
      return listItems;
    }else{
      return listItems.where((item) => item.title!.toLowerCase().contains(filter.toLowerCase())).toList();
    }
  }

  @computed
  int get checkedItem=> listItems.where((item) => item.check!).length;

  



}