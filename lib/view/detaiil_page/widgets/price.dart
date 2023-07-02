import 'package:flutter/material.dart';
import 'package:softbenz_infosys/configs/extensions.dart';

import '../pages/detail_page.dart';

class Pricing extends StatefulWidget {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiController.selectedVariants.value.color =
        apiController.getColorVariants().first;
    apiController.selectedVariants.value.ram =
        apiController.getRAMvariants().first;
    apiController.selectedrams.value = apiController.getRAMvariants().first;
    apiController.selectedcolor.value = apiController.getColorVariants().first;
    apiController.selectedroms.value = apiController.getROMvariants().first;
    apiController.selectedVariants.value.rom =
        apiController.getROMvariants().first;
    apiController.getFinalProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '10% off',
          style: context.text.titleMedium!.copyWith(
              color: Colors.green.shade900, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8.0).copyWith(right: 15),
          child: Obx(() => Text(
                'Rs. ${apiController.result.value.variantDetail!.strikePrice}',
                style: context.text.titleMedium!.copyWith(
                    color: AppColors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold),
              )),
        ),
        Obx(
          () => Text(
            'Rs. ${apiController.result.value.variantDetail!.price}',
            style: context.text.titleMedium!.copyWith(
                decorationStyle: TextDecorationStyle.dashed,
                color: Color(0xffd34574),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
