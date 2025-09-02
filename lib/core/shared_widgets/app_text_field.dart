import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/helper/my_responsive.dart';
import 'package:nti_ecommerce/core/shared_widgets/app_validator.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';

import '../translations/translation_keys.dart';
import '../utils/app_text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.type,
    required this.controller,
    this.passController,
    this.obsecure = true,
    this.onSuffixTapped,
  });

  final TextFieldType type;
  final TextEditingController controller;
  final TextEditingController? passController;
  final bool obsecure;
  final void Function()? onSuffixTapped;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TextFieldType.password:
        return _passwordField(
          context,
          passController == null
              ? Validator.password
              : (value) =>
                  Validator.confirmPassword(value, passController!.text),
        );
      case TextFieldType.email:
        return _emailField(context, Validator.email);
      case TextFieldType.phone:
        return _phoneField(context, Validator.phone);
      case TextFieldType.name:
        return _nameField(context, Validator.name);
    }
  }

  ///////////////////////--Decorations//////////////////////
  InputDecoration _inputDecoration(
    BuildContext context, {
    required String label,
    String? hint,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle:
          AppTextStyles.Medium_W500_12(context, color: AppColors.darkGray),
      labelText: label,
      labelStyle:
          AppTextStyles.Medium_W500_12(context, color: AppColors.darkGray),
      errorStyle: AppTextStyles.Medium_W500_12(context, color: AppColors.red),
      filled: true,
      fillColor: AppColors.lightWhite,
      contentPadding: EdgeInsets.symmetric(
        vertical: MyResponsive.height(context, value: 20),
        horizontal: MyResponsive.width(context, value: 10),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: _border(context, AppColors.grey),
      focusedErrorBorder: _border(context, AppColors.red),
      focusedBorder: _border(context, AppColors.primary),
      enabledBorder: _border(context, AppColors.grey),
      errorBorder: _border(context, AppColors.red),
    );
  }

  TextStyle _textStyle(BuildContext context) {
    return AppTextStyles.Medium_W500_12(context, color: AppColors.black);
  }

  InputBorder _border(BuildContext context, Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(MyResponsive.width(context, value: 10)),
      ),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  /////////////////////////--TextFields////////////////////////////////
  Widget _nameField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      style: _textStyle(context),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      decoration: _inputDecoration(
        context,
        label: TranslationKeys.name.tr,
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Widget _emailField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: _textStyle(context),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration(
        context,
        label: TranslationKeys.email.tr,
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget _phoneField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: _textStyle(context),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      decoration: _inputDecoration(
        context,
        label: TranslationKeys.phone.tr,
        prefixIcon: Icon(Icons.phone),
      ),
    );
  }

  Widget _passwordField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: _textStyle(context),
      obscureText: obsecure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      decoration: _inputDecoration(
        context,
        label: TranslationKeys.password.tr,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: onSuffixTapped,
          icon: obsecure ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
        ),
      ),
    );
  }
}

enum TextFieldType { password, email, phone, name }
