
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdtsapp/screens/edit_profile/edit_profile_screen.dart';
import 'package:gdtsapp/shared/bloc/gdts_bloc/gdts_cubit.dart';
import 'package:gdtsapp/shared/components/component.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GdtsCubit,GdtsState>(
      listener: (context,state){},
      builder: (context,state){
        var userModel =GdtsCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 240.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(''
                                '${userModel.cover}'
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 63.0,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage('${userModel.image}'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Text('${userModel.name}',style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 10.0,),

              Row(
                children: [
                  Expanded(
                    child:OutlinedButton(onPressed: (){},child: Text('Add Tips'),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  OutlinedButton(onPressed: (){
                    navigateTo(context, EditProfile());
                  },child: Icon(Icons.edit_outlined,size: 16.0,),),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
