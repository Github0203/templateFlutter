import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngocanh/src/modules/login/cubit/cubit.dart';
import 'package:ngocanh/src/modules/login/cubit/states.dart';
import 'package:ngocanh/src/modules/login/login_screen.dart';
import 'package:ngocanh/src/shared/components/components.dart';

class ForgotPasswordScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>LoginCubit(),
    child: BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if (state is ResetPasswordSuccessState)
          {
            showToast(text: "Check Your email to Reset your password", state: ToastStates.SUCCESS);
            navigateAndFinish(context, const LoginScreen());
          }
      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            actions: const [],
          ),
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(

                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        Text('Forget Your Password',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Enter the email address associated with your account",
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        defaultFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Must not be Empty !!";
                              }
                              return null;
                            },
                            prefix: Icons.email,

                            labelText: "Enter email address"),
                        SizedBox(height: 20,),
                        state is ResetPasswordLoadingState ?
                        CircularProgressIndicator():
                        TextButton( child: Text( "Reset Password",style: TextStyle(fontSize: 20),),onPressed: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).resetPassword(email: emailController.text);
                          }

                        },)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      ),);
  }
}
