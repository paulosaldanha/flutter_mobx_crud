import 'package:estruturabasica/src/controllers/auth/auth_controller.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:estruturabasica/src/screens/drawer_menu/drawer_menu.dart';
import 'package:estruturabasica/src/screens/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:estruturabasica/src/routes/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(MyApp());
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<AuthController>(AuthController());
}

class MyApp extends StatelessWidget {
  final appTitle = 'EcommerceBank Pay';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
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
      debugShowCheckedModeBanner: false,
      initialRoute: SplashArt,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final authController = GetIt.I.get<AuthController>();

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.getAuth();
    return Scaffold(
      appBar: AppBar(
        title: authController.auth.nameCompany != null
            ? Text(authController.auth.nameCompany)
            : Text(title),
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
      ),
      backgroundColor: Color.fromRGBO(0, 74, 173, 1),
      // body: Home(authController),
      body: HomePage(),
      drawer: DrawerMenu(),
    );
  }
}
