import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:estruturabasica/src/controllers/transaction_online_controller.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(child: Observer(
                      builder: (_) {
                        return _numberField(
                            labelText: "Valor",
                            onChanged: transactiononlineController
                                .transactiononline.setValue,
                            errorText:
                                transactiononlineController.validateValue,
                            prefix: "R\$ ");
                      },
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(child: Observer(
                      builder: (_) {
                        return _numberField(
                            labelText: "Parcela",
                            onChanged: transactiononlineController
                                .transactiononline.setInstallments,
                            errorText:
                            transactiononlineController.validateInstallments);
                      },
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                      labelText: "Nome do Cartão",
                      onChanged: transactiononlineController
                          .transactiononline.setCardName,
                      errorText: transactiononlineController.validateCardName);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                      labelText: "Numero do Cartão",
                      onChanged: transactiononlineController
                          .transactiononline.setCardNumber,
                      errorText: transactiononlineController.validateCardNumber);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(child: Observer(
                      builder: (_) {
                        return _numberField(
                            labelText: "Validade Cartão",
                            onChanged: transactiononlineController
                                .transactiononline.setDateExpiration,
                            errorText: transactiononlineController.validateDateExpiration);
                      },
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: Observer(
                      builder: (_) {
                        return _numberField(
                            labelText: "CVV",
                            onChanged: transactiononlineController
                                .transactiononline.setCardCVV,
                            errorText:
                            transactiononlineController.validateCardCVV);
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: Color.fromRGBO(0, 74, 173, 1),
                          onPressed: transactiononlineController.isValid
                              ? () {
                                  transactiononlineController
                                      .createTransctionTransactionOnline();
                                  Navigator.pop(context);
                                  Flushbar(
                                    title: "Sucesso",
                                    message:
                                        "Transação Online criado com sucesso!",
                                    duration: Duration(seconds: 2),
                                  )..show(context);
                                }
                              : null,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Criar Transaction Online",
                              style: TextStyle(color: Colors.white),
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

