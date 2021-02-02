import 'package:estruturabasica/src/util/show_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class TransactionLinkForm2 extends StatefulWidget {
  final transactionLink;
  final linkController;
  final parcelas;

  TransactionLinkForm2(
      this.linkController, this.transactionLink, this.parcelas);

  @override
  _TransactionLinkForm2State createState() =>
      _TransactionLinkForm2State(linkController, transactionLink, parcelas);
}

class _TransactionLinkForm2State extends State<TransactionLinkForm2> {
  final transactionLink;
  final linkController;
  final parcelas;

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => transactionLink.requestLink.status, (_) async {
      if (transactionLink.requestLink?.status == FutureStatus.fulfilled) {
        print(transactionLink.requestLink.value);
      }
      if (transactionLink.requestLink?.status == FutureStatus.rejected) {
        showError(transactionLink.requestLink.error, context);
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  _TransactionLinkForm2State(
      this.linkController, this.transactionLink, this.parcelas);

  @override
  Widget build(BuildContext context) {
    List _parcelas = List();
    if (parcelas != null) {
      _parcelas = parcelas;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Gerar Link de Pagamento'),
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
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  labelFieldRequired("Nome"),
                  SizedBox(height: 5),
                  Observer(
                    builder: (_) {
                      return textField(
                          onChanged: linkController.link.setNome,
                          errorText: linkController.nameError);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  parcelas != null
                      ? labelFieldRequired("Número de Parcelas")
                      : Text(""),
                  SizedBox(height: 5),
                  Observer(
                    builder: (_) {
                      if (parcelas != null) {
                        return DropdownButtonFormField(
                            value: int.parse(linkController.link.installments),
                            items: _parcelas.map((parcela) {
                              return new DropdownMenuItem(
                                  value: parcela[0],
                                  child: new Text(parcela[1]));
                            }).toList(),
                            onChanged: (_) {
                              linkController.link.setInstallments(_);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                              ),
                            ),
                            icon: Icon(Icons.credit_card),
                            isExpanded: true);
                      } else {
                        return Text("");
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  labelFieldRequired("Data de vencimento"),
                  SizedBox(height: 5),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                      flex: 1,
                      child: _dateButton(context, "Vencimento", linkController),
                    )
                  ]),
                  Observer(builder: (_) {
                    return Text(
                      linkController.validDate,
                      style: TextStyle(
                          fontSize: 13, color: Color.fromRGBO(209, 8, 6, 0.8)),
                    );
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 1000,
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
                          onPressed: linkController.isValid
                              ? () {
                                  linkController.createTransctionLink(context);
                                }
                              : null,
                          child: Observer(
                            builder: (_) {
                              return !linkController.isLoading
                                  ? Text(
                                      "Continuar".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                      ),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_dateButton(context, String label, controller) {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  controller.link.setDateExpiration(tomorrow);

  return RaisedButton.icon(
      padding: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Color.fromRGBO(0, 74, 173, 1),
      onPressed: () async {
        final value = await showDatePicker(
            context: context,
            initialDate: controller.link.dateExpiration,
            firstDate: DateTime(2020),
            lastDate: DateTime(2050));
        if (value != null) {
          controller.link.setDateExpiration(value);
        }
        controller.validateDateExpirationError();
      },
      icon: Icon(Icons.calendar_today, color: Colors.white),
      label: Observer(builder: (_) {
        return Text(
            "${controller.link.dateExpiration.day.toString()}/${controller.link.dateExpiration.month.toString()}/${controller.link.dateExpiration.year.toString()}",
            style: TextStyle(color: Colors.white));
      }));
}
