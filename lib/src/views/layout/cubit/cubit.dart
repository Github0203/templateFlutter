import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngocanh/src/models/NotificationModel.dart';
import 'package:ngocanh/src/views/layout/cubit/state.dart';
import 'package:ngocanh/src/models/user_model.dart';
import 'package:ngocanh/src/shared/network/local/cache_helper.dart';
import 'package:ngocanh/src/shared/components/constants.dart';
import 'package:ngocanh/src/modules/dashboard/dashboard.dart';
import 'package:ngocanh/src/modules/setting/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../modules/login/login_screen.dart';
import '../../../shared/components/components.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
    


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String? fileName;
  List<PlatformFile>? paths = null;
  String? _extension;

  int currentIndex = 0;
  List<Widget> screens = [
    Dashboard(),
    Container(),
    Container(),
    Container(),
    Setting(),
  ];
  List<String> titles = ['Home', 'Chats', 'Post', 'Friends', 'Settings'];
  void changeBottomNav(int index) {
    if (index == 1) {
      // getAllUsers();
    }
    if (index == 4) {
      getUserData(uId);
    }
    if (index == 3) {
      // getAllUsers();
    }
    if (index == 2) {
      // emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNav());
    }
  }

  UserModel? userModel = null;
  void getUserData(String? uId) {
    emit(AppGetUserLoadingState());
    uId = CacheHelper.getData(key: 'uId');
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data());
      if (kDebugMode) {
        print(userModel.toString());
      }

      emit(AppGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  ////////////// Notification
  List<NotificationModel>? listNotification = [];
  List<NotificationModel>? listNotificationSeenyes = [];
  List<NotificationModel>? listNotificationSeenno = [];
  void getNotification(String getuId) {
    // emit(GetSocialNotificationLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuId)
        .collection("notifications")
        .where('display', isEqualTo: 'yes')
        // .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      listNotification!.clear();
      event.docs.forEach((element) {
        listNotification!.add(NotificationModel.fromJson(element.data()));
        //  emit(GetSociallNotificationSuccessState());
      });
    });
  }

  void getNotificationAll(String getuId) {
    // emit(GetSocialNotificationLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuId)
        .collection("notifications")
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      listNotification!.clear();
      event.docs.forEach((element) {
        listNotification!.add(NotificationModel.fromJson(element.data()));
        emit(GetSociallNotificationSuccessState());
      });
    });
  }

  void getNotificationwithSeenisYes(String getuId) {
    // emit(GetSocialNotificationLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuId)
        .collection("notifications")
        .where('seen', isEqualTo: 'yes')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      listNotificationSeenyes!.clear();
      event.docs.forEach((element) {
        listNotificationSeenyes!
            .add(NotificationModel.fromJson(element.data()));
        //  emit(GetSociallNotificationSuccessState());
      });
    });
  }

  void getNotificationwithSeenisNo(String getuId) {
    // emit(GetSocialNotificationLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuId)
        .collection("notifications")
        .where('seen', isEqualTo: 'no')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      listNotificationSeenno!.clear();
      event.docs.forEach((element) {
        listNotificationSeenno!.add(NotificationModel.fromJson(element.data()));
        //  emit(GetSociallNotificationSuccessState());
      });
    });
  }

  void updateNotification(String getuId) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuId)
        .collection('notifications')
        .where('display', isEqualTo: 'yes')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(getuId)
            .collection('notifications')
            .doc(element.id)
            .update(({
              // 'display': 'no',
              'iDNotification': element.id.toString()
            }));
        //  listNotification!.add(NotificationModel.fromJson(element.data()));
        emit(UpdateSociallNotificationSuccessState());
      });
    });
  }

  void updateNotificationItem(String getuId, String idNotification) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(getuId)
        .collection('notifications')
        .doc(idNotification)
        .update(({
          'display': 'no',
          'seen': 'yes',
        }));
    emit(UpdateSociallNotificationSuccessState());
  }
  //// End Notification
 


  //// Info Signout and Token
  final googleSignIn=GoogleSignIn();


  dynamic signOut(context) async {
    
    await CacheHelper.removeData(
      key: 'uId',
    ).then((value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
        AppCubit.get(context).currentIndex = 0; 
      }
    });
    await googleSignIn.disconnect();
     FirebaseAuth.instance.signOut();
  }

  void setUserToken() async{
    String? token = await FirebaseMessaging.instance.getToken();
    await FirebaseFirestore.instance.collection('users').doc(userModel!.uId)
        .update({'token': token})
        .then((value) => {});
        print(token);
  }

  Future getMyData() async {

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .snapshots()
        .listen((value) async {
      userModel = UserModel.fromJson(value.data());
      setUserToken(); 

    });
  }
  //// End Info Signout and Token
  
}
