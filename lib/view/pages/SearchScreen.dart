import 'package:dmpcreative/network/Models/ItemsModel.dart';
import 'package:dmpcreative/view/pages/homepage.dart';
import 'package:dmpcreative/view/widgets/mainline.dart';
import 'package:flutter/material.dart';

import '../../utility/globalColors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ItemModels> filteredCategories = [];
  void filterCategories(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCategories = [];
      } else {
        filteredCategories = categories
            .where((category) =>
                category.title!.contains(query) ||
                category.Imagepath!.contains(query))
            .toList();
      }
    });
  }

  List<ItemModels> categories = [
    ItemModels(
        title: "استيراد اللحوم",
        Imagepath: "assets/icons/Rack of Lamb.png",
        ontap: () {}),
    ItemModels(
        title: "استيراد سيارات",
        Imagepath: "assets/icons/Car.png",
        ontap: () {}),
    ItemModels(
        title: "استيراد اللحوم",
        Imagepath: "assets/icons/Rack of Lamb.png",
        ontap: () {}),
    ItemModels(
        title: "استيراد سيارات",
        Imagepath: "assets/icons/Car.png",
        ontap: () {}),
    ItemModels(
        title: "استيراد اللحوم",
        Imagepath: "assets/icons/Rack of Lamb.png",
        ontap: () {}),
    ItemModels(
        title: "استيراد سيارات",
        Imagepath: "assets/icons/Car.png",
        ontap: () {}),
    ItemModels(
        title: "استيراد خضار",
        Imagepath: "assets/icons/Carrot.png",
        ontap: () {})
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      MainLine(),
      Column(children: [
        const SizedBox(
          height: 75,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140,
              ),
              Text(
                "ابدأ البحث",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
           SizedBox(width: 17,),
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
                    style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    filterCategories(value);
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
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
            SizedBox(width: 5,),
             Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                
                color: GlobalColors.SelectedColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/icons/Qr Code.png"),
              ),
            ),

          ],
        ),
        Expanded(
            child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: filteredCategories.isEmpty
              ? ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 15);
                  },
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return categorieslistTile(categories[index], context);
                  },
                )
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 15);
                  },
                  itemCount: filteredCategories.length,
                  itemBuilder: (context, index) {
                    return categorieslistTile(
                        filteredCategories[index], context);
                  },
                ),
        ))
      ])
    ]));
  }
}

Widget categorieslistTile(ItemModels item, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.03,
    decoration: BoxDecoration(
        color: GlobalColors.mainColor, borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Image.asset(item.Imagepath.toString())),
        SizedBox(
          width: 20,
        ),
        Text(
          item.title.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ]),
    ),
  );
}
