import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

//remove page when you click button or any tools (called this function)
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) => false);

//TextButton

Widget TextButtonGDTS({
  @required Function function,
  @required String text,

}) =>
    TextButton(
      onPressed: function,

      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Colors.blue,
        ),

      ),

    );

// TextFormField

Widget TextBoxGDTS({
  @required TextEditingController textcontroller,
  TextInputType type,
  Function onsubmit,
  @required  Function validate,
  @required String lable,
  @required IconData prefixicon,
  IconData suffix,
  bool isPass = false,
  double height,
  double width,
  Color color = Colors.black,
}) =>
    Container(
      height: height,
      width: width,
      child: TextFormField(
        keyboardType: type,
        validator: validate,
        onTap: onsubmit,
        obscureText: isPass,
        decoration: InputDecoration(
          labelText: lable,
          hintStyle: TextStyle(fontSize: 5),
          labelStyle: TextStyle(color: Colors.black, fontSize: 15),
          prefixIcon: Icon(prefixicon),
          suffixIcon: Icon(suffix),
          border: OutlineInputBorder(),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: color)),
        ),
        controller: textcontroller,
      ),
    );

//Button

Widget ButtonGDTS({
  double width = double.infinity,
  Color backgroundcolor,
  Color colortxt,
  double radius = 0.0,
  @required Function function,
  @required String text, TextStyle style,
}) =>
    Container(
      width: width,
      child: ElevatedButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: colortxt,
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundcolor,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(74, 0, 0, 0),
                blurRadius: 4,
                offset: Offset.fromDirection(8, 4),
                blurStyle: BlurStyle.inner)
          ]),
    );

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: HexColor('0d9d8d'),
);

Widget AppBarGDTS({
   BuildContext context,
  String title,
  List<Widget>actions,
})=>AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back_ios),
  ),
  title: Text(title),
  titleSpacing: 0.0,
  actions: actions,
);