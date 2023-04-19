import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngocanh/src/modules/register/verify_screen.dart';
import '../../../src/views/layout/cubit/cubit.dart';
import '../../../src/views/layout/applayout.dart';
import '../../../src/shared/components/components.dart';
import '../../../src/shared/components/constants.dart';
import '../../../src/shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'register_screen.dart';
import 'package:emailjs/emailjs.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var email = '';
  


  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is CreateUserSuccessState) {
            // CacheHelper.saveData(
            //   key: 'uId',
            //     value:state.uId,
            // ).then((value) async {
            //   Cubit.get(context).getUserData(uId);

              showToast(
                text: 'Please Verify Account',
                state: ToastStates.SUCCESS,
              );
            navigateTo(context, VerifyScreen(getEmai: email));
            // navigateTo(context, hihi());
            print('getEmai: ' + email.toString());
            RegisterCubit.get(context).getVerifySuccess(email);
            // });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 38,
                          ),
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          context: context,
                          type: TextInputType.name,
                          keyboardType: TextInputType.name,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Name must not be Empty !!';
                            }
                            return null;
                          },
                          controller: nameController,
                          prefix: Icons.person,
                          labelText: "User Name",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          context: context,
                          type: TextInputType.emailAddress,
                          keyboardType: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Email must not be Empty !!';
                            }
                            return null;
                          },
                          controller: emailController,
                          prefix: Icons.email_outlined,
                          labelText: "Email address",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          context: context,
                          type: TextInputType.visiblePassword,
                          keyboardType: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'password is too short !!';
                            }
                            return null;
                          },
                          controller: passwordController,
                          suffix: RegisterCubit.get(context).suffix,
                          isPassword:
                              RegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          prefix: Icons.lock_outline,
                          labelText: "Password",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          context: context,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          type: TextInputType.number,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'phone must not be empty';
                            }
                            return null;
                          },
                          labelText: "+84",
                          prefix: Icons.phone,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        
                        Center(
                          child: defaultTextButton(
                            text: "Register",
                            style: TextStyle(color: Colors.blue),
                            isUpperCase: true,
                            function: () {
                              email = emailController.text;
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  context: context,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        if (state is RegisterLoadingState)
                          LinearProgressIndicator(color: Colors.blue,),
                      ],
                    ),
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
