import 'package:ecommerceBankPay/main.dart';
import 'package:ecommerceBankPay/src/screens/home/login_page.dart';
import 'package:ecommerceBankPay/src/screens/home/recover_password.dart';
import 'package:ecommerceBankPay/src/routes/routing_constants.dart';
import 'package:ecommerceBankPay/src/screens/home/splash.dart';
import 'package:ecommerceBankPay/src/screens/home/register/fast_register.dart';
import 'package:ecommerceBankPay/src/screens/home/wifi_off.dart';
import 'package:ecommerceBankPay/src/screens/transaction/boleto/transaction_boleto_form.dart';
import 'package:ecommerceBankPay/src/screens/transaction/online/transaction_online_form.dart';
import 'package:ecommerceBankPay/src/screens/transaction/link/transaction_link_form.dart';
import 'package:ecommerceBankPay/src/screens/transaction/mpos/transaction_mpos_form.dart';
import 'package:flutter/material.dart';

//utilizando o arguments -> nomePage(arguments['id']);
//criação das rotas nomeadas
RouteFactory rotas() {
  return (settings) {
    //final Map<Object, dynamic> arguments = settings.arguments;
    // No editar passo um objeto, então aqui na rota defino que como argumento espero um objeto
    Object obj = settings.arguments;
    Widget screen;
    switch (settings.name) {
      case HomeViewRoute:
        screen = MyHomePage(title: "EcommerceBank Pay");
        break;
      case TransactionCardMpos:
        screen = TransactionMposForm();
        break;
      case TransactionBoleto:
        screen = TransactionBoletoForm();
        break;
      case TransactionLink:
        screen = TransactionLinkForm();
        break;
      case TransactionOnline:
        screen = TransactionOnlineForm();
        break;
      case LoginPageRoute:
        screen = LoginPage();
        break;
      case RecoverPasswordPageRoute:
        screen = RecoverPasswordPage();
        break;
      case RegisterPageRoute:
        screen = FastRegister();
        break;
      case SplashArt:
        screen = Splash();
        break;
      case WifiOffPage:
        screen = WifiOff();
        break;
      default:
        screen = MyHomePage(title: "EcommerceBank Pay");
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
