import 'package:estruturabasica/src/controllers/auth/auth_controller.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:estruturabasica/src/screens/home/account.dart';
import 'package:estruturabasica/src/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:estruturabasica/src/routes/router.dart';
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
      onGenerateRoute: rotas(),
      initialRoute: SplashArt,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final authController = AuthController();

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.getAuth();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
      ),
      backgroundColor: Color.fromRGBO(0, 74, 173, 1),
      body: Home(authController),
      drawer: Drawer(
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
              print(authController.auth);
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
                    builder: (context) => Account(authController)));
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
                Navigator.of(context).pushNamed(LoginPageRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
