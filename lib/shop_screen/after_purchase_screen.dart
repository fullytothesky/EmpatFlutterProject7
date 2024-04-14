import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:sixth_state2_project/shop_state_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AfterPurchaseWidget extends StatefulWidget {
  const AfterPurchaseWidget({super.key});

  @override
  State<AfterPurchaseWidget> createState() => _AfterPurchaseWidgetState();
}

class _AfterPurchaseWidgetState extends State<AfterPurchaseWidget> {
  int carouselIndex = 0;

  List pesPatronList = [
    'https://img.tsn.ua/cached/787/tsn-671b840e81dae5015bc4c6345e63d1d0/thumbs/608xX/e2/ce/c755bd501c42746fbd07f058d4edcee2.jpeg',
    'https://gdb.currenttime.tv/07520000-0aff-0242-9259-08da3a2b2449_w1200_r1.jpg',
    'https://cdn.bitrix24.eu/b12843811/landing/a78/a785cda6e7585cdd86844c16ebf6e0bc/pes-patron43_1x.jpg',
    'https://i.stopcor.org/news/2023/11/20/patron.jpeg?size=2010x1130',
    'https://glavcom.ua/img/article/8619/9_main-v1658304996.jpg',
    'https://news.bigmir.net/i/68/53/80/0/6853800/image_main/1375367746946aa8aed5b354fd57162b-quality_75Xresize_crop_1Xallow_enlarge_0Xw_740Xh_400.jpg',
    'https://oppb.com.ua/wp-content/uploads/2022/05/patron2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Дякуємо за замовлення!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                      text:
                          "Менторам Емпату безкоштовно!\nОчікуйте кур'єра до офісу Empat.\nНомер замовлення:\n"),
                  TextSpan(
                    text:
                        "${Provider.of<ShopStateModel>(context, listen: false).getOrderID()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 35),
                  )
                ],
              ),
            ),
            Column(
              children: [
                CarouselSlider.builder(
                  itemCount: pesPatronList.length,
                  itemBuilder: (context, index, realIndex) {
                    final imgAddress = pesPatronList[index];
                    return buildImage(imgAddress, index);
                  },
                  options: CarouselOptions(
                    height: 500,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          carouselIndex = index;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                buildIndicator()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String imgUrl, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
        effect: const ExpandingDotsEffect(
            dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: carouselIndex,
        count: pesPatronList.length);
  }
}
