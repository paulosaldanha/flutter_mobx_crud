import 'package:ecommerceBankPay/presentation/ecommerce_bank_pay_icons.dart';
import 'package:ecommerceBankPay/src/controllers/auth/auth_controller.dart';
import 'package:ecommerceBankPay/src/controllers/home/home_controller.dart';
import 'package:ecommerceBankPay/src/util/show_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class HomeCard extends StatefulWidget {
  HomeCard({Key key}) : super(key: key);

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  HomeController homeController = HomeController();
  final authController = GetIt.I.get<AuthController>();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => homeController.request.status, (_) async {
      if (homeController.request?.status == FutureStatus.rejected) {
        showError(homeController.request.error, context);
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

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
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 0, right: 20),
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
                child: !homeController.isLoading
                    ? Container(
                        padding: EdgeInsets.only(bottom: 0),
                        child: Stack(children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            companyIcon(),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            companyNameSymbol(authController
                                                .auth.nameCompany),
                                            // cryptoChange(),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            homeController.isLoading
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : companyAmount(homeController
                                                    .request.value.valueWallet)
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 5, bottom: 5),
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
                                          children: <Widget>[
                                            homeController.isLoading
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : Expanded(
                                                    child: SizedBox(
                                                      height: 200.0,
                                                      child:
                                                          new ListView.builder(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            homeController
                                                                .request
                                                                .value
                                                                .transactionList
                                                                .length,
                                                        itemBuilder:
                                                            (BuildContext ctxt,
                                                                int index) {
                                                          return transactionChange(
                                                              homeController
                                                                      .request
                                                                      .value
                                                                      .transactionList[
                                                                  index]);
                                                        },
                                                      ),
                                                    ),
                                                  )
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          )
                        ]),
                      )
                    : Container(
                        height: 163,
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
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

  Widget companyNameSymbol(name) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: name ?? "EcommerceBank Pay",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  Widget transactionChange(transaction) {
    return Padding(
      padding: EdgeInsets.only(left: 40, top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            text: 'R\$ ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: transaction.status == 'PAGO' ? Colors.green : Colors.red,
                fontSize: 15),
            children: <TextSpan>[
              TextSpan(
                  text: '${transaction.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: transaction.status == 'PAGO'
                          ? Colors.green
                          : Colors.red,
                      fontSize: 20),
                  children: [
                    TextSpan(
                        text: ' - ${transaction.status}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: transaction.status == 'PAGO'
                                ? Colors.green
                                : Colors.red,
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
              textAlign: TextAlign.center,
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
                          color: Colors.green[400],
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
