import 'package:estruturabasica/src/components/home_icon.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_mpos_form.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_boleto_form.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_online_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(crossAxisCount: 2, children: [
        Card(
          color: Colors.yellow,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            color: Color.fromRGBO(0, 74, 173, 1),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TransactionMposForm()));
            },
            child: Column(
              children: [
                HomeIcon(Icons.credit_card_outlined, "Transação \n Cartão"),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.green,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            color: Color.fromRGBO(0, 74, 173, 1),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TransactionBoletoForm()));
            },
            child: Column(
              children: [
                HomeIcon(Icons.description_outlined, "Transação \n Boleto"),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
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
          color: Colors.pinkAccent,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            color: Color.fromRGBO(0, 74, 173, 1),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TransactionOnlineForm()));
            },
            child: Column(
              children: [
                HomeIcon(Icons.alternate_email_outlined, "Transação \n Online"),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
