import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:softbenz_infosys/configs/extensions.dart';
import 'package:softbenz_infosys/view/detaiil_page/widgets/widgets.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: context.text.bodyLarge!
              .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const HtmlWidget(
            '<h3><strong>Realme C30 Specification:</strong><span style=\"color: rgb(241, 241, 241);\"><span style=\"background-color: rgb(241, 241, 241);\"><strong>​</strong></span></span></h3><p><strong>Android</strong>: 11 with realme UI Go Edition</p><p><strong>Screen</strong>: 6.5 Inch (720x1600) HD+ IPS LCD, minidrop notch&nbsp;</p><p>8.5mm Ultra-Slim Vertical Stripe Design&nbsp;</p><p><strong>Chipset</strong>: Unisoc T612 (12nm)</p><p><strong>CPU</strong>: Octa-core (2x1.8 GHz Cortex-A75 &amp; 6x1.8 GHz Cortex-A55)</p><p><strong>GPU</strong>: ARM Mali-G57</p><p><strong>RAM</strong>: 2GB + (LPDDR 4X)</p><p><strong>Storage</strong>: 32GB (UFS 2.2), Expandable up to 1TB</p><p><strong>Camera</strong>: Rear: 8 MP(f/2.0); Front Camera: 5 MP (f/2.2)</p><p><strong>Support</strong>: 4G</p><p><strong>Battery</strong>: 5000 mAh Big Battery</p><p><strong>&nbsp;Sim</strong>: Dual Sim Support<br></p>'),
        const DividerWid()
      ],
    );
  }
}
