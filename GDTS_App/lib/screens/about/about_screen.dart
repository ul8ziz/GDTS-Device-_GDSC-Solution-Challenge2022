import 'package:flutter/material.dart';
import 'package:gdtsapp/shared/components/component.dart';
import 'package:hexcolor/hexcolor.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGDTS(
       title: 'About Us',
        context: context,
        actions: [
        IconButton(onPressed: () {
    }, icon: Icon(Icons.info))
        ],
      ),
      body: Padding(
    padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 55.0),
    child: Column(
   // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 122.0,
      ),
    Image.asset('assete/images/gdts.png'),
      SizedBox(
        width: 15.0,
      ),
    Text(
    'V 1.0.3',
    style:    TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color:  HexColor('0d9d8d'),),
    textAlign: TextAlign.center,
    ),
      SizedBox(height: 10.0,),



      Text(
        'GDTS Team',
        style:    TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color:  HexColor('0d9d8d'),),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 10.0,),
      Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],),
      SizedBox(height: 10.0,),
      Text(
        'For inquiries and suggestions, please contact us',
        style:    TextStyle(
          fontSize: 15,
        //  fontWeight: FontWeight.bold,
          color: Colors.black
          ,),
        textAlign: TextAlign.left,
      ),      SizedBox(height: 10.0,),

      Text(
        'ِGDTSTEAM@Gmail.com\n+967 772171727',
        style:    TextStyle(
          fontSize: 15,
        //  fontWeight: FontWeight.bold,
            color: Colors.black
            ,),
       // textAlign: TextAlign.left,
      ),


    ]
    ),)
    );
  }
}
