import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hint,
      this.prefix,
      this.suffix,
      this.validator,
      this.obscure = false,
      this.textInputType,
      this.onChanged,
      this.onSaved,
      this.enabled,
      this.controller,
      this.errorText,
      this.initalValue,
      this.labelText});

  final TextEditingController controller;
  final String hint;
  final String initalValue;
  final String labelText;
  final Widget prefix;
  final Widget suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled;
  final String Function() errorText;
  final Function(String) validator;
  final Function(String) onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            //padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: TextFormField(
              validator: validator,
              controller: controller,
              obscureText: obscure,
              keyboardType: textInputType,
              onChanged: onChanged,
              enabled: enabled,
              onSaved: onSaved,
              initialValue: initalValue,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                errorText: errorText == null ? null : errorText(),
                labelText: labelText,
                hintText: hint,
                prefixIcon: prefix,
                suffixIcon: suffix,
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
        ],
      ),
    );
  }
}
