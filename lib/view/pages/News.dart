import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dmpcreative/network/Base/ApiEndPoints.dart';
import 'package:dmpcreative/network/Base/NetworkApiService.dart';
import 'package:dmpcreative/network/Models/NewsBannerModel.dart';
import 'package:dmpcreative/network/Models/NewsModel.dart';
import 'package:dmpcreative/view/pages/NewsDetail.dart';

import 'package:dmpcreative/view/widgets/bottomnavBar.dart';
import 'package:dmpcreative/view/widgets/floatingbutton.dart';
import 'package:dmpcreative/view/widgets/mainline.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utility/globalColors.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  int activeIndex = 0;
  final controller = CarouselController();
    NetworkApiService api = NetworkApiService();
  late Future<List<NewsModel>> news;
  late Future<List<NewsBannerModel>> banners;


    @override
  void initState() {
    super.initState();
    news = api.getallnews(ApiEndPoints().getallnews);
    banners=api.getnewsbanner(ApiEndPoints().getnewsbanner);
  }


  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        MainLine(),
        Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                  ),
                  Text(
                    "الاخبار",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Spacer(),
               
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder(
  future: banners,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData) {
        List<NewsBannerModel> bannerList = snapshot.data as List<NewsBannerModel>;

        return CarouselSlider.builder(
          carouselController: controller,
          itemCount: bannerList.length,
          itemBuilder: (context, index, realIndex) {
            final banner = bannerList[index];
            return buildImage(banner.image.toString(), index);
          },
          options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.25,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(seconds: 5),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index))
        );
      } else if (snapshot.hasError) {
        // Handle error
        return Text("Error loading banners");
      }
    }

    // Loading state
    return CircularProgressIndicator();
  },
),

       
            SizedBox(height: 12),
            buildIndicator(),
            SizedBox(height: 10,),
             Expanded(
               child: FutureBuilder(
                 future: news,
                 builder: (context, snapshot) {
                  
                   if (snapshot.hasData) {
                     return ListView.separated(
                  
                       scrollDirection: Axis.vertical,
                       itemBuilder: (context, index) {
                          NewsModel model= snapshot.data![index];
                         return Padding(
                                     padding: const EdgeInsets.only(left: 15, right: 15),
                                     child: InkWell(
                                      onTap: (){
                                       Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsDetail(news: model,)),
                    );
                                      },
                                       child: Container(
                                                      constraints: BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.of(context).size.width * 0.95,
                                                          maxHeight: 90),
                                                      padding: const EdgeInsets.all(8.0),
                                                      decoration: BoxDecoration(
                                                        color: GlobalColors.mainColor,
                                                        borderRadius: BorderRadius.circular(11),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                         model.name.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                       ),
                                     ),
                                   );
                       },
                       separatorBuilder: (context, index) {
                         return const SizedBox(
                           height: 10,
                         );
                       },
                       itemCount: snapshot.data!.length,
                     );
                   } else if (snapshot.hasError) {
                     print("++++++++++++${snapshot.error}");
                     return const Center(
                       child: Text("Somethings went wrong"),
                     );
                   }
                   return Center(
                     child: CircularProgressIndicator(
                         color: GlobalColors.mainColor),
                   );
                 },
               ),
             ),
          
        
          ],
        ),
      ]),
      bottomNavigationBar: Container(
          color: Colors.black,
          child: CustomNavBar(currentIndex: _selectedIndex)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloattingButton()
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(
            dotWidth: 20,
            dotHeight: 4,
            activeDotColor: GlobalColors.SelectedColor),
        activeIndex: activeIndex,
        count: 3,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) =>
    Container(child: Image.network(urlImage, fit: BoxFit.fill));
