import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:observerlist/app/models/item_model.dart';
import 'package:observerlist/app/pages/home/components/itemWidget.dart';
import 'package:observerlist/app/pages/home/home_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final controller = HomeController();

  _dialog(){
    var item = ItemModel();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Adicionar Item"),
          content: TextField(
            onChanged: item.setTitle,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              child: const Text("Salvar"), 
              onPressed: (){
                controller.addItem(item);
                Navigator.pop(context);
              }
            ),
            TextButton(child: const Text("Cancelar"), onPressed: (){}),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
             return TextField(
              onChanged: (value) => controller.filter = value,
              decoration: const InputDecoration(hintText: "Pesquisa...")
            );
          },
          )
        ),
        body: Center(
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listFiltered.length,
                      itemBuilder: (context, index) {
                      var item = controller.listFiltered[index];
                      return ItemWidget(item: item, removeItem: ()=> controller.removeItem(item)); 
                    },
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _dialog,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), 
      ),
    );
  }
}
