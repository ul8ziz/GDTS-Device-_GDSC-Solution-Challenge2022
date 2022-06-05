import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdtsapp/model/user_model/users_model.dart';
import 'package:gdtsapp/shared/bloc/gdts_bloc/gdts_cubit.dart';
import 'package:gdtsapp/shared/components/component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GdtsCubit,GdtsState>(
      listener: (context ,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition:GdtsCubit.get(context).users.length > 0 ,
          builder: (context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildBlue(GdtsCubit.get(context).users[index],context),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount : GdtsCubit.get(context).users.length  ,
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
 Widget buildBlue(UserModel model,context)=>InkWell(
   onTap: (){
     // navigateTo(context,DetailsScreen(model: model,));
   },
   child: Padding(
     padding: const EdgeInsets.all(20.0),
     child: Row(
       children: [

         CircleAvatar(
           radius: 25.0,
           backgroundImage: NetworkImage('${model.image}'),
         ),
         SizedBox(
           width: 15.0,
         ),
         Text(
           '${model.name}',
           style: TextStyle(height: 1),
         ),
       ],

     ),
   ),
 );
  }

