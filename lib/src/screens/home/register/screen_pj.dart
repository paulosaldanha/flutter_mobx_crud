import 'package:estruturabasica/src/components/mask.dart';
import 'package:estruturabasica/src/controllers/auth/people_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/components/custom_icon_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

PeopleController peopleController = PeopleController();

MaskTextInputFormatter maskCNPJ = maskCnpj();
MaskTextInputFormatter maskCEP = maskCep();
MaskTextInputFormatter maskDddPhone = maskDDDPhone();

pessoaPJ(context) {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            Container(
              child: label("Dados da Pessoa Juridica",
                  fontSize: 20, align: MainAxisAlignment.center),
            ),
            Divider(),
            labelFieldRequired("CNPJ"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return numberMaskField(
                  hint: 'CNPJ',
                  mask: maskCNPJ,
                  prefixIcon: Icon(Icons.wysiwyg),
                  onChanged: peopleController.people.setDocument,
                  errorText: peopleController.validateDocument);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Nome Completo"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                  hint: 'Nome Completo',
                  prefix: Icon(Icons.person_outlined),
                  onChanged: peopleController.people.setNome,
                  errorText: peopleController.validateName);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Telefone"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return numberMaskField(
                  hint: 'Telefone',
                  mask: maskDddPhone,
                  prefixIcon: Icon(Icons.phone_outlined),
                  onChanged: peopleController.people.setTelephone,
                  errorText: peopleController.validateTelephone);
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
                  onChanged: peopleController.people.setCep,
                  errorText: peopleController.validateCep);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Nome da rua"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                  hint: 'Nome da rua',
                  prefix: Icon(Icons.streetview),
                  onChanged: peopleController.people.setRua,
                  errorText: peopleController.validateRua);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Número"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return numberField(
                  hint: '123',
                  prefixIcon: Icon(Icons.money),
                  onChanged: peopleController.people.setNumero,
                  errorText: peopleController.validateNumero);
            }),
            SizedBox(height: 10),
            label("Complemento"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return numberField(
                  hint: 'Complemento',
                  prefixIcon: Icon(Icons.info_outline),
                  onChanged: peopleController.people.setNumero,
                  errorText: peopleController.validateNumero);
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
                  onChanged: peopleController.people.setEmail,
                  errorText: peopleController.validateEmail);
            }),
            SizedBox(height: 10),
            labelFieldRequired("Senha"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                hint: '********',
                prefix: Icon(Icons.lock_outlined),
                onChanged: peopleController.people.setPassword,
                errorText: peopleController.validatePassword,
                suffix: CustomIconButton(
                  radius: 32,
                  iconData: peopleController.passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onTap: peopleController.visibilityPassword,
                ),
                obscure: peopleController.passwordVisible,
              );
            }),
            SizedBox(height: 10),
            labelFieldRequired("Confirme sua senha"),
            SizedBox(height: 5),
            Observer(builder: (_) {
              return textField(
                hint: '********',
                prefix: Icon(Icons.lock_outlined),
                onChanged: peopleController.setConfirmPassword,
                errorText: peopleController.validateConfirmPassword,
                suffix: CustomIconButton(
                  radius: 32,
                  iconData: peopleController.confirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onTap: peopleController.visibilityConfirmPassword,
                ),
                obscure: peopleController.confirmPasswordVisible,
              );
            }),
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
                    child: Text(
                      'CADASTRAR'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    onPressed: peopleController.isValid
                        ? () {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Não foi possivel criar sua conta"),
                                duration: Duration(seconds: 4)));
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
