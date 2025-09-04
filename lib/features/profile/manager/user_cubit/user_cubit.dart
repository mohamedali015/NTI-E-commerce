import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/core/translations/translation_helper.dart';
import 'package:nti_ecommerce/core/translations/translation_keys.dart';
import 'package:nti_ecommerce/features/profile/data/repo/user_repo.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/cache/cache_key.dart';
import '../../../../core/helper/my_navigator.dart';
import '../../../auth/view/get_started_screen.dart';
import '../../data/model/user_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);

  /// Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // language
  bool isEnglish = true;

  void changeLanguage() async {
    isEnglish = !isEnglish;
    await TranslationHelper.changeLanguage(!isEnglish);
    emit(UserChangeLanguageState());
  }

  /// Data
  UserModel userModel = UserModel();
  XFile? imageFile;

  final UserRepo userRepo = UserRepo();

  /// get user data
  Future<bool> getUserData() async {
    emit(UserLoading());
    var response = await userRepo.getUserData();
    return response.fold(
      (error) {
        emit(UserGetError(error: error));
        return false;
      },
      (user) {
        userModel = user;

        nameController.text = userModel.name ?? '';
        phoneController.text = userModel.phone ?? '';

        emit(UserGetSuccess(userModel: user));
        return true;
      },
    );
  }

  /// update user data
  Future<void> updateUserData() async {
    if (formKey.currentState!.validate()) {
      emit(UserUpdateLoading());
      var result = await userRepo.updateUserData(
        name: nameController.text,
        phone: phoneController.text,
        imageFile: imageFile,
      );

      result.fold(
        (String error) {
          emit(UserUpdateError(error: error));
        },
        (message) async {
          await getUserData();
          emit(UserUpdateSuccess(message: message));
        },
      );
    } else {
      emit(UserUpdateError(error: TranslationKeys.fillAllFields.tr));
    }
  }

  /// delete user account
  Future<void> deleteUserAccount() async {
    emit(UserDeleteLoading());
    var result = await userRepo.deleteUserData();
    result.fold(
      (String error) {
        emit(UserDeleteError(error: error));
      },
      (message) {
        logout();
        emit(UserDeleteSuccess(message: message));
      },
    );
  }

  /// logout
  Future<void> logout() async {
    await CacheHelper.removeData(key: CacheKeys.accessToken);
    await CacheHelper.removeData(key: CacheKeys.refreshToken);
    MyNavigator.goTo(screen: GetStartedScreen(), isReplace: true);
  }
}
