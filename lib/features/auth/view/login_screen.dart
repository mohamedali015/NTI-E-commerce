import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/helper/my_snackbar.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_svg.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_text_field.dart';
import 'package:nti_ecommerce/core/utils/app_assets.dart';
import 'package:nti_ecommerce/core/utils/app_text_style.dart';
import 'package:nti_ecommerce/features/home/view/AppHomeScreen.dart';

import '../../../core/helper/my_navigator.dart';
import '../../../core/shared_widgets/app_elevated_button.dart';
import '../../../core/shared_widgets/loading_view.dart';
import '../../../core/translations/translation_keys.dart';
import '../../profile/manager/user_cubit/user_cubit.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../manager/login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
        create: (BuildContext context) => LoginCubit(),
        child: Builder(builder: (context) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: MyResponsive.paddingSymmetric(context,
                  horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TranslationKeys.welcomeLogin.tr,
                    style: AppTextStyles.Bold_W700_36(context),
                  ),
                  SizedBox(height: MyResponsive.height(context, value: 45)),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        MySnackbar.success(context, state.message.toString());
                        UserCubit.get(context).getUserData();

                        MyNavigator.goTo(
                            screen: () => AppHomeScreen(), isReplace: true);
                      }
                      if (state is LoginErrorState) {
                        MySnackbar.error(context, state.error.toString());
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: loginCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                              type: TextFieldType.email,
                              controller: loginCubit.emailController,
                            ),
                            SizedBox(
                              height: MyResponsive.height(context, value: 22),
                            ),
                            AppTextField(
                              type: TextFieldType.password,
                              controller: loginCubit.passwordController,
                              obsecure: loginCubit.obscureText,
                              onSuffixTapped: loginCubit.onSuffixIconPressed,
                            ),
                            SizedBox(
                              height: MyResponsive.height(context, value: 50),
                            ),
                            state is LoginLoadingState
                                ? LoadingView()
                                : AppElevatedButton(
                                    buttonText: TranslationKeys.login.tr,
                                    onPressed: loginCubit.onLoginPressed,
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
