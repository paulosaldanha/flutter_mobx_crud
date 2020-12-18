import 'package:estruturabasica/src/models/boleto.dart';
import 'package:estruturabasica/src/controllers/boleto_controller.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/screens/transaction/boleto/transaction_boleto_form_part2.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_response.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_boleto_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class TransactionBoletoForm extends StatelessWidget {
  final boleto = Boleto();

  BoletoController boletoController = BoletoController();
  TransactionBoletoController transactionBoletoController =
      TransactionBoletoController();
  TransactionBoletoForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 74, 173, 1),
          title: Text('Gerar Boleto'),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 25),
            color: Color.fromRGBO(0, 74, 173, 1),
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      labelFieldRequired("Nome completo"),
                      Observer(
                        builder: (_) {
                          return textField(
                              onChanged: boletoController.boleto.setNome,
                              errorText: boletoController.validateName);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      labelFieldRequired("Documento"),
                      Observer(
                        builder: (_) {
                          return numberField(
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
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  labelFieldRequired("DDD"),
                                  Container(child: Observer(
                                    builder: (_) {
                                      return numberField(
                                          onChanged:
                                              boletoController.boleto.setDdd,
                                          errorText:
                                              boletoController.validateDdd);
                                    },
                                  ))
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 7,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    labelFieldRequired("Telefone"),
                                    Container(child: Observer(
                                      builder: (_) {
                                        return numberField(
                                            onChanged: boletoController
                                                .boleto.setTelephone,
                                            errorText: boletoController
                                                .validateTelephone);
                                      },
                                    ))
                                  ])),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      labelFieldRequired("Data de Vencimento"),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: dateButton(
                                  context: context,
                                  controller: boletoController),
                            ),
                          ]),
                      Observer(builder: (_) {
                        return Text(
                          boletoController.validDate,
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(209, 8, 6, 0.8)),
                        );
                      }),
                      Text(
                        "Observação",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 74, 173, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Observer(
                        builder: (_) {
                          return textField(
                              onChanged: boletoController.boleto.setMessage);
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        padding: EdgeInsets.only(bottom: 35.0),
                        child: Observer(
                          builder: (_) {
                            return FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 74, 173, 1)),
                              ),
                              color: Colors.white,
                              textColor: Color.fromRGBO(0, 74, 173, 1),
                              padding: EdgeInsets.all(10.0),
                              onPressed: //boletoController.isValid?
                                  () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        // TransactionBoletoForm2(
                                        //     transactionBoletoController,
                                        //     boleto)
                                        TransactionResponse(
                                            boletoController, boleto)));
                              },
                              //: null,
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
            )));
  }
}

dateButton({context, controller}) {
  final date = DateTime.now();
  controller.boleto.setDateExpiration(date);

  return RaisedButton.icon(
      padding: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
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
        controller.validateDateExpirationError();
      },
      icon: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Icon(Icons.calendar_today, color: Colors.white),
      ),
      label: Observer(builder: (_) {
        return Text(
            "${controller.boleto.dateExpiration.day.toString()}/${controller.boleto.dateExpiration.month.toString()}/${controller.boleto.dateExpiration.year.toString()}",
            style: TextStyle(color: Colors.white, fontSize: 16));
      }));
}
