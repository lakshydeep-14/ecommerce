import 'package:softbenz_infosys/configs/extensions.dart';
import 'package:softbenz_infosys/controller/api_controller.dart';
import 'package:softbenz_infosys/view/detaiil_page/widgets/widgets.dart';

ApiController apiController = Get.put(ApiController());

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (apiController.resState.value) {
          case ResponseState.loading:
            return const Loading();
          case ResponseState.error:
            return const Center(
              child: Text('Error'),
            );
          default:
            return Scaffold(
                bottomNavigationBar: const BottomBar(),
                appBar: CustomAppBar(),
                body: ListView(
                  children: [
                    const ImageCarousel(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20)
                          .copyWith(bottom: 50),
                      child: const Column(
                        children: [
                          ProductIntro(),
                          DisplayVariant(),
                          Stocks(),
                          DividerWid(),
                          Description(),
                          RatingAndReview(),
                        ],
                      ),
                    )
                  ],
                ));
        }
      }),
    );
  }
}
