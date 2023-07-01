import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import '../configs/extensions.dart';

class StarRating extends StatelessWidget {
  final double rate;
  final int starCount;
  final bool showValue;
  final Color color;
  const StarRating(
      {super.key,
      this.rate = 4.5,
      this.starCount = 1,
      this.showValue = false,
      this.color = AppColors.black});

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: rate,
      onValueChanged: (v) {
        //
        // setState(() {
        //   value = v;
        // });
      },
      starBuilder: (index, color) => Icon(
        Icons.star,
        color: color,
        size: 20,
      ),
      starCount: starCount,
      valueLabelColor: Colors.transparent,
      valueLabelTextStyle: const TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 12.0),
      valueLabelRadius: 0,
      maxValue: 5,
      starSpacing: 2,
      maxValueVisibility: false,
      valueLabelVisibility: showValue,
      animationDuration: const Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
      valueLabelMargin: const EdgeInsets.only(right: 0),
      starOffColor: AppColors.grey,
      starColor: color,
    );
  }
}
