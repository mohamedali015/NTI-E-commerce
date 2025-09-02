import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_navigator.dart';
import 'package:nti_ecommerce/core/helper/my_snackbar.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_text_field.dart';
import 'package:nti_ecommerce/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:nti_ecommerce/features/auth/view/login_screen.dart';

import '../../../core/helper/my_responsive.dart';
import '../../../core/shared_widgets/app_elevated_button.dart';
import '../../../core/shared_widgets/app_svg.dart';
import '../../../core/shared_widgets/loading_view.dart';
import '../../../core/translations/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../manager/register_cubit/register_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: AppSvg(path: AppAssets.backArrow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: Builder(builder: (context) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: MyResponsive.paddingSymmetric(context,
                  horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TranslationKeys.welcomeRegister.tr,
                    style: AppTextStyles.Bold_W700_36(context),
                  ),
                  SizedBox(height: MyResponsive.height(context, value: 45)),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccessState) {
                        MySnackbar.success(context, state.message.toString());
                        MyNavigator.goTo(
                            screen: LoginScreen(), isReplace: true);
                      }

                      if (state is RegisterErrorState) {
                        MySnackbar.error(context, state.error.toString());
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: registerCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                                type: TextFieldType.name,
                                controller: registerCubit.nameController),
                            SizedBox(
                              height: MyResponsive.height(context, value: 10),
                            ),
                            AppTextField(
                                type: TextFieldType.phone,
                                controller: registerCubit.phoneController),
                            SizedBox(
                              height: MyResponsive.height(context, value: 10),
                            ),
                            AppTextField(
                                type: TextFieldType.email,
                                controller: registerCubit.emailController),
                            SizedBox(
                              height: MyResponsive.height(context, value: 10),
                            ),
                            AppTextField(
                              type: TextFieldType.password,
                              controller: registerCubit.passwordController,
                              obsecure: registerCubit.obscureText,
                              onSuffixTapped:
                                  registerCubit.onPasswordSuffixIconPressed,
                            ),
                            SizedBox(
                              height: MyResponsive.height(context, value: 10),
                            ),
                            AppTextField(
                              type: TextFieldType.password,
                              controller:
                                  registerCubit.confirmPasswordController,
                              obsecure: registerCubit.confirmObscureText,
                              onSuffixTapped: registerCubit
                                  .onConfirmPasswordSuffixIconPressed,
                              passController: registerCubit.passwordController,
                            ),
                            SizedBox(
                              height: MyResponsive.height(context, value: 20),
                            ),
                            Text(
                              TranslationKeys.politics.tr,
                              style: AppTextStyles.Regular_W400_12(context,
                                  color: AppColors.darkGray),
                            ),
                            SizedBox(
                              height: MyResponsive.height(context, value: 26),
                            ),
                            state is RegisterLoadingState
                                ? LoadingView()
                                : AppElevatedButton(
                                    buttonText: TranslationKeys.register.tr,
                                    onPressed: registerCubit.onRegisterPressed,
                                  ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
