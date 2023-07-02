import 'package:softbenz_infosys/configs/extensions.dart';
import 'package:softbenz_infosys/view/detaiil_page/pages/detail_page.dart';
import 'package:softbenz_infosys/view/detaiil_page/widgets/widgets.dart';

class DisplayVariant extends StatefulWidget {
  const DisplayVariant({super.key});

  @override
  State<DisplayVariant> createState() => _DisplayVariantState();
}

class _DisplayVariantState extends State<DisplayVariant> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Variants',
          style: context.text.bodyLarge!
              .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        colorVar(),
        const Divider(
          thickness: 0.2,
        ),
        ramVar(),
        const Divider(
          thickness: 0.2,
        ),
        romVar(),
        const DividerWid()
      ],
    );
  }

  Widget romVar() {
    return Row(
      children: [
        const Icon(
          Icons.storage_outlined,
          color: AppColors.black,
        ),
        const SizedBox(
          width: 5,
        ),
        const Text('ROM: '),
        ...apiController.getROMvariants().map((e) => GestureDetector(
              onTap: () {
                apiController.selectedVariants.value.rom = e;
                apiController.selectedroms.value = e;
                apiController.getFinalProduct();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: apiController.selectedroms.value == e
                        ? AppColors.cream
                        : AppColors.white,
                    border: Border.all(color: AppColors.black)),
                child: Text(e),
              ),
            ))
      ],
    );
  }

  Widget ramVar() {
    return Obx(
      () => Row(
        children: [
          const Icon(
            Icons.storage_outlined,
            color: AppColors.black,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text('RAM: '),
          ...apiController.getRAMvariants().map((e) => GestureDetector(
                onTap: () {
                  apiController.selectedVariants.value.ram = e;
                  apiController.selectedrams.value = e;

                  apiController.getFinalProduct();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: e == apiController.selectedrams.value.toString()
                          ? AppColors.cream
                          : AppColors.white,
                      border: Border.all(color: AppColors.black)),
                  child: Text(e),
                ),
              ))
        ],
      ),
    );
  }

  Widget colorVar() {
    return Obx(
      () => Row(
        children: [
          const Icon(
            Icons.color_lens_outlined,
            color: AppColors.black,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text('Color: '),
          ...apiController.getColorVariants().map(
                (e) => GestureDetector(
                  onTap: () {
                    apiController.selectedVariants.value.color = e;
                    apiController.selectedcolor.value = e;

                    apiController.getFinalProduct();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: apiController.selectedcolor.value == e
                            ? AppColors.cream
                            : AppColors.white,
                        border: Border.all(color: AppColors.black)),
                    child: Text(e),
                  ),
                ),
              )
        ],
      ),
    );
  }
}
