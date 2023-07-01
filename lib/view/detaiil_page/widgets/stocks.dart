import 'package:flutter/material.dart';
import 'package:softbenz_infosys/configs/extensions.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        tileBox(Icons.store, '100 in Stocks'),
        Container(
          height: 60,
          width: 1,
          color: AppColors.grey.shade300,
        ),
        tileBox(Icons.delivery_dining_outlined, '7 Days Delivery'),
        Container(
          height: 60,
          width: 1,
          color: AppColors.grey.shade300,
        ),
        tileBox(Icons.sell, 'XYZ Store'),
      ],
    );
  }

  Widget tileBox(IconData icon, String label) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.black,
            size: 40,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
