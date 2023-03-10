import 'package:curso_statto_mobx/models/todo.dart';
import 'package:curso_statto_mobx/stores/list_store.dart';
import 'package:curso_statto_mobx/widgets/custom_icon_button.dart';
import 'package:curso_statto_mobx/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'login_screen.dart';

class ListScreen extends StatefulWidget {

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  ListStore listStore = ListStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tarefas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900,fontSize: 32)),
                    IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=>LoginScreen())
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children:[
                        Observer(
                          builder: (_) {
                           return CustomTextField(
                              hint: 'Tarefa',
                              controller: listStore.textEditingController,
                              onChanged: listStore.setNewTodo,
                              suffix: listStore.newTodo.isNotEmpty
                              ? CustomIconButton(
                                radius: 32,
                                iconData: Icons.add,
                                onTap: ()=> listStore.addTodo(),
                              )
                              : null,
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Observer(
                            builder: (_) {
                             return ListView.separated(
                                itemCount: listStore.todoList.length,
                                itemBuilder: (_, index){
                                  int index2 = listStore.todoList.length - index - 1;
                                  print(index2);
                                  return ListTile(
                                    title: Text(
                                      listStore.todoList[index2].title!,
                                      style: TextStyle(
                                        decoration: listStore.todoList[index2].isDone ? TextDecoration.lineThrough : null
                                      )
                                    ),
                                    onTap: ()=> listStore.setIsDone(listStore.todoList[index2], index2),
                                  );
                                },
                                separatorBuilder: (_, __)=> const Divider(),
                              );
                            },
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}