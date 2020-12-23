import 'package:estruturabasica/src/models/transaction_link.dart';
import 'package:estruturabasica/src/controllers/transaction_link_controller.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/src/material/dropdown.dart';
// ignore: must_be_immutable

class TransactionLinkForm extends StatelessWidget {
  final transactionLink = TransactionLink();
  TransactionLinkController transactionLinkController =
      TransactionLinkController();

  TransactionLinkForm();
  List _parcelas = [
    {"parcela": "1", "label": "1 Parcela"},
    {"parcela": "2", "label": "2 Parcelas"},
    {"parcela": "3", "label": "3 Parcelas"},
    {"parcela": "4", "label": "4 Parcelas"},
    {"parcela": "5", "label": "5 Parcelas"},
    {"parcela": "6", "label": "6 Parcelas"},
    {"parcela": "7", "label": "7 Parcelas"},
    {"parcela": "8", "label": "8 Parcelas"},
    {"parcela": "9", "label": "9 Parcelas"},
    {"parcela": "10", "label": "10 Parcelas"},
    {"parcela": "11", "label": "11 Parcelas"},
    {"parcela": "12", "label": "12 Parcelas"}
  ];
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Link de Pagamento'),
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
                      onChanged: transactionLinkController.link.setNome,
                      errorText: transactionLinkController.validateName);
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
                            labelText: "Valor",
                            onChanged: transactionLinkController.link.setValue,
                            errorText: transactionLinkController.validateValue,
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
                                if (transactionLinkController.link.valueTax ==
                                    null) {
                                  return Text("R\$ 0,00");
                                }
                                return Text(
                                    "R\$ ${transactionLinkController.link.valueTax.toStringAsFixed(2)}");
                              })),
                        ],
                      )))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Número de Parcelas"),
              Observer(
                builder: (_) {
                  return DropdownButton(
                      value: transactionLinkController.link.installments,
                      items: _parcelas.map((parcela) {
                        return new DropdownMenuItem(
                            value: parcela["parcela"],
                            child: new Text(parcela["label"]));
                      }).toList(),
                      onChanged: (_) {
                        transactionLinkController.link.setInstallments(_);
                      },
                      icon: Icon(Icons.credit_card),
                      isExpanded: true);
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text("Vencimento"),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  flex: 1,
                  child: _dateButton(context, "Vencimento", _dateTime,
                      transactionLinkController),
                )
              ]),
              Observer(builder: (_) {
                return Text(
                  transactionLinkController.validDate,
                  style: TextStyle(
                      fontSize: 13, color: Color.fromRGBO(209, 8, 6, 0.8)),
                );
              }),
              SizedBox(
                height: 15,
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
                          onPressed: transactionLinkController.isValid
                              ? () {
                                  transactionLinkController
                                      .createTransctionLink();
                                  Navigator.pop(context);
                                  Flushbar(
                                    title: "Sucesso",
                                    message: "Link criado com sucesso!",
                                    duration: Duration(seconds: 2),
                                  )..show(context);
                                }
                              : null,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Criar Link",
                              style: TextStyle(color: Colors.white),
                            ),
                          )));
                },
              ),
            ],
          ),
        ),
      ),
      //     Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     DisplayValueWidget(transactionLinkController, null),
      //     KeyboardWidget(transactionLinkController),
      //     ContinueBtnWidget(transactionLinkController,
      //         TransactionPaymentMethod(transactionLinkController)),
      //     Observer(builder: (_) {
      //       return transactionMposController.visibilityModalBluetooth
      //           ? BluetoothModal()
      //           : Text('');
      //     }),
      //   ],
      // ),
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
  controller.link.setDateExpiration(date);

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
          controller.link.setDateExpiration(value);
        }
        controller.validateDateExpiration();
      },
      icon: Icon(Icons.calendar_today, color: Colors.white),
      label: Observer(builder: (_) {
        return Text(
            "${controller.link.dateExpiration.day.toString()}/${controller.link.dateExpiration.month.toString()}/${controller.link.dateExpiration.year.toString()}",
            style: TextStyle(color: Colors.white));
      }));
}
