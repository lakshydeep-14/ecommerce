import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:softbenz_infosys/configs/extensions.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIdx = index;
                });
              },
              viewportFraction: 1,
              height: context.deviceHeight * 0.5),
          items: [
            //apiController.data.value.image![0].path.toString(),
            'https://assets.mspimages.in/gear/wp-content/uploads/2022/06/Realme-C30-Blue-MySmartPrice.jpeg',
            'https://meladigitalbazaar.s3.amazonaws.com/product_images/16659007108383741.jpg',
            'https://image01.realme.net/general/20220922/1663816701222.jpg.webp',
            'https://os-wordpress-media.s3.ap-south-1.amazonaws.com/blog/wp-content/uploads/2022/07/02001053/Realme-C30-Product-Image-12-1024x576.jpg',
            'https://unboxdiaries.b-cdn.net/wp-content/uploads/2022/09/DSC07656-scaled.jpg'
          ].map((i) {
            return Container(
              width: context.deviceWidth,
              //margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  //image: DecorationImage(image: NetworkImage(i)),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber),
              child: CachedNetworkImage(
                imageUrl: i,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) => const Icon(Icons.photo_album),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 5,
          right: 0,
          left: 0,
          child: DotsIndicator(
            dotsCount: 5,
            position: currentIdx,
            decorator: DotsDecorator(
              color: Colors.grey.shade500,
              activeColor: Colors.black,
              size: const Size.square(9.0),
              activeSize: const Size(30.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        )
      ],
    );
  }
}
