import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/controllers/auth/recoverpassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RecoverPasswordPage extends StatelessWidget {
  final recoverPasswordController = RecoverPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
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
                      child: Image.asset(
                        'images/transp_logo.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Problemas com login ?",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Insira o email que você esqueceu da senha, enviaremos a você um link para voltar a acessar novamente sua conta.",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return textField(
                          labelText: 'Email',
                          hint: 'example@mail.com',
                          prefix: Icon(Icons.alternate_email),
                          onChanged: recoverPasswordController.setEmail,
                          errorText: recoverPasswordController.emailError);
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
                      child: !recoverPasswordController.loading
                          ? Text(
                              'Recuperar Senha'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )
                          : Center(
                              child: SizedBox(
                                child: CircularProgressIndicator(),
                                width: 20,
                                height: 20,
                              ),
                            ),
                      onPressed: recoverPasswordController.isValid
                          ? () {
                              recoverPasswordController.loading = true;
                              recoverPasswordController
                                  .solicitPassword()
                                  .then((value) {
                                recoverPasswordController.loading = false;
                                var result = value.message ?? "";
                                if (result.isNotEmpty == true) {
                                  final snackBar = SnackBar(
                                      content: Text(result),
                                      duration: Duration(seconds: 4));
                                  Scaffold.of(context).showSnackBar(snackBar);
                                } else {
                                  final snackBar = SnackBar(
                                      content: Text(value.message),
                                      duration: Duration(seconds: 4));
                                  Scaffold.of(context).showSnackBar(snackBar);
                                }
                                if (value != null) {
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text("Conta Criada")));
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
        ),
      ),
    );
  }
}
