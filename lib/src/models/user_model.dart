import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel
{
  String ? name;
  String ? queryable;
   String  ?email;
   String ? phone;
   String ? uId;
  String? token;
  String ? image;
  String ? cover;
  String ? bio;
  String ? password;
  String ? verify;
  String ? auth;
  FieldValue? dateTime;

  UserModel({
  this.auth, this.verify, this.password, this.name, this.queryable,  this.token, this.email , this.phone , this.uId, this.image , this.cover , this.bio ,  this.dateTime,  
});
  UserModel.fromJson(Map<String,dynamic>?json)
  {
    name = json!['name'];
    auth = json!['auth'];
    verify = json!['verify'];
    password = json!['password'];
    queryable = json!['queryable'];
    email = json['email'];
    token = json['token'];

    phone = json['phone'];

    uId = json['uId'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];

  }
  Map<String,dynamic>toMap()
  {
    return {
      'name':name,
      'auth':auth,
      'password':password,
      'verify':verify,
      'queryable':queryable,
      'email':email,
      'phone':phone,
      'token': token,
      'uId':uId,
      'image':image,
      'cover':cover,
      'bio':bio,
      'dateTime':dateTime,
    

    };
  }

}
