import 'package:estruturabasica/src/screens/transaction/transaction_response.dart';
import 'package:estruturabasica/src/components/mask.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionOnlineFormPart3 extends StatelessWidget {
  final transactiononline;
  final transactiononlineController;

  TransactionOnlineFormPart3(
      this.transactiononline, this.transactiononlineController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Criar transação online'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Observer(builder: (_) {
                return Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 18,
                            offset: Offset(0, 1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 30),
                              child: Image.asset(
                                'images/master.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                rowCard('Card Number', fontSize: 10),
                                rowCard(
                                    transactiononlineController
                                            .transactiononline.cardNumber ??
                                        '#### #### #### ####',
                                    fontSize: 26),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                rowCard('Card Name', fontSize: 10),
                                rowCard(
                                    transactiononlineController
                                            .transactiononline.cardName ??
                                        'Your Name',
                                    fontSize: 18),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                rowCard('Valid Thru', fontSize: 10),
                                rowCard(
                                    transactiononlineController
                                            .transactiononline
                                            .cardDateExpiration ??
                                        '##/##',
                                    fontSize: 18),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                rowCard('CVV', fontSize: 10),
                                rowCard(
                                    transactiononlineController
                                            .transactiononline.cardCVV ??
                                        '###',
                                    fontSize: 18),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ));
              }),
              SizedBox(
                height: 30,
              ),
              labelFieldRequired("Nome do Cartão"),
              SizedBox(height: 5),
              Observer(
                builder: (_) {
                  return textField(
                      onChanged: transactiononlineController
                          .transactiononline.setCardName,
                      errorText: transactiononlineController.validateCardName);
                },
              ),
              SizedBox(
                height: 10,
              ),
              labelFieldRequired("Número do Cartão"),
              SizedBox(height: 5),
              Observer(
                builder: (_) {
                  return numberMaskField(
                      mask: maskCardNumber(),
                      onChanged: transactiononlineController
                          .transactiononline.setCardNumber,
                      errorText:
                          transactiononlineController.validateCardNumber);
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
                    child: Column(
                      children: [
                        labelFieldRequired("Validade Cartão"),
                        SizedBox(height: 5),
                        Container(
                          child: Observer(
                            builder: (_) {
                              return numberMaskField(
                                  mask: maskDateExp(),
                                  onChanged: transactiononlineController
                                      .transactiononline.setDateExpiration,
                                  errorText: transactiononlineController
                                      .validateDateExpiration);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        labelFieldRequired("CVV"),
                        SizedBox(height: 5),
                        Observer(
                          builder: (_) {
                            return numberMaskField(
                                mask: maskCvv(),
                                onChanged: transactiononlineController
                                    .transactiononline.setCardCVV,
                                errorText: transactiononlineController
                                    .validateCardCVV);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 1000,
                color: Colors.white,
                padding: EdgeInsets.only(top: 25),
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
                      onPressed: transactiononlineController.isValidPart3
                          ? () {
                              transactiononlineController
                                  .createTransctionTransactionOnline()
                                  .then((res) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        TransactionResponse(res, "link")));
                              });
                            }
                          : null,
                      child: Text(
                        "Criar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
