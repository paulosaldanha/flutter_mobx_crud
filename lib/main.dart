import 'package:estruturabasica/src/controllers/auth_controller.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:estruturabasica/src/screens/home/home.dart';
import 'package:estruturabasica/src/screens/transaction/boleto/transaction_boleto_form.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_link/transaction_link_form.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_online_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:estruturabasica/src/routes/router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Ecommerce Bank Pay';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
          hintColor: Colors.black45,
          primaryColor: Color.fromRGBO(0, 74, 173, 1),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color.fromRGBO(0, 74, 173, 1))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color.fromRGBO(0, 74, 173, 1))),
            hintStyle: TextStyle(color: Colors.black45),
          )),
      //gera as rotas para navegação
      onGenerateRoute: rotas(),
      //quando usa rotas ao invés de passar home, deve se passar initialRoute, aqui passa a rota nomeada para home
      initialRoute: SplashArt,
      // home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final authController = AuthController();

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
      ),
      backgroundColor: Color.fromRGBO(0, 74, 173, 1),
      body: Home(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Image.asset('images/splash.png'),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 74, 173, 1),
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ))),
            Observer(builder: (_) {
              authController.getName();
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TransactionOnlineForm()));
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                await authController.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
