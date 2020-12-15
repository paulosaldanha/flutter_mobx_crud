import 'package:estruturabasica/src/components/home_icon.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_mpos_form.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_boleto_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      cryptoIcon(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      cryptoNameSymbol(),
                                      Spacer(),
                                      cryptoChange(),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      cryptoAmount()
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
          Container(
            padding: EdgeInsets.all(20),
            child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  Card(
                    elevation: 5,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color.fromRGBO(0, 74, 173, 1),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TransactionMposForm()));
                      },
                      child: Column(
                        children: [
                          HomeIcon(Icons.credit_card_outlined,
                              "Transação \n Cartão"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color.fromRGBO(0, 74, 173, 1),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TransactionBoletoForm()));
                      },
                      child: Column(
                        children: [
                          HomeIcon(Icons.description_outlined,
                              "Transação \n Boleto"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color.fromRGBO(0, 74, 173, 1),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TransactionMposForm()));
                      },
                      child: Column(
                        children: [
                          HomeIcon(Icons.link, "Link  \n Pagamento"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color.fromRGBO(0, 74, 173, 1),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TransactionMposForm()));
                      },
                      child: Column(
                        children: [
                          HomeIcon(Icons.alternate_email_outlined,
                              "Transação \n Online"),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget cryptoIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.apartment_rounded,
            color: Color.fromRGBO(0, 74, 173, 1),
            size: 20,
          )),
    );
  }

  Widget cryptoNameSymbol() {
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

  Widget cryptoChange() {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: 'R\$ 100,67',
          style: TextStyle(
              fontWeight:
              FontWeight.bold,
              color: Colors.green,
              fontSize: 15),
          children: <TextSpan>[
          ],
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
  Widget cryptoAmount() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: '\n R\$ 122,79',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                ),
                children: <TextSpan>[
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
