import 'package:flutter/material.dart';

class WifiOff extends StatefulWidget {
  WifiOff({Key key}) : super(key: key);

  @override
  _WifiOffState createState() => _WifiOffState();
}

class _WifiOffState extends State<WifiOff> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sem conexão com \n a internet!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 74, 173, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                size: 100,
                color: Color.fromRGBO(0, 74, 173, 1),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Conecte a internete e tente novamente!!",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 74, 173, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Color.fromRGBO(0, 74, 173, 1)),
                ),
                color: Colors.white,
                textColor: Color.fromRGBO(0, 74, 173, 1),
                padding: EdgeInsets.all(10.0),
                onPressed:(){
                  Navigator.pushNamedAndRemoveUntil(context, 'splash', (route) => false);
                },
                child: Text(
                  "Tentar novamente".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
