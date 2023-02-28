import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formulario_mobx/ui/form/form_controller.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});

  FormController formController = FormController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulário")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Observer(
                builder: (_) {
                  return buildTextField(
                    "Insira seu nome",
                    formController.nameController,
                    formController.validationName
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

    Widget buildTextField(String hintText, TextEditingController controller, String? Function() validator) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        formController.client?.changeName(value);
      },
      decoration: InputDecoration(
        errorText: validator() ?? "Campo obrigatório.",
          hintText: hintText, border: const OutlineInputBorder()),
    );
  }
}