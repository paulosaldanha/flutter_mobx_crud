import 'package:estruturabasica/src/screens/transaction/transaction_response.dart';
import 'package:estruturabasica/src/components/mask.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TransactionOnlineFormPart3 extends StatelessWidget {
  final transactionOnline;
  final transactionOnlineController;

  TransactionOnlineFormPart3(
      this.transactionOnline, this.transactionOnlineController);

  MaskTextInputFormatter maskNumber = maskCardNumber();
  MaskTextInputFormatter maskDate = maskDateExp();
  MaskTextInputFormatter maskCVV = maskCvv();

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
                                    transactionOnlineController
                                            .transactionOnline.cardNumber ??
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
                                    transactionOnlineController
                                            .transactionOnline.cardName ??
                                        'Your Name',
                                    fontSize: 18),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                rowCard('Valid Thru', fontSize: 10),
                                rowCard(
                                    transactionOnlineController
                                            .transactionOnline
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
                                    transactionOnlineController
                                            .transactionOnline.cardCVV ??
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
                    onChanged: transactionOnlineController
                        .transactionOnline.setCardName,
                    errorText: transactionOnlineController.cardNameError,
                  );
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
                    mask: maskNumber,
                    onChanged: transactionOnlineController
                        .transactionOnline.setCardNumber,
                    errorText: transactionOnlineController.cardNumberError,
                  );
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
                                mask: maskDate,
                                onChanged: transactionOnlineController
                                    .transactionOnline.setDateExpiration,
                                errorText: transactionOnlineController
                                    .dateExpirationError,
                              );
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
                                mask: maskCVV,
                                onChanged: transactionOnlineController
                                    .transactionOnline.setCardCVV,
                                errorText:
                                    transactionOnlineController.cardCVVError);
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
                      onPressed: transactionOnlineController.isValidPart3
                          ? () {
                              transactionOnlineController.loading = true;
                              transactionOnlineController
                                  .createTransctionTransactionOnline()
                                  .then((res) {
                                transactionOnlineController.loading = false;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        TransactionResponse(res, "link")));
                              });
                            }
                          : null,
                      child: !transactionOnlineController.loading
                          ? Text(
                              "Criar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
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
