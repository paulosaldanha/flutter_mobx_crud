import 'package:cloud_crm/src/components/custom_icon_button.dart';
import 'package:cloud_crm/src/controllers/home/home_page_controller.dart';
import 'package:cloud_crm/src/controllers/login/auth_controller.dart';
import 'package:cloud_crm/src/controllers/login/login_controller.dart';
import 'package:cloud_crm/src/routes/routing_constants.dart';
import 'package:cloud_crm/src/utils/check_connection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  LoginController _loginController = LoginController();
  ReactionDisposer _loginReaction;
  final authController = GetIt.I.get<AuthController>();
  final homeController = GetIt.I.get<HomePageController>();

  @override
  void initState() {
    CheckConnection.checkConnection().then((value) {
      if (value == false) {
        Fluttertoast.showToast(
            msg: "Para logar é necessário estar online.",
            toastLength: Toast.LENGTH_LONG);
      }
    });
    super.initState();
    _loginReaction =
        reaction((_) => _loginController.request.status, (_) async {
          if (_loginController.request?.status == FutureStatus.fulfilled) {
            homeController.loadData(reload: true);
            homeController.isFirstLoadData = false;
            await authController.getLoginPayload();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(HomePageViewRoute, (route) => false);
          }
          if (_loginController.request?.status == FutureStatus.rejected) {
            showLoginError(_loginController.request.error);
          }
        });
  }

  showLoginError(dynamic error) {
    String message = "Ocorreu um erro, por favor tente novamente mais tarde.";
    if (error is DioError) {
      if (error.response.statusCode == 401) {
        if (error.response.data['error'] != null) {
          message = error.response.data['error'];
        }
      }
    }
    showDialog(
        context: context,
        child: AlertDialog(title: Text("Atenção!"), content: Text(message)));
  }

  @override
  void dispose() {
    _loginReaction();
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
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                      TextFormField(
                        onChanged: _loginController.setUsername,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(8.0),
                            ),
                          ),
                          hintText: "email@gmail.com",
                          labelText: "Usuario",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Observer(builder: (_) {
                        return TextFormField(
                          onChanged: _loginController.setPassword,
                          obscureText: !_loginController.passwordVisible,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(8.0),
                                ),
                              ),
                              suffixIcon: CustomIconButton(
                                radius: 32,
                                iconData: _loginController.passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                onTap:
                                _loginController.togglePasswordVisibility,
                              ),
                              hintText: "********",
                              labelText: "Senha"),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 0),
                              child: Observer(builder: (_) {
                                return RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    color: Colors.green,
                                    onPressed: _loginController.loginPressed
                                        ? () async {
                                      if (await CheckConnection
                                          .checkConnection() ==
                                          false) {
                                        Fluttertoast.showToast(
                                            msg:
                                            "Para logar é necessário estar online.",
                                            toastLength:
                                            Toast.LENGTH_LONG);
                                      } else {
                                        await _loginController.submit();
                                      }
                                    }
                                        : null,
                                    child: _loginController.isLoading
                                        ? Container(
                                      width: 50,
                                      height: 50,
                                      child: const Center(
                                        child:
                                        CircularProgressIndicator(),
                                      ),
                                    )
                                        : Container(
                                      height: 50,
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ));
                              }),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RecoverPasswordRoute);
                            },
                            child: const Text(
                              "Esqueceu sua senha?",
                              style: TextStyle(color: Colors.lightBlue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}