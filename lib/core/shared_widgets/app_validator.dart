import 'package:get/get.dart';
import 'package:nti_ecommerce/core/translations/translation_keys.dart';

abstract class Validator {
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.nameRequired.tr;
    }
    if (value.length < 3) {
      return TranslationKeys.nameLength.tr;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.emailRequired.tr;
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return TranslationKeys.emailValid.tr;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.passwordRequired.tr;
    }
    if (value.length < 6) {
      return TranslationKeys.passwordLength.tr;
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.confirmPasswordRequired.tr;
    }
    if (value != password) {
      return TranslationKeys.passwordNotMatch.tr;
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return TranslationKeys.phoneRequired.tr;
    }
    final phoneRegex = RegExp(r'^\d{11}$');
    if (!phoneRegex.hasMatch(value)) {
      return TranslationKeys.phoneValid.tr;
    }
    return null;
  }
}
