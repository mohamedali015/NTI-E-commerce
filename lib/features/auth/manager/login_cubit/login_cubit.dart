import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  bool obscureText = true;

  LoginCubit() : super(LoginInitState());
  AuthRepo authRepo = AuthRepo();

  static LoginCubit get(context) => BlocProvider.of(context);

  void onLoginPressed() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoadingState());
    var result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((String error) {
      emit(LoginErrorState(error: error));
    }, (userModel) {
      emit(LoginSuccessState(user: userModel, message: "Login successfully"));
    });
  }

  void onSuffixIconPressed() {
    obscureText = !obscureText;
    emit(LoginShowPasswordState());
  }
}
