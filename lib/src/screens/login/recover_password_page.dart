import 'dart:convert';

import 'package:cloud_crm/src/controllers/login/recover_password_controller.dart';
import 'package:cloud_crm/src/routes/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key key}) : super(key: key);

  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final formKey = GlobalKey<FormState>();
  RecoverPasswordController _recoverController = RecoverPasswordController();

  ReactionDisposer disposer;

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/logo_novo.png",
                      width: 130,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Observer(builder: (_) {
                      return TextFormField(
                        onChanged: _recoverController.setUsername,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          hintText: "email@gmail.com",
                          labelText: "Usuario",
                          errorText: _recoverController.usernameError,
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 75,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 0),
                            child: Observer(
                              builder: (_) {
                                return RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  color: Colors.green,
                                  onPressed: _recoverController.isValid
                                      ? () async {
                                    await _recoverController
                                        .submit()
                                        .then((value) {
                                      var retorno =
                                      jsonDecode(value.toString());
                                      showDialog(
                                        context: context,
                                        child: AlertDialog(
                                          title: Text("Sucesso"),
                                          content:
                                          Text(retorno["message"]),
                                        ),
                                      );
                                    }).catchError((value) {
                                      print(value.response);
                                      var retorno = jsonDecode(
                                          value.response.toString());
                                      showDialog(
                                        context: context,
                                        child: AlertDialog(
                                          title: Text("Erro"),
                                          content: Text(retorno["error"]),
                                        ),
                                      );
                                    });
                                  }
                                      : null,
                                  child: _recoverController.isLoading
                                      ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                      : Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      "Recuperar Senha",
                                      style:
                                      TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              color: Colors.red[800],
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    LoginRoute, (route) => false);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Voltar",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}