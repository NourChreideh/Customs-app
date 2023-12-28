import 'package:dmpcreative/network/Base/ApiEndPoints.dart';
import 'package:dmpcreative/network/Base/NetworkApiService.dart';
import 'package:dmpcreative/network/Models/InformationModel.dart';
import 'package:dmpcreative/network/Models/productCategoryModel.dart';
import 'package:dmpcreative/view/widgets/ContactinfoBottomsheet.dart';
import 'package:dmpcreative/view/widgets/infoBottomsheet.dart';
import 'package:flutter/material.dart';

import '../../utility/globalColors.dart';

class InformationView extends StatefulWidget {
    ProductCtegoryModel model;
   InformationView({super.key,required this.model});

  @override
  State<InformationView> createState() => _InformationViewState();
}

class _InformationViewState extends State<InformationView> {
  NetworkApiService infodata = NetworkApiService();
  late Future<List<InformationModel>> infolist;
  @override
  void initState() {
    super.initState();
    infolist = infodata.getallinformation(ApiEndPoints().getallinformation,widget.model.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: FutureBuilder(
        future: infolist,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return infoCard(
                  context,
                  snapshot.data![index],
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
            child: CircularProgressIndicator(color: GlobalColors.mainColor),
          );
        },
      ),

     
    );
  }
}

Widget infoCard(BuildContext context, InformationModel info) {
  return Column(children: [
    Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: InkWell(
            onTap: () {
                   infoBottomsheet(
               context,info

                    );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: GlobalColors.mainColor,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      info.name,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )))
  ]);
}
