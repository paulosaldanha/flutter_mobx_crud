import 'package:estruturabasica/src/components/home_card.dart';
import 'package:estruturabasica/src/components/home_card_grid.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_mpos_form.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_boleto_form.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_online_form.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        children: [
          HomeCard(),
          Container(
            color: Color.fromRGBO(0, 74, 173, 1),
            padding: EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20),
            child:
                GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [
                      HomeCardGrid(TransactionMposForm(), Icons.credit_card_outlined, "Transação \n Cartão"),
                      HomeCardGrid(TransactionBoletoForm(), Icons.description_outlined, "Transação \n Boleto"),
                      HomeCardGrid(TransactionMposForm(), Icons.link, "Link  \n Pagamento"),
                      HomeCardGrid(TransactionOnlineForm(), Icons.alternate_email_outlined, "Transação \n Online"),
              ]),
          ),
        ],
      ),
    );
  }
}
