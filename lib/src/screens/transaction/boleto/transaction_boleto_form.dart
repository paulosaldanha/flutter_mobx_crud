import 'package:estruturabasica/src/components/custom_icon_button.dart';
import 'package:estruturabasica/src/controllers/transaction/boleto/boleto_controller.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/components/mask.dart';
import 'package:estruturabasica/src/screens/transaction/boleto/transaction_boleto_form_part2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class TransactionBoletoForm extends StatelessWidget {
  BoletoController boletoController = BoletoController();

  TransactionBoletoForm();

  MaskTextInputFormatter maskDDD = maskDdd();
  MaskTextInputFormatter maskTelephone = maskPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 74, 173, 1),
          title: Text('Gerar Boleto'),
        ),
        backgroundColor: Colors.white,
        body: Container(
            height: 1000,
            padding: EdgeInsets.only(top: 25),
            color: Color.fromRGBO(0, 74, 173, 1),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      labelFieldRequired("Documento"),
                      SizedBox(height: 5),
                      Observer(
                        builder: (_) {
                          return numberMaskField(
                              mask: boletoController.maskDocument,
                              suffix: ClipRRect(
                                borderRadius: BorderRadius.circular(32),
                                child : Material(
                                  color: Colors.transparent,
                                  child : InkWell(
                                    child : Container(
                                      padding: EdgeInsets.all(5),
                                      color:  Color.fromRGBO(0, 74, 173, 1),
                                      height: 30,
                                      width: 85,
                                      child: !boletoController.loading ? Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Buscar",
                                            style: TextStyle(
                                                color: Colors.white
                                            ),),
                                          Icon(Icons.search,
                                              color: Colors.white)
                                        ],
                                      ): Center(
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    ),
                                    onTap: boletoController.getUserThink,
                                  ),
                                ),
                              ),
                              onChanged: boletoController.boleto.setDocument,
                              errorText: boletoController.documentError);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      labelFieldRequired("Nome"),
                      SizedBox(height: 5),
                      Observer(builder: (_) {
                        return boletoController.userThink != null &&
                                boletoController.userThink.name != ""
                            ? Text(
                                boletoController.userThink.name,
                                style: TextStyle(fontSize: 20),
                              )
                            : textField(
                                onChanged: boletoController.boleto.setNome,
                                errorText: boletoController.nameError,
                              );
                      }),
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
                                  SizedBox(height: 5),
                                  Container(child: Observer(
                                    builder: (_) {
                                      return boletoController.userThink !=
                                                  null &&
                                              boletoController.userThink.ddd !=
                                                  ""
                                          ? Text(
                                              boletoController.userThink.ddd,
                                              style: TextStyle(fontSize: 20),
                                            )
                                          : numberMaskField(
                                              mask: maskDDD,
                                              initialValue:
                                                  boletoController.boleto.ddd,
                                              onChanged: boletoController
                                                  .boleto.setDdd,
                                              errorText:
                                                  boletoController.dddError);
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
                                    SizedBox(height: 5),
                                    Container(child: Observer(
                                      builder: (_) {
                                        return boletoController.userThink !=
                                                    null &&
                                                boletoController
                                                        .userThink.phone !=
                                                    ""
                                            ? Text(
                                                boletoController
                                                    .userThink.phone,
                                                style: TextStyle(fontSize: 20),
                                              )
                                            : numberMaskField(
                                                mask: maskTelephone,
                                                onChanged: boletoController
                                                    .boleto.setTelephone,
                                                errorText: boletoController
                                                    .telephoneError,
                                              );
                                      },
                                    ))
                                  ])),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      labelFieldRequired("Vencimento"),
                      SizedBox(height: 5),
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
                      SizedBox(
                        height: 5,
                      ),
                      label("Observação"),
                      SizedBox(height: 5),
                      Observer(
                        builder: (_) {
                          return textField(
                              onChanged: boletoController.boleto.setMessage);
                        },
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
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 74, 173, 1)),
                              ),
                              color: Colors.white,
                              textColor: Color.fromRGBO(0, 74, 173, 1),
                              padding: EdgeInsets.all(10.0),
                              onPressed: boletoController.isValid
                                  ? () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TransactionBoletoForm2(
                                                      boletoController)));
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
            )));
  }
}

dateButton({context, controller}) {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  controller.boleto.setDateExpiration(tomorrow);

  return RaisedButton.icon(
      padding: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Color.fromRGBO(0, 74, 173, 1),
      onPressed: () async {
        final value = await showDatePicker(
            context: context,
            initialDate: controller.boleto.dateExpiration,
            firstDate: DateTime(2020),
            lastDate: DateTime(2050));
        if (value != null) {
          controller.boleto.setDateExpiration(value);
        }
        controller.dateExpirationError();
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
