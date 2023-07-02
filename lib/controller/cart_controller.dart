import 'package:softbenz_infosys/configs/extensions.dart';

class Controller extends GetxController {
  RxBool isMessage = false.obs;
  RxInt itemCount = 0.obs;

  increaseCount() {
    itemCount.value = itemCount.value + 1;
  }
}
