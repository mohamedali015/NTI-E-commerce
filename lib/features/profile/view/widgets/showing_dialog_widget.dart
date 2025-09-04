import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nti_ecommerce/core/translations/translation_keys.dart';
import 'package:nti_ecommerce/features/profile/manager/user_cubit/user_cubit.dart';

class ShowingDialogWidget extends StatelessWidget {
  const ShowingDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(TranslationKeys.deleteAccount.tr),
      content: Text(TranslationKeys.deleteAccountMessage.tr),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(TranslationKeys.cancel.tr),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            // Implement your logout logic here
            UserCubit.get(context).deleteUserAccount();
          },
          child: Text(TranslationKeys.confirm.tr),
        ),
      ],
    );
  }
}
