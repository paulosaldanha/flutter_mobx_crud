import 'package:estruturabasica/src/components/custom_text_field.dart';
import 'package:estruturabasica/src/models/recoverpassword.dart';
import 'package:estruturabasica/src/services/recoverpassword_service.dart';
import 'package:flutter/material.dart';

class RecoverPasswordPage extends StatefulWidget {
  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  RecoverPasswordModel requestModel;
  bool _secureText = true;

  @override
  void initState() {
    requestModel = new RecoverPasswordModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: globalFormKey,
        child: SingleChildScrollView(
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
                height: 45,
              ),
              Center(
                child: Text(
                  "Problemas com login ?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Text(
                    "Insira o email que você esqueceu da senha, enviaremos a você um link para voltar a acessar novamente sua conta.",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              CustomTextField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'O campo email deve ser preenchido.';
                  } else if (value.length > 1) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (emailValid) {
                      return null;
                    } else {
                      return 'Digite um email válidos';
                    }
                  }
                  return null;
                },
                onSaved: (input) => requestModel.email = input,
                hint: 'usuario@email.com',
                labelText: 'Email',
                prefix: Icon(Icons.person),
                textInputType: TextInputType.emailAddress,
                enabled: true,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 17.0),
                    elevation: 11,
                    highlightElevation: 0,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      'Recuperar Senha'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (validateAndSave()) {
                        RecoverPasswordService recoverPasswordService =
                            new RecoverPasswordService();
                        recoverPasswordService
                            .recoverpassword(requestModel)
                            .then(
                          (value) {
                            var result = value.message ?? "";
                            print(result);
                            if (result.isNotEmpty == true) {
                              final snackBar = SnackBar(
                                content: Text(result),
                              );
                              scaffoldKey.currentState.showSnackBar(snackBar);
                            } else {
                              final snackBar = SnackBar(
                                content: Text(value.message),
                              );
                              scaffoldKey.currentState.showSnackBar(snackBar);
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
