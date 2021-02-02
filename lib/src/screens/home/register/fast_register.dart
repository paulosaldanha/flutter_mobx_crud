import 'package:ecommerceBankPay/src/screens/home/register/screen_emp.dart';
import 'package:ecommerceBankPay/src/screens/home/register/screen_pf.dart';
import 'package:ecommerceBankPay/src/screens/home/register/screen_pj.dart';
import 'package:flutter/material.dart';

class FastRegister extends StatelessWidget {
  FastRegister();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Crie sua conta"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: "Empresarial"),
              // Tab(text: "Conta PJ"),
              Tab(text: "Conta Pessoa Fisica")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Builder(builder: (context) {
              return empresarial(context);
            }),
            // Builder(builder: (context) {
            //   return pessoaPJ(context);
            // }),
            Builder(builder: (context) {
              return pessoaFisica(context);
            }),
          ],
        ),
      ),
    );
  }
}
