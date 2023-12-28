import 'package:dmpcreative/main.dart';
import 'package:dmpcreative/network/Base/ApiEndPoints.dart';
import 'package:dmpcreative/network/Base/NetworkApiService.dart';
import 'package:dmpcreative/network/Models/CategoriesModel.dart';
import 'package:dmpcreative/network/Models/HistoryModel.dart';
import 'package:dmpcreative/network/Models/Request/ApiResponse.dart';
import 'package:dmpcreative/network/Models/Request/Status.dart';
import 'package:dmpcreative/network/Models/productCategoryModel.dart';
import 'package:dmpcreative/view/pages/Calculations.dart';
import 'package:dmpcreative/view/pages/homepage.dart';
import 'package:dmpcreative/view/widgets/bottomnavBar.dart';
import 'package:dmpcreative/view/widgets/floatingbutton.dart';
import 'package:dmpcreative/view/widgets/loadingdialog.dart';
import 'package:dmpcreative/view_model/AuthVM.dart';
import 'package:flutter/material.dart';

import '../../utility/globalColors.dart';
import '../widgets/mainline.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  NetworkApiService api = NetworkApiService();
  late Future<List<HistoryModel>> historylist;
  final AuthVm viewmodel1 = AuthVm();
  DateTime date = DateTime.now();

  late Future<List<CategoriesModel>> categories;
  @override
  void initState() {
    super.initState();
    historylist = api.getuserhistory(
        ApiEndPoints().getuserhistory, preferencesInstance.getId());
    categories = api.getallcategories(ApiEndPoints().getallcategories);
  }

  ProductCtegoryModel pro = ProductCtegoryModel();
  CategoriesModel? selectedcategory;

  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          const MainLine(),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        "السجلات",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "${date.year}-${date.month}-${date.day}",
                  style: TextStyle(color: Colors.white),
                ),
                Row(children: [
                  const SizedBox(
                    width: 17,
                  ),
                  InkWell(
                    onTap: () async {
                      DateTime? newdate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2200));
                      String Datecreate = newdate!.year.toString() +
                          "-" +
                          newdate!.month.toString() +
                          "-" +
                          newdate!.day.toString();

                      // if(newdate==null)
                      //       return;

                      showDialog(
                          context: context,
                          builder: (context) => LoadingDialog());

                      ApiResponse? r = await viewmodel1.historybydate(
                          preferencesInstance.getId(), Datecreate);
                      print('${ApiResponse}');
                      Navigator.of(context).pop();

                      if (r.status == null) {
                        print('===========${r.message}');
                        final snackBar = SnackBar(
                          content: Text('An Error Occur: ${r.message}'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      if (r.status == Status.COMPLETED) {
                        print("Completed...$r");
                        setState(() {
                          historylist = Future.value(r.data);
                        });

                        return;
                      }
                    },
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.37,
                        child: Container(
                          decoration: BoxDecoration(
                            color: GlobalColors.mainColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: const Row(
                            children: [
                              Text(
                                "التاريخ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_drop_down, color: Colors.white)
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.37,
                    child: Container(
                      decoration: BoxDecoration(
                        color: GlobalColors.mainColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: FutureBuilder<List<CategoriesModel>>(
                        future: categories,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: Text("                      "),
                            );
                          }
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(
                              child: Text('Error loading data'),
                            );
                          } else {
                            List<CategoriesModel> dropdownItems =
                                snapshot.data!;
                            return DropdownButton<CategoriesModel>(
                              value: selectedcategory,
                              dropdownColor: GlobalColors.mainColor,
                              hint: const Text(
                                'الفئات',
                                style: TextStyle(color: Colors.white),
                              ),
                              items: dropdownItems.map((CategoriesModel value) {
                                return DropdownMenuItem<CategoriesModel>(
                                  value: value,
                                  child: Text(value.name.toString()),
                                );
                              }).toList(),
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.white),
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                              underline: const SizedBox(),
                              isExpanded: true,
                              elevation: 5,
                              onChanged:
                                  (CategoriesModel? newSelectedValue) async {
                                showDialog(
                                    context: context,
                                    builder: (context) => LoadingDialog());

                                ApiResponse? r =
                                    await viewmodel1.historybycategoryid(
                                        preferencesInstance.getId(),
                                        newSelectedValue!.id.toString());
                                print('${ApiResponse}');
                                Navigator.of(context).pop();

                                if (r.status == null) {
                                  print('===========${r.message}');
                                  final snackBar = SnackBar(
                                    content:
                                        Text('An Error Occur: ${r.message}'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  return;
                                }

                                if (r.status == Status.COMPLETED) {
                                  print("Completed...$r");
                                  setState(() {
                                    historylist = Future.value(r.data);
                                  });

                                  return;
                                }
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: FutureBuilder(
                    future: historylist,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Recordscard(
                                snapshot.data![index], pro, context);
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
          ),
        ]),
        bottomNavigationBar: Container(
            color: Colors.black,
            child: CustomNavBar(currentIndex: _selectedIndex)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloattingButton());
  }
}

Widget Recordscard(
    HistoryModel model, ProductCtegoryModel pro, BuildContext context) {
  NetworkApiService api = NetworkApiService();
  return Dismissible(
    key: Key(model.id.toString()),
    onDismissed: (direction) async {
      Future<String> response =
          api.deleteissues(ApiEndPoints().deletehistory, model.id.toString());
      String responseString = await response;
      if (responseString == "User deleted successfully") {
        print("sucess");
      }
      {}
      return;
    },
    background: Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20.0),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    ),
    child: InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Calculations(
                    model: pro,
                    source: 1,
                    history: model,
                  )),
        );
      },
      child: Container(
          decoration: BoxDecoration(
              color: GlobalColors.mainColor,
              borderRadius: BorderRadius.circular(11)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.asset("assets/images/money-send.png"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(model.productName.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Text(model.dateCreate.toString(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        model.amount.toString(),
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    ),
  );
}
