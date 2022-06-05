import 'package:conditional_builder/conditional_builder.dart';
import 'package:gdtsapp/layout/layout_gdts.dart';
import 'package:gdtsapp/network/local/cash_helper.dart';
import 'package:gdtsapp/screens/register/register_screen.dart';
import 'package:gdtsapp/shared/bloc/login_bloc/login_cubit.dart';
import 'package:gdtsapp/shared/components/component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErorr) {
            final snackBar = SnackBar(
              content: Text(state.erorr),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }else if(state is LoginSuccess){
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value){
              navigateAndFinish(context,GDTSLayout());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 40.0, 35.0, 55.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assete/images/gdts.png'),
                      Text(
                        'Login ',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,

                      ),
                      // Text(
                      //   'Login to your Account',
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .bodyText1
                      //       .copyWith(color: Colors.grey),
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                      TextBoxGDTS(
                        textcontroller: emailController,
                        // ignore: missing_return
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        lable: 'Email ',
                        prefixicon: Icons.email,
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextBoxGDTS(
                        textcontroller: passController,
                        // ignore: missing_return
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        lable: 'Password',
                        prefixicon: Icons.lock_outline,
                        suffix: LoginCubit.get(context).suffix,
                        onsubmit: () {
                          LoginCubit.get(context)
                              .changPasswordVisibility();
                        },
                        type: TextInputType.visiblePassword,
                        isPass: LoginCubit.get(context).isShowPass,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoading,
                        builder: (context) => ButtonGDTS(
                          function: () {
                            if (formKey.currentState.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passController.text,
                              );
                            }
                          },
                          text: 'Login',

                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have an Account ?"),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, RegisterScreen());
                            },
                            child: Text('Register'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
