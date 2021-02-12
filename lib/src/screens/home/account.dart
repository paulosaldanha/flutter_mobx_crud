import 'dart:io';

import 'package:ecommerceBankPay/src/components/custom_icon_button.dart';
import 'package:ecommerceBankPay/src/components/fields.dart';
import 'package:ecommerceBankPay/src/components/image_source_dialog.dart';
import 'package:ecommerceBankPay/src/controllers/auth/auth_controller.dart';
import 'package:ecommerceBankPay/src/controllers/home/account_controller.dart';
import 'package:ecommerceBankPay/src/util/show_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final accountController = AccountController();
  final authController = GetIt.I.get<AuthController>();
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => accountController.request.status, (_) async {
      if (accountController.request?.status == FutureStatus.fulfilled) {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      }
      if (accountController.request?.status == FutureStatus.rejected) {
        showError(accountController.request.error, context);
      }
    });
    disposer = reaction((_) => authController.request.status, (_) async {
      if (authController.request?.status == FutureStatus.fulfilled) {
        authController.auth.companyLogo = authController.request.value.urlImage;
      }
      if (authController.request?.status == FutureStatus.rejected) {
        showError(authController.request.error, context);
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      authController.setfile(image);
      Navigator.of(context).pop();
    }

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
              child: Observer(
                builder: (_) => Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => ImageSourceDialog(
                                  onImageSelected, authController),
                            );
                          },
                          child: authController.file != null
                              ? CircleAvatar(
                                  minRadius: 80,
                                  backgroundColor: Colors.grey[300],
                                  backgroundImage:
                                      FileImage(authController.file),
                                )
                              : authController.auth.companyLogo == null
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
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            label("Empresa",
                                fontSize: 14, color: Colors.black45),
                            label(authController.auth.nameCompany ?? "",
                                fontSize: 18, color: Colors.black54),
                            SizedBox(height: 15),
                            label("Usuário",
                                fontSize: 14, color: Colors.black45),
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
            ),
            Divider(),
            Observer(builder: (_) {
              return authController.file != null
                  ? Container(
                      width: 1000,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 17.0),
                          elevation: 11,
                          highlightElevation: 0,
                          color: Color.fromRGBO(0, 74, 173, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: !authController.isLoadingRequestImage
                              ? Text(
                                  'Salvar'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                          onPressed: !authController.isLoadingRequestImage
                              ? () {
                                  authController.changeImageCompany();
                                }
                              : null),
                    )
                  : Text("");
            }),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 1000,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 17.0),
                  elevation: 11,
                  highlightElevation: 0,
                  color: Color.fromRGBO(0, 74, 173, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Alterar senha'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    accountController.setIsChangePassword();
                  }),
            ),
            SizedBox(
              height: 15,
            ),
            Observer(
                builder: (_) => accountController.isChangePassword
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                label("Alterar Senha",
                                    fontSize: 20,
                                    align: MainAxisAlignment.center),
                                SizedBox(height: 15),
                                label("Senha atual"),
                                SizedBox(height: 5),
                                Observer(builder: (_) {
                                  return textField(
                                      hint: "********",
                                      prefix: Icon(Icons.lock_outlined),
                                      onChanged:
                                          accountController.setOldPassword,
                                      errorText:
                                          accountController.oldPasswordError,
                                      suffix: CustomIconButton(
                                        radius: 32,
                                        iconData:
                                            accountController.passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                        onTap: accountController
                                            .visibilityPassword,
                                      ),
                                      obscure:
                                          accountController.passwordVisible);
                                }),
                                SizedBox(height: 15),
                                label("Senha"),
                                SizedBox(height: 5),
                                Observer(builder: (_) {
                                  return textField(
                                      hint: "********",
                                      prefix: Icon(Icons.lock_outlined),
                                      onChanged: accountController.setPassword,
                                      errorText:
                                          accountController.passwordError,
                                      suffix: CustomIconButton(
                                        radius: 32,
                                        iconData:
                                            accountController.passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                        onTap: accountController
                                            .visibilityPassword,
                                      ),
                                      obscure:
                                          accountController.passwordVisible);
                                }),
                                SizedBox(height: 10),
                                label("Confirma senha"),
                                SizedBox(height: 5),
                                Observer(builder: (_) {
                                  return textField(
                                      hint: "********",
                                      prefix: Icon(Icons.lock_outlined),
                                      onChanged:
                                          accountController.setConfirmPassword,
                                      errorText: accountController
                                          .confirmPasswordError,
                                      suffix: CustomIconButton(
                                        radius: 32,
                                        iconData: accountController
                                                .confirmPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        onTap: accountController
                                            .visibilityConfirmPassword,
                                      ),
                                      obscure: accountController
                                          .confirmPasswordVisible);
                                }),
                              ],
                            ),
                          ),
                          Container(
                            width: 1000,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Observer(builder: (_) {
                              return RaisedButton(
                                  padding: EdgeInsets.symmetric(vertical: 17.0),
                                  elevation: 11,
                                  highlightElevation: 0,
                                  color: Color.fromRGBO(0, 74, 173, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: !accountController.isLoadingRequest
                                      ? Text(
                                          'Salvar alteração'.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                  onPressed: accountController.isValid
                                      ? () {
                                          accountController.changePassword();
                                        }
                                      : null);
                            }),
                          ),
                          SizedBox(height: 20),
                        ],
                      )
                    : Text(""))
          ],
        ),
      ),
    );
  }
}
