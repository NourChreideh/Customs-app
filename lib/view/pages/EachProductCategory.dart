

import 'package:dmpcreative/network/Base/ApiEndPoints.dart';
import 'package:dmpcreative/network/Base/NetworkApiService.dart';
import 'package:dmpcreative/network/Models/CategoriesModel.dart';
import 'package:dmpcreative/network/Models/HistoryModel.dart';
import 'package:dmpcreative/network/Models/productCategoryModel.dart';
import 'package:dmpcreative/utility/globalColors.dart';
import 'package:dmpcreative/view/pages/Calculations.dart';
import 'package:dmpcreative/view/widgets/mainline.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
class ProductCategory extends StatefulWidget {
  CategoriesModel model;
   ProductCategory({super.key,required this.model});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
   NetworkApiService productdata = NetworkApiService();

  late Future<List<ProductCtegoryModel>> productcategory;
   void initState() {
    super.initState();
    productcategory = productdata.getproductcategory(ApiEndPoints().productbycategories,widget.model.id.toString());
   
  }
 HistoryModel history=HistoryModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const MainLine(),
      Column(children: [
        const SizedBox(
          height: 75,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 130,
              ),
              Text(
                widget.model.name,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
       
                     Expanded(
                       child: FutureBuilder(
                              future: productcategory,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return ProductCategoryCard(
                                        snapshot.data![index],context,history
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
                     
      
      ])
    ]));
  }

}

Widget ProductCategoryCard(ProductCtegoryModel category,BuildContext context,HistoryModel history) {
  return InkWell(
    onTap: (){
           Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               Calculations(model: category,source: 0,history: history,)),
                                    );
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: Container(
         
        decoration: BoxDecoration(color: GlobalColors.mainColor,
        borderRadius: BorderRadius.circular(12)),
      child:  Column(
        children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network("https://customes.operationteam.tech/"+category.image.toString(),fit:BoxFit.fill,)),
              ),
              SizedBox(height: 10,),
          
          Text(
          category.description.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
          SizedBox(height: 20,),
          
          Text(
          category.note.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
         SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
               height: MediaQuery.of(context).size.height * 0.05,
              
              
              decoration: BoxDecoration(color: GlobalColors.SelectedColor,
              borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0), 
          topRight: Radius.circular(15.0), 
        
        ),

              
              ),
child: Center(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(category.name.toString(),
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w700),),
  ),
),              ),
          ],
        )
        ]
      
      ),
         ),
    ) );
}
