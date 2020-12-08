import 'package:estruturabasica/src/routes/routing_constants.dart';
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
      initialRoute: HomeViewRoute,
      //home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);
  // cria pagina principal com menu drawer
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Divider(),
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(55, 53, 116, 1),
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
            ), Container(
              height: 60.0,
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 32.0,
                    color: Colors.blueGrey[700],
                  ),
                  SizedBox(
                    width: 32.0,
                  ),
                  Text(
                    'text',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blueGrey[700],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('Pais'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(ListPaisViewRoute);
              },
            ),
            ListTile(
              title: Text('Estado'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(ListEstadoViewRoute);
              },
            ),
            ListTile(
              title: Text('Transação MPOS'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(TransactionCartaoMpos);
              },
            ),
          ],
        ),
      ),
    );
  }
}
