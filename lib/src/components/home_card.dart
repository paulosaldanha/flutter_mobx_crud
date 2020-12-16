import 'package:estruturabasica/presentation/ecommerce_bank_pay_icons.dart';
import 'package:estruturabasica/src/controllers/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeCard extends StatelessWidget {
  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return InkWell(
          onTap: () {
            homeController.setSizeCard();
          },
            child: Container(
              color: Color.fromRGBO(0, 74, 173, 1),
              padding: EdgeInsets.only(left:20, top:10, bottom: 0, right: 20),
              height: homeController.sizeCard,
              width: double.maxFinite,
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromRGBO(0, 74, 173, 1), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Stack(children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        companyIcon(),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        companyNameSymbol(),
                                        // cryptoChange(),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        companyAmount('1.000,00')
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20 ,top: 5, bottom: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "Transações :",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black38),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            transactionChange('100,00', 'Boleto'),
                                            transactionChange('200,00', 'Cartão'),
                                            transactionChange('100,00', 'Boleto'),
                                            transactionChange('200,00', 'Cartão'),
                                            transactionChange('200,00', 'Cartão'),
                                            transactionChange('200,00', 'Cartão'),
                                            transactionChange('200,00', 'Cartão'),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ))
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          );
      },
    );
  }

  Widget companyIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 5, bottom: 20),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Ecommerce_bank_pay.companie,
            color: Color.fromRGBO(0, 74, 173, 1),
            size: 40,
          )),
    );
  }

  Widget companyNameSymbol() {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: 'Ecommerce',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: 'Pay',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget transactionChange(String value, String methodTransaction) {
    return Padding(
      padding: EdgeInsets.only(left: 40, top: 10),
      child: Align(
        alignment: Alignment.topRight,
        child: RichText(
          text: TextSpan(
            text: 'R\$ ',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 15),
            children: <TextSpan>[
              TextSpan(
                  text: value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20),
                  children: [
                    TextSpan(
                        text: ' - ${methodTransaction}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                            fontSize: 20))
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget changeIcon() {
    return Align(
        alignment: Alignment.topRight,
        child: Icon(
          Icons.arrow_circle_up,
          color: Colors.green,
          size: 30,
        ));
  }

  Widget companyAmount(String value) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'Saldo :  ',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: 'R\$ ',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: value,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 30,
                        ),
                        children: <TextSpan>[],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
