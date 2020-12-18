import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:estruturabasica/src/controllers/transaction_online_controller.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TransactionOnlineFormPart3 extends StatelessWidget {
  final transactiononline;
  final transactiononlineController;

  TransactionOnlineFormPart3(this.transactiononline, this.transactiononlineController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Criar transação - Online Parte 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Color.fromRGBO(0, 74, 173, 1)),
                          ),
                          color: Colors.white,
                          onPressed: transactiononlineController.isValidPart3
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
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Criar",
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

