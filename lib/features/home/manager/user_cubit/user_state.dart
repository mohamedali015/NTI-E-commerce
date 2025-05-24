import '../../data/model/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserGetSuccess extends UserState {
  UserModel userModel;

  UserGetSuccess({required this.userModel});
}

class UserGetError extends UserState {
  String error;

  UserGetError({required this.error});
}
