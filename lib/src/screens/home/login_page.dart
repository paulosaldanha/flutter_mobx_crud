import 'package:estruturabasica/src/components/custom_text_field.dart';
import 'package:estruturabasica/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  final scaffoldKey = GlobalKey<ScaffoldState>();
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
        return Scaffold(
      key: scaffoldKey,
      body: Builder(
        builder: (context){
          return Form(
            key: globalFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 4,
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
                  Observer(builder: (_) {
                    return CustomTextField(
                        hint: 'usuario@email.com',
                        labelText: 'Email',
                        prefix: Icon(Icons.person),
                        textInputType: TextInputType.emailAddress,
                        enabled: true,
                        onChanged: authController.auth.setEmail,
                        errorText: authController.validateEmail,
                        initalValue: authController.auth.email
                    );
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                        hint: '********',
                        labelText: 'Senha',
                        obscure: true,
                        prefix: Icon(Icons.lock),
                        textInputType: TextInputType.emailAddress,
                        enabled: true,
                        onChanged: authController.auth.setPassword,
                        errorText: authController.validatePassword,
                        initalValue: authController.auth.password
                    );
                  }),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'recoverpassword');
                    },
                    padding: EdgeInsets.only(right: 30),
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
                            'Acessar'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          onPressed: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            authController.isValid
                                ? {
                              await authController.add(),
                              await authController.checkIfIsLogged()
                                  ? Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)
                                  : Scaffold.of(context).showSnackBar(SnackBar(
                                content : Text(authController.getErrorLogin()),
                                duration : Duration(seconds : 4),
                              ))
                            }: null;
                          }),
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
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      )

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
