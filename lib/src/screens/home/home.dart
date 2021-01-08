import 'package:estruturabasica/presentation/ecommerce_bank_pay_icons.dart';
import 'package:estruturabasica/src/components/home_card.dart';
import 'package:estruturabasica/src/components/home_card_grid.dart';
import 'package:estruturabasica/src/controllers/auth_controller.dart';
import 'package:estruturabasica/src/screens/transaction/link/transaction_link_form.dart';
import 'package:estruturabasica/src/screens/transaction/mpos/transaction_mpos_form.dart';
import 'package:estruturabasica/src/screens/transaction/boleto/transaction_boleto_form.dart';
import 'package:estruturabasica/src/screens/transaction/online/transaction_online_form.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final authController = AuthController();
  @override
  Widget build(BuildContext context) {
    authController.autoLogIn(context);
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        children: [
          HomeCard(),
          Container(
            color: Color.fromRGBO(0, 74, 173, 1),
            padding: EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20),
            child:
                GridView.count(crossAxisCount: 2, shrinkWrap: true, children: [
              HomeCardGrid(TransactionMposForm(), Ecommerce_bank_pay.mpos,
                  "Transação \n Maquininha"),
              HomeCardGrid(TransactionBoletoForm(), Ecommerce_bank_pay.boleto,
                  "Gerar\n Boleto"),
              HomeCardGrid(TransactionLinkForm(),
                  Ecommerce_bank_pay.link_pagamento, "Link de \n Pagamento"),
              HomeCardGrid(TransactionOnlineForm(),
                  Ecommerce_bank_pay.credito_online, "Transação \n Online"),
            ]),
          ),
        ],
      ),
    );
  }
}
