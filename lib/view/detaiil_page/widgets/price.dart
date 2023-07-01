import 'package:flutter/material.dart';
import 'package:softbenz_infosys/configs/extensions.dart';

class Pricing extends StatefulWidget {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '45999',
            style: context.text.titleMedium!.copyWith(
                color: AppColors.grey,
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          'Rs. 35999',
          style: context.text.titleMedium!.copyWith(
              decorationStyle: TextDecorationStyle.dashed,
              color: Color(0xffd34574),
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
