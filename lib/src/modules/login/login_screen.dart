import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


import '../../../src/views/layout/cubit/cubit.dart';
import '../../../src/views/layout/applayout.dart';
import '../../../src/shared/components/components.dart';
import '../../../src/shared/components/constants.dart';
import '../../../src/shared/network/local/cache_helper.dart';
import '../../../src/shared/styles/color.dart';
import '../register/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'forget_your_pass.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          var UserModel = AppCubit.get(context).userModel;
          if (state is LoginErrorState) {
            // showToast(text: state.error, state: ToastStates.ERROR);
            showToast(text: "Email hoặc mật khẩu không đúng", state: ToastStates.ERROR);

          }
          if(state is LoginSuccessState )
            {
              CacheHelper.saveData(
                key: 'uId',
                value:state.uId,
              ).then((value) async {
                AppCubit.get(context).getUserData(uId);
                showToast(
                  text: 'Welcome in  App',
                  state: ToastStates.SUCCESS,
                );
                navigateAndFinish(context, AppLayout(0));
                AppCubit.get(context).currentIndex = 0;


              });
            }
          else if (state is CreateGoogleUserSuccessState)
            {
              CacheHelper.saveData(
                key: 'uId',
                value:state.uId,
              ).then((value) async {
                AppCubit.get(context).getUserData(uId);
                showToast(
                  text: 'Welcome in  App',
                  state: ToastStates.SUCCESS,
                );
                navigateAndFinish(context, AppLayout(0));
                AppCubit
                    .get(context)
                    .currentIndex = 0;
              });
            }
          else if (state is LoginGoogleUserSuccessState)
            {
              CacheHelper.saveData(
                key: 'uId',
                value:state.uId,
              ).then((value) async {
                AppCubit.get(context).getUserData(uId);
                showToast(
                  text: 'Welcome in  App ' ,
                  state: ToastStates.SUCCESS,
                );
                navigateAndFinish(context, AppLayout(0));
                AppCubit
                    .get(context)
                    .currentIndex = 0;
              });

            }
          else if (state is CreateFacebookUserSuccessState)
          {
            CacheHelper.saveData(
              key: 'uId',
              value:state.uId,
            ).then((value) async {
              AppCubit.get(context).getUserData(uId);
              showToast(
                text: 'Welcome in  App',
                state: ToastStates.SUCCESS,
              );
              navigateAndFinish(context, AppLayout(0));
              AppCubit
                  .get(context)
                  .currentIndex = 0;
            });
          }
          else if (state is LoginFacebookUserSuccessState)
          {
            CacheHelper.saveData(
              key: 'uId',
              value:state.uId,
            ).then((value) async {
              AppCubit.get(context).getUserData(uId);
              showToast(
                text: 'Welcome in  App',
                state: ToastStates.SUCCESS,
              );
              navigateAndFinish(context, AppLayout(0));
              AppCubit
                  .get(context)
                  .currentIndex = 0;
            });

          }

        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: const [

              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 38,  ),
                        ),
                        const Text(
                          'Login now to browse our hot offers',
                          style: TextStyle(fontSize: 18, color: Colors.grey ),

                        ),
                        const SizedBox(
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
                          },
                          controller: emailController,

                          prefix: Icons.email_outlined,
                          labelText: "Email address",
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),

                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                        ),
                        const SizedBox(
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
                          },
                          controller: passwordController,
                          suffix: LoginCubit
                              .get(context)
                              .suffix,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
                            }
                          },
                          // onChange: (value)
                       //    {print(value!);},
                          isPassword: LoginCubit
                              .get(context)
                              .isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },

                          prefix: Icons.lock_outline,
                          labelText: "Password",

                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(child: const Text("forget your password",style: TextStyle(color:Colors.grey),),
                            onPressed: () {
                              navigateTo(context, ForgotPasswordScreen());
                            }
                          ),
                        ),
                        Center(
                          child: ConditionalBuilder(
                            condition: State is! LoginLoadingState,
                            builder: (context) =>
                                defaultTextButton(
                                  text: "Login", style: const TextStyle(color:defaultColor),
                                  isUpperCase: true,
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);

                                    }
                                  },
                                ),
                            fallback: (context) => const Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        if(state is LoginLoadingState)
                          const LinearProgressIndicator(color: Colors.blue,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.grey[300],
                                height: 1,
                              ),
                            ),
                            Container(

                                padding: const EdgeInsets.all(8),
                                child: const Text("OR Sign With",
                                 )),
                            Expanded(
                              child: Container(
                                color: Colors.grey[300],
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: ()  {

                              LoginCubit.get(context).signInWithFacebook();
                              },

                              child: CircleAvatar(
                                child: state is LoginFacebookUserLoadingState?
                                const CircularProgressIndicator() :
                                const Image(image:AssetImage('assets/images/facebook_logo.png',),width: 40,height: 40,),
                                backgroundColor: Colors.white.withOpacity(0),
                              ),
                            ),
                            const SizedBox(width: 50,),
                            InkWell(
                              onTap: (){
                               LoginCubit.get(context).getGoogleUserCredentials();

                              },
                              child: CircleAvatar(
                                 child: state is LoginGoogleUserLoadingState?
                                 const CircularProgressIndicator() :
                                const Image(image:AssetImage('assets/images/Google_Logo.png',),width: 50,height: 50,),
                                backgroundColor:Colors.white.withOpacity(0),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 20,),
                        
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(
                                  context,
                                  RegisterScreen(),
                                );
                              },
                              text: 'register',
                            ),
                          ],
                        ),
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
