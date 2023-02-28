import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_formulario_reativo/controller.dart';

class BodyWidget extends StatelessWidget {
  BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {

  final controller =  GetIt.I.get<Controller>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (context) {
                return buildTextField(
                    labelText: "Insira seu nome",
                    onChanged: controller.client.changeName,
                    error: controller.validateName);
              },
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (context) {
                return buildTextField(
                    labelText: "Insira seu cpf",
                    onChanged: controller.client.changeCpf,
                    error: controller.validateCpf);
              },
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (context) {
                return buildTextField(
                    labelText: "Insira seu email",
                    onChanged: controller.client.changeEmail,
                    error: controller.validateEmail);
              },
            ),
            Observer(
              builder: (_) {
                return ElevatedButton(
                  onPressed: controller.isValid ? () {} : null,
                  child: const Text("Cadastrar"),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField({String? labelText, onChanged, String? Function()? error}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        errorText: error == null ? null : error(),
      ),
    );
  }
}