import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

textField(
    {String labelText,
    String hint,
    Widget prefix,
    bool obscure = false,
    onChanged,
    initialValue,
    String Function() errorText,
    Widget suffix}) {
  return TextFormField(
    onChanged: onChanged,
    initialValue: initialValue,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: labelText,
      hintText: hint,
      prefixIcon: prefix,
      suffixIcon: suffix,
      errorText: errorText == null ? null : errorText(),
    ),
    obscureText: obscure,
  );
}

numberField(
    {String labelText,
    String hint,
    onChanged,
    String Function() errorText,
    Widget prefixIcon,
    String prefix,
    String suffix,
    initialValue,
    bool enable}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    onChanged: onChanged,
    initialValue: initialValue,
    enabled: enable,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hint,
        errorText: errorText == null ? null : errorText(),
        prefixIcon: prefixIcon,
        prefixText: prefix,
        suffix: suffix == null ? null : Text(suffix)),
  );
}

numberMaskField(
    {String labelText,
    String hint,
    onChanged,
    String Function() errorText,
    Widget prefixIcon,
    String prefix,
    suffix,
    controller,
    initialValue,
    TextInputFormatter mask,
    bool enable}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    onChanged: onChanged,
    initialValue: initialValue,
    enabled: enable,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hint,
        errorText: errorText == null ? null : errorText(),
        prefixIcon: prefixIcon,
        suffix: suffix,
        prefixText: prefix),
    inputFormatters: [mask],
  );
}

labelFieldRequired(String label) {
  return Row(children: [
    Text(
      label,
      style: TextStyle(color: Color.fromRGBO(0, 74, 173, 1), fontSize: 18),
    ),
    Text(
      "*",
      style: TextStyle(color: Colors.red, fontSize: 18),
    ),
  ]);
}

label(String label, {double fontSize, MainAxisAlignment align, Color color}) {
  return Row(
    mainAxisAlignment: align ?? MainAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            color: color ?? Color.fromRGBO(0, 74, 173, 1),
            fontSize: fontSize ?? 18),
      ),
    ],
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
