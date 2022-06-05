
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdtsapp/screens/about/about_screen.dart';
import 'package:gdtsapp/screens/howtouse/howtouse_screen.dart';
import 'package:gdtsapp/shared/bloc/gdts_bloc/gdts_cubit.dart';
import 'package:gdtsapp/shared/components/component.dart';
import 'package:hexcolor/hexcolor.dart';

class GDTSLayout extends StatelessWidget {
  const GDTSLayout({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GdtsCubit, GdtsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GdtsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('GDTS',),
            leadingWidth : 40,
           // centerTitle: true,
            leading:  Image.asset('assete/images/gdts1.png',
              fit: BoxFit.contain,alignment: Alignment(11.2, 0),
              ),

            actions: [
              // IconButton(onPressed: () {
              //   navigateTo(context, HowToUseScreen());
              // }, icon: Icon(Icons.how_to_reg_outlined)),

              IconButton(onPressed: () {
                navigateTo(context, AboutScreen());
              }, icon: Icon(Icons.info_outlined)),

            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home',
              backgroundColor: HexColor('0d9d8d')),

              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), label: 'Records'),

              BottomNavigationBarItem(
                  icon: Icon(Icons.tips_and_updates_outlined), label: 'Instructions',),

              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),label: 'Profile'),

            ],

          ),
        );
      },
    );
  }
}
