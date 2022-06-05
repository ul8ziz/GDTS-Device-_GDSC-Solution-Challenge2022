import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdtsapp/shared/bloc/gdts_bloc/gdts_cubit.dart';
import 'package:gdtsapp/shared/components/component.dart';

class EditProfile extends StatelessWidget {

  var nameCntroller = TextEditingController();
  var ageCntroller = TextEditingController();
  var phoneCntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GdtsCubit, GdtsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = GdtsCubit.get(context).userModel;
        var profileImage = GdtsCubit.get(context).Profileimage;
        var coverImage = GdtsCubit.get(context).coverImage;

        nameCntroller.text = userModel.name;
       ageCntroller.text = userModel.age;
        phoneCntroller.text = userModel.phone;

        return Scaffold(
          appBar: AppBarGDTS(
            title: 'Edit Profile',
            context: context,
            actions: [
              TextButtonGDTS(
                function: () {
                  GdtsCubit.get(context).updateUser(
                    name: nameCntroller.text,
                    phone: phoneCntroller.text,
                    age: ageCntroller.text,
                  );
                },
                text: 'UPDATE',
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is GdtsUpdateLoadingStates)
                    LinearProgressIndicator(),
                  if(state is GdtsUpdateLoadingStates)
                    SizedBox(
                      height: 10.0,
                    ),
                  Container(
                    height: 240.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 200.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: coverImage == null
                                        ? NetworkImage('${userModel.cover}')
                                        : FileImage(coverImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                 GdtsCubit.get(context).getCoverImage();
                                },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(Icons.camera_enhance),
                                ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 63.0,
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: profileImage == null
                                    ? NetworkImage('${userModel.image}')
                                    : FileImage(profileImage),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                               GdtsCubit.get(context).getImage();
                              },
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(Icons.camera_enhance),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  if(GdtsCubit.get(context).Profileimage !=null || GdtsCubit.get(context).coverImage !=null)
                    Row(
                      children: [
                        if(GdtsCubit.get(context).Profileimage !=null)
                          Expanded(child: Column(
                            children: [
                              ButtonGDTS(function:(){
                                GdtsCubit.get(context).uploadProfileImage(
                                  name: nameCntroller.text,
                                  phone: phoneCntroller.text,
                                  age: ageCntroller.text,
                                );
                              },
                                  text:'Upload Profile'),
                              if(state is GdtsUpdateLoadingStates)
                                LinearProgressIndicator(),

                            ],
                          ),
                          ),
                        SizedBox(
                          width: 10.0,
                        ),
                        if(GdtsCubit.get(context).coverImage != null)
                          Expanded(child: Column(
                            children: [
                              ButtonGDTS(
                                  function:(){
                                    GdtsCubit.get(context).uploadCoverImage(
                                      name: nameCntroller.text,
                                      phone: phoneCntroller.text,
                                      age: ageCntroller.text,
                                    );
                                  },
                                  text:'Upload Cover'
                              ),
                              if(state is GdtsUpdateLoadingStates)
                                LinearProgressIndicator(),

                            ],
                          )),
                      ],
                    ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextBoxGDTS(
                    textcontroller: nameCntroller,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Name is Empty';
                      }
                      return null;
                    },
                    lable: 'Name',
                    prefixicon: Icons.person,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextBoxGDTS(
                    textcontroller: ageCntroller,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Age is Empty';
                      }
                      return null;
                    },
                    lable: 'age',
                    prefixicon: Icons.info_outlined,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextBoxGDTS(
                    textcontroller: phoneCntroller,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Phone is Empty';
                      }
                      return null;
                    },
                    lable: 'Phone',
                    prefixicon: Icons.phone,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
