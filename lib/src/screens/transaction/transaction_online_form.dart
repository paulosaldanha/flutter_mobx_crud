import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:estruturabasica/src/controllers/transaction_online_controller.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_online_form_part2.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TransactionOnlineForm extends StatelessWidget {
  final transactiononline = TransactionOnline();
  TransactionOnlineController transactiononlineController =
      TransactionOnlineController();

  TransactionOnlineForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Criar transação Online'),
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
                          transactiononlineController.transactiononline.setNome,
                      errorText: transactiononlineController.validateName);
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
                      onChanged: transactiononlineController
                          .transactiononline.setEmail,
                      errorText: transactiononlineController.validateEmail);
                },
              ),
              SizedBox(
                height: 10,
              ),
              labelFieldRequired("Documento"),
              SizedBox(height: 5),
              Observer(
                builder: (_) {
                  return numberField(
                      onChanged: transactiononlineController
                          .transactiononline.setDocument,
                      errorText: transactiononlineController.validateDocument);
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
                          return numberField(
                              onChanged: transactiononlineController
                                  .transactiononline.setDdd,
                              errorText:
                                  transactiononlineController.validateDdd);
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
                          return numberField(
                              onChanged: transactiononlineController
                                  .transactiononline.setTelephone,
                              errorText: transactiononlineController
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
                      onPressed: transactiononlineController.isValid
                          ? () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      TransactionOnlineFormPart2(
                                          transactiononline,
                                          transactiononlineController)));
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
