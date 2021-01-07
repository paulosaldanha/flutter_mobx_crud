import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

textField(
    {String labelText,
    String hint,
    Widget prefix,
    bool obscure = false,
    onChanged,
    String Function() errorText}) {
  return TextFormField(
    onChanged: onChanged,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: labelText,
      hintText: hint,
      prefixIcon: prefix,
      errorText: errorText == null ? null : errorText(),
    ),
    obscureText: obscure,
  );
}

numberField(
    {String labelText,
    onChanged,
    String Function() errorText,
    String prefix,
    bool enable}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    onChanged: onChanged,
    enabled: enable,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
        prefixText: prefix),
  );
}

numberMaskField(
    {String labelText,
    onChanged,
    String Function() errorText,
    String prefix,
    TextInputFormatter mask,
    bool enable}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    onChanged: onChanged,
    enabled: enable,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
        prefixText: prefix),
    inputFormatters: [mask],
  );
}

labelFieldRequired(String label) {
  return Row(children: [
    Text(
      label,
      style: TextStyle(
          color: Color.fromRGBO(0, 74, 173, 1),
          //fontWeight: FontWeight.bold,
          fontSize: 18),
    ),
    Text(
      "*",
      style: TextStyle(color: Colors.red, fontSize: 18),
    ),
  ]);
}

label(String label) {
  return Text(
    label,
    style: TextStyle(
        color: Color.fromRGBO(0, 74, 173, 1),
        //fontWeight: FontWeight.bold,
        fontSize: 18),
  );
}

labelError(String label) {
  return Text(
    label,
    style: TextStyle(color: Colors.red),
  );
}

rowCard(String text, {double fontSize}) {
  return Container(
    padding: EdgeInsets.only(left: 30),
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 20,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
