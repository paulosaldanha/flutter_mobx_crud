import 'package:ecommerceBankPay/src/components/stateless_modal_widget.dart';
import 'package:ecommerceBankPay/src/controllers/transaction/mpos/transaction_list_combo_controller.dart';
import 'package:ecommerceBankPay/src/controllers/transaction/mpos/transaction_modal_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SliderTaxa extends StatefulWidget {
  final controller;

  SliderTaxa(this.controller);

  @override
  _SliderTaxaState createState() => _SliderTaxaState(controller);
}

class _SliderTaxaState extends State<SliderTaxa> {
  final controller;
  var _value = 1.0;

  _SliderTaxaState(this.controller) {
    listComboController.getTaxCredit(controller.currentValues);
  }

  TransactionListComboController listComboController =
      new TransactionListComboController();
  TransactionModalController transactionModal =
      new TransactionModalController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Método de Pagamento'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(top: 10, left: 10, bottom: 30, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CRÉDITO",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 74, 173, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${_value.round().toString()} X",
                          style: TextStyle(
                              fontSize: 45,
                              color: Color.fromRGBO(0, 74, 173, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Quantidade de parcelas",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(0, 74, 173, 1),
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 10.0,
                        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                        valueIndicatorTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Slider(
                        value: _value,
                        min: 1,
                        max: 12,
                        divisions: 12,
                        label: '$_value',
                        onChanged: (value) {
                          setState(
                            () {
                              _value = double.parse(value.round().toString());
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Valor por parcela (R\$)",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(0, 74, 173, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Observer(builder: (_) {
                          return !listComboController.loading
                              ? Text(
                                  '${listComboController.amountValuesCreditCardList[_value.toInt() - 1].descriptionValue}',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 74, 173, 1),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        })
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 1000,
                color: Colors.white,
                padding:
                    EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
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
                      onPressed: () {
                        controller.setInstallments(_value.toInt());
                        controller.setAmount((listComboController
                                    .amountValuesCreditCardList[
                                        _value.toInt() - 1]
                                    .amount *
                                100)
                            .toInt());
                        controller.initPlatformState(transactionModal, context);
                      },
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
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 150.0,
                        width: 250.0,
                        child: Observer(
                          builder: (_) {
                            if (transactionModal.status == 1) {
                              return StatlessModal(transactionModal);
                            } else {
                              return Text('');
                            }
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
