import 'package:softbenz_infosys/configs/extensions.dart';
import 'package:softbenz_infosys/view/detaiil_page/pages/detail_page.dart';
import 'package:softbenz_infosys/view/detaiil_page/widgets/price.dart';
import 'package:softbenz_infosys/view/detaiil_page/widgets/widgets.dart';

class ProductIntro extends StatefulWidget {
  const ProductIntro({super.key});

  @override
  State<ProductIntro> createState() => _ProductIntroState();
}

class _ProductIntroState extends State<ProductIntro> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                apiController.data.value.name ?? '',
                style: context.text.titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavourite = !isFavourite;
                  });
                },
                child: Icon(
                  isFavourite == true
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: AppColors.black,
                ),
              )
            ],
          ),
          Text(
            'Color, RAM, ROM',
            style:
                context.text.titleSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Pricing(),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.greyLight,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  '7686 sold',
                  style: context.text.bodySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const StarRating(
                rate: 2.5,
                showValue: true,
                starCount: 1,
              ),
              const Text('  (5,789) reviews')
            ],
          ),
          const DividerWid()
        ],
      ),
    );
  }
}
