import 'package:softbenz_infosys/configs/extensions.dart';

class SnackBarShow {
  showSnack(String title, {String? message}) {
    return Get.showSnackbar(GetSnackBar(
      snackPosition: SnackPosition.TOP,
      dismissDirection: DismissDirection.up,
      duration: const Duration(seconds: 1),
      title: title,
      message: message ?? '',
    ));
  }
}
