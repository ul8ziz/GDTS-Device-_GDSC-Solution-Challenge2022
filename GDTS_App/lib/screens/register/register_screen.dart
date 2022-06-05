import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:gdtsapp/screens/login/login_screen.dart';
import 'package:gdtsapp/shared/bloc/register_bloc/register_cubit.dart';
import 'package:gdtsapp/shared/components/component.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterScreen extends StatelessWidget {
  var nameCntroller = TextEditingController();
  var emailCntroller = TextEditingController();
  var passCntroller = TextEditingController();
  var phoneCntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is UserCreateSuccess){
            navigateTo(context,LoginScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 55.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assete/images/gdts.png'),

                  Text(
                    'Create your Account',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,


                    ),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    'It’s quick and easy.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextBoxGDTS(
                    textcontroller: nameCntroller,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please enter your Name';
                      }
                      return '';
                    },
                    lable: 'Full Name ',
                    prefixicon: Icons.person,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextBoxGDTS(
                    textcontroller: emailCntroller,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please enter your email';
                      }
                      return '';
                    },
                    lable: 'Email Address',
                    prefixicon: Icons.email,
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextBoxGDTS(
                    textcontroller: passCntroller,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'password is too short';
                      }
                      return '';
                    },
                    lable: 'Password',
                    prefixicon: Icons.lock_outline,
                    suffix: Icons.visibility_outlined,
                    onsubmit: () {
                      //LoginCubit.get(context).changPasswordVisibility();
                    },
                    type: TextInputType.visiblePassword,
                    isPass: true,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextBoxGDTS(
                    textcontroller: phoneCntroller,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please enter your phone number';
                      }
                      return '';
                    },
                    lable: 'Phone',
                    prefixicon: Icons.phone,
                    type: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ConditionalBuilder(
                    condition: state is! RegisterLoading,
                    builder: (context) => ButtonGDTS(
                      function: () {
                        RegisterCubit.get(context).registerUser(
                          email: emailCntroller.text,
                          name: nameCntroller.text,
                          phone: phoneCntroller.text,
                          password: passCntroller.text,
                        );

                      },

                      text: 'Sign Up' ,


                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
