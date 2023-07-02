import '../../../configs/extensions.dart';
import '../../../controller/cart_controller.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({
    super.key,
    this.height = 50,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 60,
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                      color: AppColors.black,
                    ),
                  ),
                  if (controller.itemCount.value != 0)
                    Positioned(
                      top: 10,
                      right: 6,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red.shade900,
                        child: Center(
                            child: Text(
                          controller.itemCount.value.toString(),
                          style: context.text.bodySmall!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
