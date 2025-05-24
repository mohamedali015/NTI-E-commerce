import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_navigator.dart';
import 'package:nti_ecommerce/features/auth/manager/register_cubit/register_cubit.dart';
import 'package:nti_ecommerce/features/auth/view/login_screen.dart';

import '../../../core/helper/my_responsive.dart';
import '../../../core/shared_widgets/app_elevated_button.dart';
import '../../../core/shared_widgets/app_svg.dart';
import '../../../core/shared_widgets/app_text_field.dart';
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message!),
                            backgroundColor: AppColors.primary,
                          ),
                        );
                        MyNavigator.goTo(
                            screen: LoginScreen(), isReplace: true);
                      }

                      if (state is RegisterErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: registerCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                              labelText: TranslationKeys.name.tr,
                              controller: registerCubit.nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name is required';
                                } else if (value.length < 2) {
                                  return 'Name must be at least 2 characters';
                                }
                                return null;
                              },
                              prefixIcon: Icon(Icons.person),
                            ),
                            SizedBox(
                              height: MyResponsive.height(context, value: 10),
                            ),
                            AppTextField(
                              labelText: TranslationKeys.phone.tr,
                              controller: registerCubit.phoneController,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone number is required';
                                } else if (!RegExp(r'^(01)[0-9]{9}$')
                                    .hasMatch(value)) {
                                  return 'Enter a valid Egyptian phone number';
                                }
                                return null;
                              },
                              prefixIcon: Icon(Icons.phone),
                            ),
                            SizedBox(
                              height: MyResponsive.height(context, value: 10),
                            ),
                            AppTextField(
                              labelText: TranslationKeys.email.tr,
                              controller: registerCubit.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                } else if (!RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                              prefixIcon: Icon(Icons.email),
                            ),
                            SizedBox(
                              height: MyResponsive.height(context, value: 10),
                            ),
                            AppTextField(
                                labelText: TranslationKeys.password.tr,
                                controller: registerCubit.passwordController,
                                obscureText: registerCubit.obscureText,
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed:
                                      registerCubit.onPasswordSuffixIconPressed,
                                  icon: Icon(
                                    registerCubit.obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: MyResponsive.height(context, value: 10),
                            ),
                            AppTextField(
                                labelText: TranslationKeys.confirmPassword.tr,
                                controller:
                                    registerCubit.confirmPasswordController,
                                obscureText: registerCubit.confirmObscureText,
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: registerCubit
                                      .onConfirmPasswordSuffixIconPressed,
                                  icon: Icon(
                                    registerCubit.confirmObscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Confirm password is required';
                                  } else if (value !=
                                      registerCubit.passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: MyResponsive.height(context, value: 20),
                            ),
                            Text(
                              TranslationKeys.politics.tr,
                              style: AppTextStyles.Regular_W400_12(context)
                                  .copyWith(color: AppColors.darkGray),
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
