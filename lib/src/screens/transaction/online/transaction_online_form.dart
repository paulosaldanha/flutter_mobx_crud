import 'package:estruturabasica/src/controllers/transaction/online/transaction_online_controller.dart';
import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:estruturabasica/src/screens/transaction/online/transaction_online_form_part2.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/components/mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TransactionOnlineForm extends StatelessWidget {
  final transactionOnline = TransactionOnline();
  TransactionOnlineController transactionOnlineController =
      TransactionOnlineController();

  TransactionOnlineForm();

  MaskTextInputFormatter maskDDD = maskDdd();
  MaskTextInputFormatter maskTelephone = maskPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Criar transação online'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              labelFieldRequired("Nome"),
              SizedBox(height: 5),
              Observer(
                builder: (_) {
                  return textField(
                      onChanged:
                          transactionOnlineController.transactionOnline.setNome,
                      errorText: transactionOnlineController.validateName);
                },
              ),
              SizedBox(
                height: 10,
              ),
              labelFieldRequired("Email"),
              SizedBox(height: 5),
              Observer(
                builder: (_) {
                  return textField(
                      onChanged: transactionOnlineController
                          .transactionOnline.setEmail,
                      errorText: transactionOnlineController.validateEmail);
                },
              ),
              SizedBox(
                height: 10,
              ),
              labelFieldRequired("Documento"),
              SizedBox(height: 5),
              Observer(
                builder: (_) {
                  return numberMaskField(
                      mask: transactionOnlineController.maskDocument,
                      onChanged: transactionOnlineController
                          .transactionOnline.setDocument,
                      errorText: transactionOnlineController.validateDocument);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(children: [
                      labelFieldRequired("DDD"),
                      SizedBox(height: 5),
                      Observer(
                        builder: (_) {
                          return numberMaskField(
                              mask: maskDDD,
                              onChanged: transactionOnlineController
                                  .transactionOnline.setDdd,
                              errorText:
                                  transactionOnlineController.validateDdd);
                        },
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(children: [
                      labelFieldRequired("Telefone"),
                      SizedBox(height: 5),
                      Observer(
                        builder: (_) {
                          return numberMaskField(
                              mask: maskTelephone,
                              onChanged: transactionOnlineController
                                  .transactionOnline.setTelephone,
                              errorText: transactionOnlineController
                                  .validateTelephone);
                        },
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 1000,
                color: Colors.white,
                child: Observer(
                  builder: (_) {
                    return FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Color.fromRGBO(0, 74, 173, 1)),
                      ),
                      color: Colors.white,
                      textColor: Color.fromRGBO(0, 74, 173, 1),
                      padding: EdgeInsets.all(10.0),
                      onPressed: transactionOnlineController.isValid
                          ? () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      TransactionOnlineFormPart2(
                                          transactionOnline,
                                          transactionOnlineController)));
                            }
                          : null,
                      child: Text(
                        "Continuar".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
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
    );
  }
}
