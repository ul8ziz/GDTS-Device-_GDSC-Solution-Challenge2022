import 'package:flutter/material.dart';
import 'package:gdtsapp/shared/components/component.dart';
import 'package:hexcolor/hexcolor.dart';
class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: Column(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Dear user\nFollow the following steps to work with you correctly.',
                  style:    TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                SizedBox(height: 10.0,),
          Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[400],),
                SizedBox(height: 10.0,),

                Text(
                  '1- Turn on  device through the power button.',
                  style:    TextStyle(
                    fontSize: 15,
                  //  fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                SizedBox( height: 10.0,  ),

                Image.asset('assete/images/1.jpg'),
                SizedBox(height: 10.0,),

                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[400],),
                SizedBox(height: 10.0,),
                Text(
                  '2- Contact to the device through the Bluetooth from the home screen as in the picture below.',
                  style:    TextStyle(
                    fontSize: 15,
                    //  fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                SizedBox(
                  height: 10.0,
                ),
                Image.asset('assete/images/2step.jpg'),
                SizedBox(height: 10.0,),

                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[400],),
                SizedBox(height: 10.0,),
                Text(
                  '3- Put your finger in the designated place as in the picture.',
                  style:    TextStyle(
                    fontSize: 15,
                  //  fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                SizedBox(
                  height: 10.0,
                ),
                Image.asset('assete/images/2.jpg'),
                SizedBox(height: 10.0,),

                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[400],),
                SizedBox(height: 10.0,),



                Text(
                  '4- Press the check button to start scan ,\nafter five seconds, the result of the examination will appear,'
                      'as well as your health condition.',
                  style:    TextStyle(
                    fontSize: 15,
                  //  fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                SizedBox( height: 10.0,  ),
                Image.asset('assete/images/3step.jpg'),
                SizedBox(height: 10.0,),

                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[400],),
                SizedBox(height: 10.0,),

                Text(
                  '5- after five seconds, the result of the examination will appear,'
                      'as well as your health condition.',
                  style:    TextStyle(
                    fontSize: 15,
                    //  fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),                SizedBox(height: 10.0,),

                Image.asset('assete/images/step44.jpg'),
                SizedBox(height: 10.0,),

                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[400],),
                SizedBox(height: 10.0,),

                Image.asset('assete/images/step444.jpg'),
                SizedBox(height: 10.0,),

                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[400],),
                SizedBox(height: 10.0,),
                Text(
                  'Enjoy a new experience with us',
                  style:    TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,),
                  textAlign: TextAlign.center),
                SizedBox(height: 30.0,),

                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[400],),
              ]
          ),)
    );
  }
}
