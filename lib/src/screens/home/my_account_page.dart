import 'dart:convert';

import 'package:cloud_crm/src/components/custom_icon_button.dart';
import 'package:cloud_crm/src/controllers/home/my_account_controller.dart';
import 'package:cloud_crm/src/dto/login_payload_dto.dart';
import 'package:cloud_crm/src/utils/get_color_or_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class MyAccountPage extends StatelessWidget {
  final LoginPayloadDto userData;
  MyAccountPage({Key key, this.userData}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  MyAccountController _accountController = MyAccountController();

  ReactionDisposer disposer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: getCompanyColorOrDefault(),
          title: Text("Minha Conta"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        maxRadius: 70,
                        backgroundColor: Colors.black12,
                        child: userData.user.foto != null &&
                            userData.user.foto.isNotEmpty
                            ? Image.network(userData.user.foto)
                            : Icon(
                          Icons.person,
                          size: 130,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Empresa",
                            style: TextStyle(color: Colors.black45),
                          ),
                          Text(
                            userData.company.name,
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Nome",
                            style: TextStyle(color: Colors.black45),
                          ),
                          Text(
                            userData.user.nome,
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Email",
                            style: TextStyle(color: Colors.black45),
                          ),
                          Text(
                            userData.user.emailOrig,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Text(
                  "Alterar Senha",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: getCompanyColorOrDefault()),
                ),
                SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return TextFormField(
                      onChanged: _accountController.setOldPassword,
                      obscureText: !_accountController.oldPasswordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: _accountController.oldPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: _accountController.toggleOldPasswordVisibility,
                        ),
                        hintText: "********",
                        labelText: "Senha Atual",
                        errorText: _accountController.oldPasswordError,
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return TextFormField(
                      onChanged: _accountController.setNewPassword,
                      obscureText: !_accountController.newPasswordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: _accountController.newPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: _accountController.toggleNewPasswordVisibility,
                        ),
                        hintText: "********",
                        labelText: "Senha Nova",
                        errorText: _accountController.newPasswordError,
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return TextFormField(
                      onChanged: _accountController.setConfirmPassword,
                      obscureText: !_accountController.confirmPasswordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: _accountController.confirmPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: _accountController
                              .toggleConfirmPasswordVisibility,
                        ),
                        hintText: "********",
                        labelText: "Confirme Senha Nova",
                        errorText: _accountController.confirmPasswordError,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: Observer(
                    builder: (_) {
                      return RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: getCompanyColorOrDefault(),
                        onPressed: () async {
                          await _accountController.submit().then((value) {
                            var retorno = jsonDecode(value.toString());
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                title: Text("Alteração de Senha"),
                                content: Text(retorno["status"] + "!"),
                              ),
                            );
                          });
                        },
                        child: _accountController.isLoading
                            ? Container(
                          width: 20,
                          height: 20,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                            : Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Alterar Senha",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}