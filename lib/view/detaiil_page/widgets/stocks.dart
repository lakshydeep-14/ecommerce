import 'package:softbenz_infosys/configs/extensions.dart';

import '../pages/detail_page.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Obx(() => tileBox(Icons.store,
            '${apiController.result.value.variantDetail!.stock} in Stocks',
            extra: '')),
        Container(
          height: 100,
          width: 1,
          color: AppColors.grey.shade300,
        ),
        tileBox(Icons.delivery_dining_outlined, '7 Days Delivery',
            extra: 'COD Available'),
        Container(
          height: 100,
          width: 1,
          color: AppColors.grey.shade300,
        ),
        tileBox(Icons.sell,
            apiController.data.value.vendorDetail!.companyName ?? '',
            extra: apiController.data.value.vendorDetail!.companyAddress),
      ],
    );
  }

  Widget tileBox(IconData icon, String label, {String? extra}) {
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
            style: context.text.titleMedium,
          ),
          if (extra != null)
            Text(
              extra,
              textAlign: TextAlign.center,
              style: context.text.titleSmall!.copyWith(color: AppColors.grey),
            ),
        ],
      ),
    );
  }
}
