import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../src/modules/login/login_screen.dart';
import '../../../src/shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'dart:async'; 
import 'dart:math';

import 'package:emailjs/emailjs.dart';

// ignore: must_be_immutable
class VerifyScreen extends StatefulWidget {
  String getEmai;

  VerifyScreen({ required this.getEmai, Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  var formKey = GlobalKey<FormState>();

  var verifyController = TextEditingController();
  Timer? _timer;
int _start = 180;
void startTimer() {
  const oneSec = const Duration(seconds: 1);
  _timer = Timer.periodic(
    oneSec,
    (Timer timer) => setState(
      () {
        if (_start < 1) {
          timer.cancel();
          setState(() {
            _start = 0;
          });
        } else {
          _start = _start - 1;
        }
      },
    ),
  );
}

 @override
    void initState() {
      super.initState();
      startTimer();
    }
 var rndnumber="";
  var rnd = Random();
  
    void senmail(){
        rndnumber="";
      for (var i = 0; i < 6; i++) {
  // rndnumber = rndnumber + rnd.nextInt(9).toString();
  setState(() {
    rndnumber = rndnumber + rnd.nextInt(6).toString();
  });
  }
      try {
       EmailJS.send(
        'service_vxgvq6x',
        'template_40nq44d',
        {
          'from_name': ' App',
          'user_email': widget.getEmai,
          'message': 'Verify: ' + rndnumber.toString(),
        },
        const Options(
          publicKey: 'RFyzzHduLJs_QKroA',
          privateKey: 'tlITjk5QsKzoU0G7FcU7o',
        ),
      );
    } catch (error) {
      if (error is EmailJSResponseStatus) {
        print('ERROR... ${error.status}: ${error.text}');
      }
      print(error.toString());
    }
    print(widget.getEmai);
    print(rndnumber);
    print('SEND VERIFY AGAIN SUCCESS!');
    }

// @override
// void dispose() {
//   _timer!.cancel();
//   super.dispose();
// }

void restartApp(){
  setState(() {
    formKey = GlobalKey<FormState>();
    _start = 180;
  });
  startTimer();
}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
   
          if (state is VerifyUserErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is CheckVerifySuccessState) {
            // CacheHelper.saveData(
            //   key: 'uId',
            //     value:RegisterCubit.get(context).getUIDVerify,
            // ).then((value) async {
            //   Cubit.get(context).getUserData(uId);

            // });
            
              showToast(
                text: 'Verify Success',
                state: ToastStates.SUCCESS,
              );
              navigateAndFinish(
                context,
                LoginScreen(),

              );
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
                          'Verify',
                          style: TextStyle(
                            fontSize: 38,
                          ),
                        ),
                        Text(
                              'Please verify for: ' + widget.getEmai.toString(),
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          context: context,
                          type: TextInputType.number,
                          keyboardType: TextInputType.name,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Value must not be Empty !!';
                            }
                            return null;
                          },
                          controller: verifyController,
                          prefix: Icons.password_outlined,
                          labelText: "Input",
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
                        SizedBox(
                          child: Center(
                            child: Text("$_start"),
                          ),
                        ),
                        Visibility(
                          visible : _start > 0 ? false : true,
                          child: Center(
                            child: ElevatedButton(
                          onPressed: () {
                            restartApp();
                           
                            Future.delayed(Duration(seconds: 3), () {
                               print('------getUIDVerify-------  '  + RegisterCubit.get(context).getUIDVerify);
                               RegisterCubit.get(context).senmailAgain(widget.getEmai, );
          });
                           
                          },  //<-- SEE HERE
                          child: const Text(
                            'Send OTP email again',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: ElevatedButton(
                          onPressed: _start == 0 ? null : () {
                             
                               
                                Future.delayed(Duration(seconds: 2), () {
                                  if (formKey.currentState!.validate()) {
                          RegisterCubit.get(context).checkVerify(widget.getEmai, verifyController.text);
                            
                                }
                              
                            //   if(verifyController.text != RegisterCubit.get(context).getVerify){
                            //       print(verifyController.text);
                            //       print('000000000000000000000000');
                            //       print(RegisterCubit.get(context).getVerify);
                            // showToast(text: 'Verify not Invalid', state:  ToastStates.ERROR);
                            //   }
                          });
                          
                               
                              }, //<-- SEE HERE
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 24),
                          ),
                                ),
                        ),
                        SizedBox(
                          height: 15,
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
