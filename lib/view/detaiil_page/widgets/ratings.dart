import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:softbenz_infosys/view/detaiil_page/widgets/widgets.dart';

import '../../../configs/extensions.dart';

class RatingAndReview extends StatefulWidget {
  const RatingAndReview({super.key});

  @override
  State<RatingAndReview> createState() => _RatingAndReviewState();
}

class _RatingAndReviewState extends State<RatingAndReview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ratings & Reviews',
          style: context.text.bodyLarge!
              .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        ratings(),
        const SizedBox(
          height: 20,
        ),
        reviews()
      ],
    );
  }

  Widget ratings() {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Very Good'),
                StarRating(
                  showValue: false,
                  rate: 4.5,
                  color: Colors.green.shade900,
                  starCount: 5,
                ),
                const Text(
                  '4,599 ratings and 2345 reviews',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Container(
            width: 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            color: AppColors.grey,
          ),
          Expanded(
              child: Column(
            children: [
              scaleBar(5, 1.0, 2987),
              scaleBar(4, 0.75, 2097),
              scaleBar(3, 0.5, 1308),
              scaleBar(2, 0.3, 687),
              scaleBar(1, 0.14, 287),
            ],
          )),
        ],
      ),
    );
  }

  Widget scaleBar(int star, double percent, int count) {
    return Row(
      children: [
        Text('$star  '),
        const StarRating(),
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 7.0,
            width: 80,
            percent: percent,
            trailing: Text(count.toString()),
            barRadius: const Radius.circular(8),
            backgroundColor: Colors.grey,
            progressColor: Colors.green.shade900,
          ),
        ),
      ],
    );
  }

  Widget reviews() {
    return Column(
      children: [
        ...List.generate(
            5,
            (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        StarRating(
                          color: Colors.green.shade900,
                          starCount: 5,
                          rate: index % 2 == 0
                              ? 5.0
                              : index % 2 == 1
                                  ? 3.5
                                  : 2.0,
                        ),
                        Text(index % 2 == 0
                            ? '    Brilliant'
                            : index % 2 == 1
                                ? '    Perfect Product!'
                                : '  Average')
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppConstants.dummyText,
                      maxLines: index % 2 == 0
                          ? 2
                          : index % 2 == 1
                              ? 3
                              : 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Arsh Goyal, Kathmandu',
                      style: context.text.bodyMedium!
                          .copyWith(color: AppColors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              '100  ',
                              style: context.text.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.grey),
                            ),
                            Icon(
                              Icons.thumb_up_alt_outlined,
                              color: AppColors.black.withOpacity(0.7),
                            )
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            Text(
                              '10  ',
                              style: context.text.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.grey),
                            ),
                            Icon(
                              Icons.thumb_down_alt_outlined,
                              color: AppColors.black.withOpacity(0.7),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 15,
                        ),
                        Text(
                          '   Verified Purchase',
                          style: context.text.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    const DividerWid(
                      height: 2,
                    )
                  ],
                ))
      ],
    );
  }
}
