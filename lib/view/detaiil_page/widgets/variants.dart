import 'package:softbenz_infosys/configs/extensions.dart';
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
        const Variants(variantTypes: VariantTypes.color),
        const Divider(
          thickness: 0.2,
        ),
        const Variants(variantTypes: VariantTypes.ram),
        const Divider(
          thickness: 0.2,
        ),
        const Variants(variantTypes: VariantTypes.rom),
        DividerWid()
      ],
    );
  }
}

enum VariantTypes { ram, rom, color }

class Variants extends StatefulWidget {
  final VariantTypes variantTypes;
  const Variants({super.key, required this.variantTypes});

  @override
  State<Variants> createState() => _VariantsState();
}

class _VariantsState extends State<Variants> {
  @override
  Widget build(BuildContext context) {
    return variant();
  }

  Widget variant() {
    if (widget.variantTypes == VariantTypes.color) {
      return variantTile(Icons.color_lens_outlined, 'Color', 'Blue');
    } else if (widget.variantTypes == VariantTypes.rom) {
      return variantTile(Icons.storage_outlined, 'RAM', '6 GB');
    } else {
      return variantTile(Icons.storage_outlined, 'ROM', '5 GB');
    }
  }

  Widget variantTile(IconData iconData, String label, String data) {
    return Row(
      children: [
        Icon(
          iconData,
          color: AppColors.black,
        ),
        const SizedBox(
          width: 5,
        ),
        Text('$label: '),
        Text(data),
      ],
    );
  }
}
