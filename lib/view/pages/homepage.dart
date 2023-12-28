import 'package:dmpcreative/generated/l10n.dart';
import 'package:dmpcreative/main.dart';
import 'package:dmpcreative/network/Base/ApiEndPoints.dart';
import 'package:dmpcreative/network/Base/NetworkApiService.dart';
import 'package:dmpcreative/network/Models/CategoriesModel.dart';
import 'package:dmpcreative/view/pages/EachProductCategory.dart';
import 'package:dmpcreative/view/pages/SearchScreen.dart';
import 'package:dmpcreative/view/pages/Settings.dart';
import 'package:dmpcreative/view/widgets/bottomnavBar.dart';
import 'package:dmpcreative/view/widgets/floatingbutton.dart';
import 'package:dmpcreative/view/widgets/mainline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utility/globalColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  NetworkApiService categorydata = NetworkApiService();
  late Future<List<CategoriesModel>> categories;
  @override
  void initState() {
    super.initState();
    categories = categorydata.getallcategories(ApiEndPoints().getallcategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            const MainLine(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/icons/notificationIcon.svg"),
                        Column(
                          children: [
                            Text(
                              S.of(context).welcome,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                             Text(
                              preferencesInstance.getname()
                            ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: (){
                                Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Settings()));
                       
                          },
                          
                          child:CircleAvatar(
                            backgroundColor: GlobalColors.mainColor,
                            child: Icon(Icons.person,color: GlobalColors.SelectedColor,),
                          )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Image.asset(
                                  "assets/images/sliderpic.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: 180,
                                right: 220,
                                child: InkWell(
                                  onTap: () {
                                 
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 116,
                                    decoration: BoxDecoration(
                                        color: GlobalColors.mainColor,
                                        borderRadius:
                                            BorderRadius.circular(36)),
                                    child: const Center(
                                        child: Text(
                                      "ادخل",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                      color: GlobalColors.mainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()),
                          );
                        },
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            "assets/icons/search-normal.png",
                          ),
                          border: InputBorder.none,
                          hintStyle: const TextStyle(color: Color(0xff949494)),
                          hintText: 'البحث...',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.black,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: GlobalColors.mainColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 5,
                          width: 75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 30),
                          child: Row(
                            children: [
                              Text(
                                "الفئات",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Spacer(),
                              Text(
                                "مشاهدة الكل",
                                style: TextStyle(
                                    color: Color(0xff02C27A),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 240,
                          width: MediaQuery.of(context).size.width,
                          child: FutureBuilder(
                            future: categories,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return categorieslistTile(
                                      snapshot.data![index],context
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
                      ]),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
            color: GlobalColors.mainColor,
            child: CustomNavBar(currentIndex: _selectedIndex)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloattingButton());
  }
}

Widget categorieslistTile(CategoriesModel category,BuildContext context) {
  return InkWell(
    onTap: (){
           Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductCategory(model:category ,)),
                          );
    },
    child: ListTile(
      title: Text(
        category.name,
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
      ),
      leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Image.network("https://customes.operationteam.tech/"+category.image.toString())),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 24,
      ),
    ),
  );
}
