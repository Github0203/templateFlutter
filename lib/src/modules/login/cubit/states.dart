


abstract class LoginStates{}

class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  late final String uId;
  LoginSuccessState(this.uId);

}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}

class ChangePasswordState extends LoginStates{}
///CreateGoogleUSer State
class CreateGoogleUserLoadingState extends LoginStates{}
class CreateGoogleUserSuccessState extends LoginStates{
  final  String uId;
  CreateGoogleUserSuccessState(this.uId);
}
class CreateGoogleUserErrorState extends LoginStates{}
///End of CreateUser State
///LoginGoogleUSer State
class LoginGoogleUserLoadingState extends LoginStates{}
class LoginGoogleUserSuccessState extends LoginStates{
  final  String uId;
  LoginGoogleUserSuccessState(this.uId);
}
class LoginGoogleUserErrorState extends LoginStates{}
///End of LoginUser State

///reset pass

class ResetPasswordLoadingState extends LoginStates{}
class ResetPasswordSuccessState extends LoginStates{}
class ResetPasswordErrorState extends LoginStates{}


///facebook state
class CreateFacebookUserLoadingState extends LoginStates{}
class CreateFacebookUserSuccessState extends LoginStates{
final  String uId;
CreateFacebookUserSuccessState(this.uId);
}
class CreateFacebookUserErrorState extends LoginStates{}

///LoginFacebookleUSer State
class LoginFacebookUserLoadingState extends LoginStates{}
class LoginFacebookUserSuccessState extends LoginStates{
  final  String uId;
  LoginFacebookUserSuccessState(this.uId);
}
class LoginFacebookUserErrorState extends LoginStates{}
///End of LoginUser State

