import 'package:flutter/material.dart';

Widget defaultFormField({
        required TextEditingController controller,
        TextInputType ? type,
        void onSubmit(String? h)?, // click ok // void != return
        bool isPassword = false,
        String? Function(String? h) ? validate, // Func == return
        void suffixPressed() ?, //no required should
        required String label,
        void onChange(dynamic? h) ?,
        required IconData prefix,
        IconData? suffix,
        void onTap() ?//we will be back

        }) =>
    TextFormField(
      onTap: onTap,
      controller: controller, // the value entered
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
          labelText: label, // value
          prefixIcon: Icon(prefix),
          suffix: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: suffixPressed,
                )
              : null,
          border: OutlineInputBorder() // shape of cadre form
          ),
      keyboardType: type, // type='email'
      onChanged: onChange,
      onFieldSubmitted: onSubmit,

    );

//////////////////////////////////////////////////////////
Widget defaultButton({
    double radiusBorder = 0,
    double width = double.infinity,
    Color color = Colors.blue,
    required void function(),
    required String text,
    bool isUppercase = true
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radiusBorder)),
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isUppercase ? text.toUpperCase() : text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}
