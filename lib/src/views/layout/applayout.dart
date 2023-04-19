// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/components/components.dart';
import '../../shared/styles/iconbroken.dart';
import '../layout/cubit/cubit.dart';
import '../layout/cubit/state.dart';
import '../layout/cubit/state.dart';

class AppLayout extends StatelessWidget {

  int initialIndex = 0;
  int countnotification = 0;

  AppLayout(this.initialIndex, {Key? key}) : super(key: key);




@override
  Widget build(BuildContext context) {
     return BlocConsumer<AppCubit , AppStates>
       (listener: (context,state){
         if (state is AppNewPostState)
           {
            AppCubit.get(context).paths = null;
            //  navigateTo(context, NewPostScreen());
           }
     },
       builder: (context,state)
       {
        
        var cubit = AppCubit.get(context);
         var initialIndex =AppCubit.get(context).currentIndex;
         Future.delayed(Duration(seconds: 3), () {
        cubit.getNotification(cubit.userModel!.uId.toString());
    // countnotification = cubit.listNotificationDisplayyes! + 1;
         });
         return  Scaffold(
          resizeToAvoidBottomInset : false,
           appBar: AppBar(
             title:   Text(cubit.titles[initialIndex],),
             actions: [
               Stack(
                 children: [
                  cubit.listNotification!.isNotEmpty ?
                      Positioned(
      top: 10,
      right: 10,
      child: Container(
        height: 15,
        width: 15,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              )
              ,
          color: Colors.red,
        ),
        child: Text(cubit.listNotification!.length.toString(),
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontSize: 12.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    )
    :
    cubit.listNotification! == null ?
    Container()
    :
    Container(),
                    IconButton(onPressed: (){
                      cubit.updateNotification(cubit.userModel!.uId.toString());
                  // navigateTo(context, notificationsPage());
                 }, icon: Icon(IconBroken.Notification,),
                    )
                 ]
                 ),
         IconButton(onPressed: (){
            //  navigateTo(context, SearchFriendPage());
         }, icon: Icon(IconBroken.Search,),
         ),
         ],
           ),
         body: cubit.screens[initialIndex],
           bottomNavigationBar: BottomNavigationBar(
             currentIndex:initialIndex,
             onTap: (index){
               cubit.changeBottomNav(index);

             },
             items:   const [
               BottomNavigationBarItem(icon: Icon(IconBroken.Home,),label: "Home"),
           BottomNavigationBarItem(icon: Icon(IconBroken.Chat,),label: "Chats"),
               BottomNavigationBarItem(icon: Icon(IconBroken.Paper_Upload,),label: "Post"),
               BottomNavigationBarItem(icon: Icon(IconBroken.User,),label: "Friends"),
             BottomNavigationBarItem(icon: Icon(IconBroken.Setting,),label: "Settings"),


             ],
           ),
         );
    }
    );

  }
}
