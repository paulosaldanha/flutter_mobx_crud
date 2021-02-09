import 'package:ecommerceBankPay/src/controllers/auth/auth_controller.dart';
import 'package:ecommerceBankPay/src/routes/routing_constants.dart';
import 'package:ecommerceBankPay/src/screens/home/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DrawerMenu extends StatelessWidget {
  final authController = GetIt.I.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Observer(builder: (_) {
            return DrawerHeader(
                child: authController.auth.companyLogo != null
                    ? Image.network(authController.auth.companyLogo)
                    : Image.asset('images/transp_logo.png'),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 74, 173, 1),
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )));
          }),
          Observer(builder: (_) {
            return Container(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Text(
                  authController.auth.name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 74, 173, 1)),
                ),
              ),
            );
          }),
          ListTile(
            title: Text('Minha Conta'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Account()));
            },
          ),
          ListTile(
            title: Text('Transação Maquininha'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(TransactionCardMpos);
            },
          ),
          ListTile(
            title: Text('Gerar Boleto'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(TransactionBoleto);
            },
          ),
          ListTile(
            title: Text('Link de Pagamento'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(TransactionLink);
            },
          ),
          ListTile(
            title: Text('Transação Online'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(TransactionOnline);
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () async {
              await authController.logout();
              Navigator.of(context).pushNamedAndRemoveUntil(LoginPageRoute, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
