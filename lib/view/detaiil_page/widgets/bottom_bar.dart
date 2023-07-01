import 'package:softbenz_infosys/configs/extensions.dart';
import 'package:softbenz_infosys/controller/controller.dart';

import '../../../controller/send_notification.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 50,
        child: controller.isMessage.value == true
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          SendNotification.sendMessageNotification(
                            'Thank you for Contacting Us',
                          );
                          controller.isMessage.value = false;
                        },
                        child: const Icon(
                          Icons.send,
                          color: Colors.red,
                        )),
                    hintText: 'Thank You For Contacting Us.',
                    contentPadding: const EdgeInsets.symmetric(vertical: 5)
                        .copyWith(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(width: 1.5, color: AppColors.black),
                    ),
                  ),
                ),
              )
            : Row(children: [messsageToSeller(), addToCartButton()]),
      ),
    );
  }

  Widget messsageToSeller() {
    return Expanded(
        child: GestureDetector(
            onTap: () async {
              controller.isMessage.value = true;
            },
            child: Container(
              color: AppColors.greyLight,
              child: Center(
                child: Text(
                  'Message',
                  style: context.text.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            )));
  }

  Widget addToCartButton() {
    return Expanded(
        child: GestureDetector(
            onTap: () async {
              controller.increaseCount();
              SnackBarShow().showSnack(
                "Item Added",
                message: 'Please check your cart to buy.',
              );
            },
            child: Container(
              color: const Color(0xffddbea0),
              child: Center(
                child: Text(
                  'Add To Cart',
                  style: context.text.bodyLarge!.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.bold),
                ),
              ),
            )));
  }
}
