import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdtsapp/model/user_model/users_model.dart';
import 'package:gdtsapp/shared/bloc/gdts_bloc/gdts_cubit.dart';
import 'package:gdtsapp/shared/components/component.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatelessWidget {
  CountDownController _controller = CountDownController();
  String connact = 'connact';
  String diconnact = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBlue(GdtsCubit.get(context).userModel, context)
    );
  }

  Widget buildBlue(UserModel model, context) => Column(
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 40.0,
                  ),
                  Text(
                    'Start Examination ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(40),
                      primary: HexColor('0d9d8d'),
                    ),
                    onPressed: () {
                      openDialog(context, model);
                    },
                    child: Text('Scean', textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[400],
          ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'HC-05',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                     // openDialog(context, model);
                    },
                    child: Text('${connact}'),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'Readmi Note 8',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('${connact}'),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'S6 Samsung',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('${connact}'),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'AirPods Pro',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                     // openDialog(context, model);
                    },
                    child: Text('${connact}'),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Future openDialog(context, UserModel usermodel) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(' Examination Starting'),
          content: CircularCountDownTimer(
            width: 80.0,
            height: 80,
            duration: 5,
            fillColor: HexColor('0d9d8d'),
            ringColor: Colors.amber,
            backgroundColor: Colors.white,
            controller: _controller,
            strokeWidth: 20.0,
            strokeCap: StrokeCap.butt,
            isReverse: false,
            isTimerTextShown: true,
            onComplete: () {
              Alert(
                context: context,
                style: AlertStyle(
                  isCloseButton: true,
                  isButtonVisible: false,
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                content: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80.0,
                      ),
                      Text('121'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Heealth status',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Normal statble',
                        style: TextStyle(color: HexColor('0d9d8d')),
                      ),
                      SizedBox(
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
                //type: AlertType.success,
              ).show();
            },
          ),
        ),
      );

//  Widget CounterDown(context)=> CircularCountDownTimer(
//
//    width: MediaQuery.of(context).size.width / 2,
//    height: MediaQuery.of(context).size.height /2,
//    duration: 5,
//    fillColor: Colors.blue,
//    backgroundColor: Colors.white,
//    controller: _controller,
//    strokeCap: StrokeCap.round,
//    strokeWidth: 10.0,
//    isReverse: true,
//    ringColor: Colors.amber,
//    isTimerTextShown: false,
//    onComplete: (){
//      Alert(
//        context: context,
//        title: '23',
//        style: AlertStyle(
//          isCloseButton: true,
//          isButtonVisible: false,
//          titleStyle: TextStyle(
//            color: Colors.white,
//            fontSize: 10.0,
//          ),
//        ),
//        type: AlertType.success,
//        content: Text('hhhhhhhhhhh'),
//      ).show();
//    },
//
//  );
// }
//
}
