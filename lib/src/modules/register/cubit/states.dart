

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  late final String uId;
  RegisterSuccessState(this.uId);
}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}




class CreateUserSuccessState extends RegisterStates{
  late final String uId;
  CreateUserSuccessState(this.uId);
}
class CreateUserErrorState extends RegisterStates{
  final String error;
  CreateUserErrorState(this.error);
}
class VerifyUserSuccessState extends RegisterStates{
  late final String uId;
  VerifyUserSuccessState(this.uId);
}
class VerifyUserErrorState extends RegisterStates{
  final String error;
  VerifyUserErrorState(this.error);
}




class AddPasswordStatue extends RegisterStates{}

class CheckVerifySuccessState extends RegisterStates{}
class CheckVerifyErrorState extends RegisterStates{}