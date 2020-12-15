import 'package:estruturabasica/src/models/boleto.dart';
import 'package:estruturabasica/src/controllers/boleto_controller.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TransactionBoletoForm extends StatelessWidget {
  final boleto = Boleto();
  BoletoController boletoController = BoletoController();

  TransactionBoletoForm();

  double taxa;
  DateTime _dateTime;
  @observable
  double valueWithTax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Transação Boleto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Observer(
                builder: (_) {
                  return _textField(
                      labelText: "Nome",
                      onChanged: boletoController.boleto.setNome,
                      errorText: boletoController.validateName);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                      labelText: "Email",
                      onChanged: boletoController.boleto.setEmail,
                      errorText: boletoController.validateEmail);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                      labelText: "Documento",
                      onChanged: boletoController.boleto.setDocument,
                      errorText: boletoController.validateDocument);
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
                            onChanged: boletoController.boleto.setDdd,
                            errorText: boletoController.validateDdd);
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
                            onChanged: boletoController.boleto.setTelephone,
                            errorText: boletoController.validateTelephone);
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
                            onChanged: boletoController.boleto.setValue,
                            errorText: boletoController.validateValue,
                            prefix: "R\$ ");
                      },
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 5,
                      child: Card(
                          child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text("Valor com taxa")),
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Observer(builder: (_) {
                                if (boletoController.boleto.valueTax == null) {
                                  return Text("R\$ 0,00");
                                }
                                return Text(
                                    "R\$ ${boletoController.boleto.valueTax.toStringAsFixed(2)}");
                              })),
                        ],
                      )))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text("Vencimento"),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  flex: 1,
                  child: _dateButton(
                      context, "Vencimento", _dateTime, boletoController),
                ),
              ]),
              Observer(builder: (_) {
                return Text(
                  boletoController.validDate,
                  style: TextStyle(
                      fontSize: 13, color: Color.fromRGBO(209, 8, 6, 0.8)),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                      labelText: "Observação",
                      onChanged: boletoController.boleto.setMessage);
                },
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
                          onPressed: boletoController.isValid
                              ? () {
                                  boletoController.createTransctionBoleto();
                                  Navigator.pop(context);
                                  Flushbar(
                                    title: "Sucesso",
                                    message: "Boleto criado com sucesso!",
                                    duration: Duration(seconds: 2),
                                  )..show(context);
                                }
                              : null,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Criar Boleto",
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

_dateButton(context, String label, date, controller) {
  final date = DateTime.now();
  controller.boleto.setDateExpiration(date);

  return RaisedButton.icon(
      padding: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Color.fromRGBO(0, 74, 173, 1),
      onPressed: () async {
        final value = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2050));
        if (value != null) {
          controller.boleto.setDateExpiration(value);
        }
        bool f = controller.validateDateExpiration();
      },
      icon: Icon(Icons.calendar_today, color: Colors.white),
      label: Observer(builder: (_) {
        return Text(
            "${controller.boleto.dateExpiration.day.toString()}/${controller.boleto.dateExpiration.month.toString()}/${controller.boleto.dateExpiration.year.toString()}",
            style: TextStyle(color: Colors.white));
      }));
}
