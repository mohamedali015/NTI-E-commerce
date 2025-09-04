import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_ecommerce/core/helper/my_snackbar.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_appbar.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_elevated_button.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_text_field.dart';
import 'package:nti_ecommerce/core/shared_widgets/image_manager/image_manager_view.dart';
import 'package:nti_ecommerce/core/translations/translation_keys.dart';
import 'package:nti_ecommerce/features/profile/view/widgets/profile_image_widget.dart';

import '../../../core/helper/my_navigator.dart';
import '../../../core/helper/my_responsive.dart';
import '../../../core/utils/app_colors.dart';
import '../manager/user_cubit/user_cubit.dart';
import '../manager/user_cubit/user_state.dart';
import 'widgets/showing_dialog_widget.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = UserCubit.get(context);
    return Scaffold(
      appBar:
          AppAppBar.appBar(context: context, title: TranslationKeys.profile.tr),
      body: Form(
          key: userCubit.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: MyResponsive.paddingSymmetric(context, horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: MyResponsive.height(context, value: 25)),
                  CircleAvatar(
                    radius: MyResponsive.width(context, value: 50),
                    backgroundColor: Colors.transparent,
                    child: ImageManagerView(
                      onPicked: (XFile imageFile) {
                        userCubit.imageFile = imageFile;
                      },
                      pickedBody: (XFile imageFile) {
                        return ProfileImageWidget(
                          imagePath: imageFile.path,
                          width: MyResponsive.width(context, value: 100),
                        );
                      },
                      unPickedBody: ProfileImageWidget(
                          imagePath: userCubit.userModel.imagePath,
                          width: MyResponsive.width(context, value: 100)),
                    ),
                  ),
                  SizedBox(height: MyResponsive.height(context, value: 66)),
                  AppTextField(
                      type: TextFieldType.name,
                      controller: userCubit.nameController),
                  SizedBox(height: MyResponsive.height(context, value: 10)),
                  AppTextField(
                      type: TextFieldType.phone,
                      controller: userCubit.phoneController),
                  SizedBox(height: MyResponsive.height(context, value: 75)),
                  BlocListener<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is UserDeleteSuccess) {
                        MySnackbar.success(context, state.message);
                      } else if (state is UserUpdateSuccess) {
                        MySnackbar.success(context, state.message);
                        MyNavigator.pop();
                      } else if (state is UserUpdateError) {
                        MySnackbar.error(context, state.error);
                      } else if (state is UserDeleteError) {
                        MySnackbar.error(context, state.error);
                      }
                    },
                    child: AppElevatedButton(
                      buttonText: TranslationKeys.save.tr,
                      onPressed: userCubit.updateUserData,
                      foregroundColor: AppColors.white,
                    ),
                  ),
                  SizedBox(height: MyResponsive.height(context, value: 300)),
                  AppElevatedButton(
                    buttonText: TranslationKeys.deleteAccount.tr,
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => const ShowingDialogWidget(),
                      );
                    },
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.primary,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
