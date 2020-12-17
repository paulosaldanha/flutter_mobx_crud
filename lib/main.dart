import 'package:estruturabasica/src/controllers/auth_controller.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:estruturabasica/src/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:estruturabasica/src/routes/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      //gera as rotas para navegação
      onGenerateRoute: rotas(),
      //quando usa rotas ao invés de passar home, deve se passar initialRoute, aqui passa a rota nomeada para home
      // initialRoute: LoginPageRoute,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final authController = AuthController();

  MyHomePage({Key key, this.title}) : super(key: key);

  // cria pagina principal com menu drawer
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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('images/splash.png'),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                  Color.fromRGBO(0, 74, 173, 1),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
            ),
            ListTile(
              title: Text('Transação MPOS'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(TransactionCardMpos);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                await authController.logout();
                Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
