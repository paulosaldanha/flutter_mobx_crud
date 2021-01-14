import 'package:estruturabasica/src/components/mask.dart';
import 'package:estruturabasica/src/controllers/auth/register_controller.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/components/custom_icon_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

RegisterController registerController = RegisterController();

MaskTextInputFormatter maskCEP = maskCep();

empresarial(context) {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            Container(
              child: label("Dados da Empresa",
                  fontSize: 20, align: MainAxisAlignment.center),
            ),
            Divider(),
            labelFieldRequired("Documento"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return numberField(
                  hint: 'RUC / CPF / CNPJ',
                  suffix: registerController.suffixDocument,
                  prefixIcon: Icon(Icons.portrait),
                  onChanged: registerController.register.setdocumento,
                  errorText: registerController.validateDocument);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Razão Social"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                  hint: 'Razão Social',
                  prefix: Icon(Icons.business),
                  onChanged: registerController.register.setRazaoSocial,
                  errorText: registerController.validateCompanyName);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Nome Responsável"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                  hint: 'Nome',
                  prefix: Icon(Icons.person_outline),
                  onChanged: registerController.register.setResponsavel,
                  errorText: registerController.validateName);
            }),
            SizedBox(height: 10),
            Container(
              child: label("Endereço",
                  fontSize: 20, align: MainAxisAlignment.center),
            ),
            Divider(),
            labelFieldRequired("CEP"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return numberMaskField(
                  hint: '00000-000',
                  mask: maskCEP,
                  prefixIcon: Icon(Icons.location_on_outlined),
                  onChanged: registerController.register.setCep,
                  errorText: registerController.validateCep);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Nome da rua"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                  hint: 'Nome da rua',
                  prefix: Icon(Icons.streetview),
                  onChanged: registerController.register.setRua,
                  errorText: registerController.validateRua);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Número"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return numberField(
                  hint: '123',
                  prefixIcon: Icon(Icons.money),
                  onChanged: registerController.register.setNumero,
                  errorText: registerController.validateNumero);
            }),
            SizedBox(height: 10),
            label("Complemento"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return numberField(
                  hint: 'Complemento',
                  prefixIcon: Icon(Icons.info_outline),
                  onChanged: registerController.register.setNumero,
                  errorText: registerController.validateNumero);
            }),
            SizedBox(height: 10),
            Container(
              child: label("Dados de Acesso",
                  fontSize: 20, align: MainAxisAlignment.center),
            ),
            Divider(),
            labelFieldRequired("Email"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                  hint: 'example@mail.com',
                  prefix: Icon(Icons.alternate_email),
                  onChanged: registerController.register.setResponsavelEmail,
                  errorText: registerController.validateEmail);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Senha"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                hint: '********',
                prefix: Icon(Icons.lock_outlined),
                onChanged: registerController.register.setSenha,
                errorText: registerController.validatePassword,
                suffix: CustomIconButton(
                  radius: 32,
                  iconData: registerController.passwordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onTap: registerController.visibilityPassword,
                ),
                obscure: registerController.passwordVisible,
              );
            }),
            SizedBox(height: 10),
            labelFieldRequired("Confirme sua senha"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                hint: '********',
                prefix: Icon(Icons.lock_outlined),
                onChanged: registerController.setConfirmPassword,
                errorText: registerController.validateConfirmPassword,
                suffix: CustomIconButton(
                  radius: 32,
                  iconData: registerController.confirmPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onTap: registerController.visibilityConfirmPassword,
                ),
                obscure: registerController.confirmPasswordVisible,
              );
            }),
            Container(
              width: 1000,
              padding: EdgeInsets.only(top: 20),
              child: Observer(builder: (_) {
                return RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 17.0),
                    elevation: 11,
                    highlightElevation: 0,
                    color: Color.fromRGBO(0, 74, 173, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Observer(
                      builder: (_) {
                        return !registerController.loading
                            ? Text(
                                'CADASTRAR'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            : Center(
                                child: SizedBox(
                                  child: CircularProgressIndicator(),
                                  height: 20.0,
                                  width: 20.0,
                                ),
                              );
                      },
                    ),
                    onPressed: registerController.isValid
                        ? () {
                            registerController.loading = true;
                            registerController
                                .createFastAccount()
                                .then((value) {
                              registerController.loading = false;
                              int status = value["status"] ?? 0;
                              if (status > 0) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(status.toString() +
                                        " - " +
                                        value['message']),
                                    duration: Duration(seconds: 4)));
                              } else {
                                registerController.cleanData();
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Conta Criada"),
                                    duration: Duration(seconds: 4)));

                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pop(context);
                                  Navigator.of(context)
                                      .pushNamed(LoginPageRoute);
                                });
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
