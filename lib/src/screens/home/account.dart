import 'package:estruturabasica/src/components/custom_icon_button.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/controllers/home/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Account extends StatelessWidget {
  final accountController = AccountController();
  final authController;

  Account(this.authController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Conta"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: authController.auth.companyLogo == null
                          ? CircleAvatar(
                              minRadius: 80,
                              backgroundColor: Colors.grey[300],
                              child: Image.asset(
                                "images/transp_logo.png",
                                width: 150,
                              ),
                            )
                          : CircleAvatar(
                              minRadius: 80,
                              backgroundColor: Colors.grey[300],
                              child: Image.network(
                                authController.auth.companyLogo,
                                width: 150,
                              ),
                            )),
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          label("Empresa", fontSize: 14, color: Colors.black45),
                          label(authController.auth.nameCompany ?? "",
                              fontSize: 18, color: Colors.black54),
                          SizedBox(height: 15),
                          label("Usuário", fontSize: 14, color: Colors.black45),
                          label(authController.auth.name ?? "",
                              fontSize: 18, color: Colors.black54),
                          SizedBox(height: 15),
                          label("Email", fontSize: 14, color: Colors.black45),
                          label(authController.auth.email ?? "",
                              fontSize: 18, color: Colors.black54)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(20),
              child: true
                  ? Text("")
                  : Column(
                      children: [
                        label("Alterar Senha",
                            fontSize: 20, align: MainAxisAlignment.center),
                        SizedBox(height: 15),
                        label("Senha"),
                        SizedBox(height: 5),
                        Observer(builder: (_) {
                          return textField(
                              hint: "********",
                              prefix: Icon(Icons.lock_outlined),
                              onChanged: accountController.setPassword,
                              errorText: accountController.passwordError,
                              suffix: CustomIconButton(
                                radius: 32,
                                iconData: accountController.passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                onTap: accountController.visibilityPassword,
                              ),
                              obscure: accountController.passwordVisible);
                        }),
                        SizedBox(height: 10),
                        label("Confirma Senha"),
                        SizedBox(height: 5),
                        Observer(builder: (_) {
                          return textField(
                              hint: "********",
                              prefix: Icon(Icons.lock_outlined),
                              onChanged: accountController.setConfirmPassword,
                              errorText: accountController.confirmPasswordError,
                              suffix: CustomIconButton(
                                radius: 32,
                                iconData:
                                    accountController.confirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                onTap:
                                    accountController.visibilityConfirmPassword,
                              ),
                              obscure:
                                  accountController.confirmPasswordVisible);
                        }),
                      ],
                    ),
            ),
            Container(
              width: 1000,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: true
                  ? Text("")
                  : Observer(builder: (_) {
                      return RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 17.0),
                          elevation: 11,
                          highlightElevation: 0,
                          color: Color.fromRGBO(0, 74, 173, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            'Alterar Senha'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text("Olá")));
                          });
                    }),
            ),
          ],
        ),
      ),
    );
  }
}
