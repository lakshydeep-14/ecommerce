import '../../../configs/extensions.dart';

class DividerWid extends StatelessWidget {
  final double height;
  const DividerWid({super.key, this.height = 6});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      color: AppColors.grey.withOpacity(0.15),
    );
  }
}
