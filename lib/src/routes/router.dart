import 'package:estruturabasica/main.dart';
import 'package:estruturabasica/src/models/pais.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:estruturabasica/src/screens/pais/list.dart';
import 'package:estruturabasica/src/screens/pais/pais_form.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => MyHomePage(title: "Escolinha"));
    case ListPaisViewRoute:
      return MaterialPageRoute(builder: (context) => ListPage());
    case CadPaisViewRoute:
      return MaterialPageRoute(builder: (context) => PaisForm());
    default:
      return MaterialPageRoute(builder: (context) => MyHomePage(title: "Escolinha"));
  }
}
//esse aqui é o certo
//utilizando o arguments -> nomePage(arguments['id']);
RouteFactory rotas(){
  return (settings) {
      //final Map<Object, dynamic> arguments = settings.arguments;
      Object obj = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case HomeViewRoute:
          screen = MyHomePage(title: "Escolinha");
          break;
        case ListPaisViewRoute:
          screen = ListPage();
          break;
        case CadPaisViewRoute:
          screen = PaisForm(pais: obj);
          break;
        default:
          screen = MyHomePage(title: "Escolinha");
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
}