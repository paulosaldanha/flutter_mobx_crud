import 'package:estruturabasica/src/components/custom_icon_button.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/controllers/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController authControllerNew = LoginController();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => authControllerNew.auth.isLogged, (auth) {
      if (auth) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return Form(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
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
                          onChanged: authControllerNew.setEmail,
                          // errorText: authController.validateEmail,
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
                          obscure: !authControllerNew.passwordVisible,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: authControllerNew.passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onTap: authControllerNew.togglePasswordVisibility,
                          ),
                          onChanged: authControllerNew.setPassword,
                          // errorText: authController.validatePassword,
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
                              child: authControllerNew.loading
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
                              onPressed: authControllerNew.loginPressed
                                  ? () async {
                                      await authControllerNew.login();
                                      if (authControllerNew.auth.isLogged ==
                                          false) {
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              authControllerNew.auth.errorMsg),
                                          duration: Duration(seconds: 4),
                                        ));
                                      }
                                    }
                                  : null);
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
                    ),
                    InkWell(
                      onTap: () async {
                        const url =
                            'https://play.google.com/store/apps/details?id=br.srv.secure.app.ecommercebank';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset('images/splash.png'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Abra sua conta agora! \n Clique Aqui!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
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

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}




