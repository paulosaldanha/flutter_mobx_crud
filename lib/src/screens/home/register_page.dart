import 'package:estruturabasica/src/components/custom_icon_button.dart';
import 'package:estruturabasica/src/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Form(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0,74,173, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          'https://i.imgur.com/ndinJu4.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  hint: 'Razão Social',
                  labelText: 'Razão Social',
                  prefix: Icon(Icons.info_outline),
                  textInputType: TextInputType.emailAddress,
                  onChanged: (razaoSocial) {},
                  enabled: true,
                ),
                CustomTextField(
                  hint: 'CNPJ',
                  labelText: 'CNPJ',
                  prefix: Icon(Icons.business),
                  // textInputType: TextInputType.emailAddress,
                  onChanged: (cnpj) {},
                  enabled: true,
                ),
                CustomTextField(
                  hint: 'Nome Responsável',
                  labelText: 'Nome Responsável',
                  prefix: Icon(Icons.account_circle),
                  textInputType: TextInputType.emailAddress,
                  onChanged: (responsavel) {},
                  enabled: true,
                ),
                CustomTextField(
                  hint: 'Email',
                  labelText: 'Email',
                  prefix: Icon(Icons.email_outlined),
                  textInputType: TextInputType.emailAddress,
                  onChanged: (responsavelEmail) {},
                  enabled: true,
                ),
                CustomTextField(
                  hint: '********',
                  labelText: 'Senha',
                  prefix: Icon(Icons.lock),
                  obscure: true,
                  onChanged: (senha) {},
                  enabled: true,
                  suffix: CustomIconButton(
                    radius: 32,
                    iconData: Icons.visibility,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 17.0),
                      elevation: 11,
                      highlightElevation: 0,
                      color: Color.fromRGBO(0,74,173, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        'CADASTRAR'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
