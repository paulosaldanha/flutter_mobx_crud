import 'package:flutter/material.dart';

textField({String labelText, onChanged, String Function() errorText}) {
  return TextFormField(
    onChanged: onChanged,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText()),
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
