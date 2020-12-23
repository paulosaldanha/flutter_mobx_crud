import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:estruturabasica/src/controllers/transaction_online_controller.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_online_form_part2.dart';
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
        title: Text('Criar transação - Online'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) {
                  return _textField(
                      labelText: "Nome",
                      onChanged:
                          transactiononlineController.transactiononline.setNome,
                      errorText: transactiononlineController.validateName);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                      labelText: "Email",
                      onChanged: transactiononlineController
                          .transactiononline.setEmail,
                      errorText: transactiononlineController.validateEmail);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                      labelText: "Documento",
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
                    child: Container(child: Observer(
                      builder: (_) {
                        return _numberField(
                            labelText: "DDD",
                            onChanged: transactiononlineController
                                .transactiononline.setDdd,
                            errorText: transactiononlineController.validateDdd);
                      },
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 7,
                    child: Observer(
                      builder: (_) {
                        return _numberField(
                            labelText: "Telefone",
                            onChanged: transactiononlineController
                                .transactiononline.setTelephone,
                            errorText:
                                transactiononlineController.validateTelephone);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Observer(
                builder: (_) {
                  return ButtonTheme(
                      minWidth: 1000,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(
                                color: Color.fromRGBO(0, 74, 173, 1)),
                          ),
                          color: Colors.white,
                          onPressed: transactiononlineController.isValid
                              ? () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          TransactionOnlineFormPart2(
                                              transactiononline,
                                              transactiononlineController)));
                                }
                              : null,
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 74, 173, 1),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_textField({String labelText, onChanged, String Function() errorText}) {
  return TextFormField(
    onChanged: onChanged,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText()),
  );
}

_numberField(
    {String labelText,
    onChanged,
    String Function() errorText,
    String prefix,
    bool enable}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    onChanged: onChanged,
    enabled: enable,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
        prefixText: prefix),
  );
}
