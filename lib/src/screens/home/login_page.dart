import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  final authController = AuthController();

  @override
  void initState() {
    autoLogIn();
  }

  void autoLogIn() async {
    await authController.checkIfIsLogged().then((value) {
      if (value == true) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (authController.visibilityBtn) {
      authController.onPressed = () async {
        authController.login(context);
      };
    }
    return Scaffold(body: Builder(builder: (context) {
      return Form(
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
                      child: Image.network(
                        'https://i.imgur.com/ndinJu4.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Observer(
                      builder: (_) {
                        return textField(
                          labelText: 'Email',
                          hint: 'usuario@email.com',
                          prefix: Icon(Icons.person),
                          onChanged: authController.auth.setEmail,
                          errorText: authController.validateEmail,
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Observer(
                      builder: (_) {
                        return textField(
                          labelText: 'Senha',
                          hint: '********',
                          prefix: Icon(Icons.lock),
                          obscure: true,
                          onChanged: authController.auth.setPassword,
                          errorText: authController.validatePassword,
                        );
                      },
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'recoverpassword');
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Esqueceu sua senha?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Container(
                      width: 1000,
                      padding: const EdgeInsets.all(10),
                      child: Observer(
                        builder: (_) {
                          return RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 17.0),
                              elevation: 11,
                              highlightElevation: 0,
                              color: Color.fromRGBO(0, 74, 173, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: authController.loading
                                  ? Center(
                                      child: SizedBox(
                                      child: CircularProgressIndicator(),
                                      height: 20.0,
                                      width: 20.0,
                                    ))
                                  : Text(
                                      'Acessar'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                              onPressed: authController.onPressed);
                        },
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: new RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text: 'Não possui uma conta ? | ',
                              style: new TextStyle(color: Colors.black),
                            ),
                            new TextSpan(
                              text: 'REGISTRAR',
                              style: new TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }));
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
