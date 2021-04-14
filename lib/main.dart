import 'package:cloud_crm/src/controllers/home/home_page_controller.dart';
import 'package:cloud_crm/src/controllers/login/auth_controller.dart';
import 'package:cloud_crm/src/routes/routing_constants.dart';
import 'package:cloud_crm/src/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_crm/src/routes/router.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(MyApp());
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<AuthController>(AuthController());
  getIt.registerSingleton<HomePageController>(HomePageController());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        ),
      ),
      //gera as rotas para navegação
      onGenerateRoute: rotas(),
      //quando usa rotas ao invés de passar home, deve se passar initialRoute, aqui passa a rota nomeada para home
      initialRoute: SplashRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);
  // cria pagina principal com menu drawer
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title)), body: HomePage());
  }
}