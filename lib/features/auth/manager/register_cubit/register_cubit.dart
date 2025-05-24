import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/features/auth/manager/register_cubit/register_state.dart';

import '../../data/repo/auth_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  bool obscureText = true;
  bool confirmObscureText = true;
  XFile? image;

  AuthRepo authRepo = AuthRepo();

  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void onRegisterPressed() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(RegisterLoadingState());
    var result = await authRepo.register(
      email: emailController.text,
      password: passwordController.text,
      image: image,
      name: nameController.text,
      phone: phoneController.text,
    );
    result.fold((String error) {
      log(error.toString());
      emit(RegisterErrorState(error: error));
    }, (r) {
      emit(RegisterSuccessState(message: "User Registered successfully"));
    });
  }

  void onPasswordSuffixIconPressed() {
    obscureText = !obscureText;
    emit(RegisterShowPasswordState());
  }

  void onConfirmPasswordSuffixIconPressed() {
    confirmObscureText = !confirmObscureText;
    emit(RegisterShowPasswordState());
  }
}
