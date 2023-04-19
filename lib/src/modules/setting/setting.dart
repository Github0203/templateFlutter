import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/layout/cubit/cubit.dart';
import '../../views/layout/cubit/state.dart';
import '../../models/user_model.dart';
import 'package:ngocanh/src/shared/styles/changeThemeButton/changeThemeButton.dart';
import 'package:ngocanh/src/shared/components/components.dart';

 

class Setting extends StatefulWidget {

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
   bool navigatorbutton = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    
    return Builder(
      builder: (context) {

        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
           
          },
          builder: (context, state) {
            UserModel? userModel = AppCubit.get(context).userModel;
            double setWidth = MediaQuery.of(context).size.width;
            double setheight = MediaQuery.of(context).size.height;

            return RefreshIndicator(
              onRefresh: () async { setState(() {}); },
              child: ConditionalBuilder(
                condition: 
                    AppCubit.get(context).userModel != null,
                builder: (context) => 
                userModel == null ?
                Center(child: SizedBox(
                  width: setWidth-20,
                  height: 1000,
                  child: const Text('No data'),
                )) 
                :
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child:  containerPadding(
                    child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),  Column(
                                children:  <Widget>[
                                  InkWell(
                                onTap: (){
                                  AppCubit.get(context).signOut(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                  const [
                                    Icon(Icons.power_settings_new,size: 20,),
                                    SizedBox(width: 10,),
                                    Text('SignOut',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.dark_mode_outlined,
                                  size: 20,
                                ),
                                const Text(
                                  '  Night Mode',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const Spacer(),
                                SwitchWidget(),
                              ],
                            ),
                                                
                                ],
                              ),
                          
                        ],
                      ),
                  ),
                ),
                
                fallback: (context) => 
                const Text('no data')
              ),
            );
          },
        );
      }
    );
  }

 }

