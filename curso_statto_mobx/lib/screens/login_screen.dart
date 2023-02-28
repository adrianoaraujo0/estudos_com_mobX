import 'package:curso_statto_mobx/stores/login_store.dart';
import 'package:curso_statto_mobx/widgets/custom_icon_button.dart';
import 'package:curso_statto_mobx/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginStore loginStore = LoginStore();
  ReactionDisposer? disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

   disposer = reaction(
      (_) => loginStore.loogedIn, 
      (_) => Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()))
    );
  }

  @override
  void dispose() {
    super.dispose();
    disposer!();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Observer(
            builder: (_) {
             return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 16,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: loginStore.loading == false 
                  ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        hint: 'E-mail',
                        prefix: const Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                        enabled: true,
                      ),
                      const SizedBox(height: 16),
                      Observer(
                        builder: (_) {
                          return CustomTextField(
                            hint: 'Senha',
                            prefix: const Icon(Icons.lock),
                            obscure: loginStore.isObscured,
                            onChanged: loginStore.setPassword,
                            enabled: true,
                            suffix: CustomIconButton(
                              radius: 32,
                              iconData: loginStore.isObscured == true 
                              ? Icons.visibility_off
                              : Icons.visibility,
                              onTap: loginStore.setIsObscured,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        height: 44,
                        child: Observer(
                          builder: (_) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                              onPressed: loginStore.isFormValid 
                              ? ()async=> loginStore.login()
                              : null,
                              child: const Text('Login'),
                            );
                          },
                        )
                      )
                    ],
                  )
                  : const CircularProgressIndicator(color: Colors.black,)
                )
              );
            },
          )
        ),
      ),
    );
  }
}
