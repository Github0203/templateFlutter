import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/views/layout/cubit/cubit.dart';
import '../../../src/views/layout/cubit/state.dart';
import '../../../src/views/layout/applayout.dart';
import '../../../src/models/user_model.dart';
import '../../../src/shared/components/components.dart';
import '../../../src/shared/styles/iconbroken.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:readmore/readmore.dart';
import 'package:expandable/expandable.dart';
 

class Dashboard extends StatefulWidget {

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
   bool _isLoading = true;
   bool navigatorbutton = true;
   ScrollController scrollController = ScrollController(
  initialScrollOffset: 2, // or whatever offset you wish
  keepScrollOffset: true,
);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  // 1. Using Timer
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
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
                  child: Column(
                    children: const <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text('no data'),
                    ],
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

