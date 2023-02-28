import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:observerlist/app/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({required this.item, required this.removeItem,super.key});

  ItemModel item;
  final Function removeItem;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
       return ListTile(
          title: Text(item.title!),
          leading: Checkbox(
            value: item.check,
            onChanged: (value)=> item.setCheck(value!),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.red), 
            onPressed: ()=> removeItem()
          ),
        );
      },
    );
  }
}