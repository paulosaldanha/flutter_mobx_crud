import 'package:estruturabasica/src/components/custom_icon_button.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Container(child: Scaffold(
      body: Builder(builder: (context) {
        return Form(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 74, 173, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          'https://i.imgur.com/ndinJu4.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      labelFieldRequired("Documento"),
                      SizedBox(height: 5),
                      Observer(builder: (_) {
                        return numberField(
                            hint: 'RUC / CPF / CNPJ',
                            suffix: registerController.suffixDocument,
                            prefixIcon: Icon(Icons.business),
                            onChanged: registerController.register.setdocumento,
                            errorText: registerController.validateDocument);
                      }),
                      SizedBox(height: 10),
                      labelFieldRequired("Razão Social"),
                      SizedBox(height: 5),
                      Observer(builder: (_) {
                        return textField(
                            hint: 'Razão Social',
                            prefix: Icon(Icons.info_outline),
                            onChanged:
                                registerController.register.setRazaoSocial,
                            errorText: registerController.validateCompanyName);
                      }),
                      SizedBox(height: 10),
                      labelFieldRequired("Nome Responsável"),
                      SizedBox(height: 5),
                      Observer(builder: (_) {
                        return textField(
                            hint: 'Nome',
                            prefix: Icon(Icons.account_circle),
                            onChanged:
                                registerController.register.setResponsavel,
                            errorText: registerController.validateName);
                      }),
                      SizedBox(height: 10),
                      labelFieldRequired("Email"),
                      SizedBox(height: 5),
                      Observer(builder: (_) {
                        return textField(
                            hint: 'example@mail.com',
                            prefix: Icon(Icons.alternate_email),
                            onChanged:
                                registerController.register.setResponsavelEmail,
                            errorText: registerController.validateEmail);
                      }),
                      SizedBox(height: 10),
                      labelFieldRequired("Senha"),
                      SizedBox(height: 5),
                      Observer(builder: (_) {
                        return textField(
                          hint: '********',
                          prefix: Icon(Icons.lock),
                          onChanged: registerController.register.setSenha,
                          errorText: registerController.validatePassword,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: Icons.visibility,
                            onTap: () {},
                          ),
                          obscure: true,
                        );
                      }),
                      SizedBox(height: 10),
                      labelFieldRequired("Confirme sua senha"),
                      SizedBox(height: 5),
                      Observer(builder: (_) {
                        return textField(
                          hint: '********',
                          prefix: Icon(Icons.lock),
                          onChanged: registerController.setConfirmPassword,
                          errorText: registerController.validateConfirmPassword,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: Icons.visibility,
                            onTap: () {},
                          ),
                          obscure: true,
                        );
                      }),
                    ],
                  ),
                ),
                Container(
                  width: 1000,
                  padding: EdgeInsets.all(20),
                  child: Observer(builder: (_) {
                    return RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 17.0),
                        elevation: 11,
                        highlightElevation: 0,
                        color: Color.fromRGBO(0, 74, 173, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          'CADASTRAR'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        onPressed: registerController.isValid
                            ? () {
                                registerController
                                    .createFastAccount()
                                    .then((value) {
                                  print(value);
                                  if (value != null) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text("Conta Criada"),
                                        duration: Duration(seconds: 4)));
                                  } else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            "Não foi possivel criar sua conta"),
                                        duration: Duration(seconds: 4)));
                                  }
                                });
                              }
                            : null);
                  }),
                ),
              ],
            ),
          )),
        );
      }),
    ));
  }
}
