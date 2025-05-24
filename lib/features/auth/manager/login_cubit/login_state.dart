import '../../../home/data/model/user_model.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  UserModel user;
  String? message;

  LoginSuccessState({required this.user, this.message});
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}

class LoginShowPasswordState extends LoginState {}
