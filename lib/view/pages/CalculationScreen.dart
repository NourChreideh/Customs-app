import 'package:dmpcreative/main.dart';
import 'package:dmpcreative/network/Base/ApiEndPoints.dart';
import 'package:dmpcreative/network/Base/NetworkApiService.dart';
import 'package:dmpcreative/network/Models/HistoryModel.dart';
import 'package:dmpcreative/network/Models/ItemsModel.dart';
import 'package:dmpcreative/network/Models/ProductsModel.dart';
import 'package:dmpcreative/network/Models/Request/Status.dart';
import 'package:dmpcreative/network/Models/productCategoryModel.dart';
import 'package:dmpcreative/view/pages/homepage.dart';

import 'package:dmpcreative/view/widgets/button.dart';
import 'package:dmpcreative/view/widgets/calculationWidget.dart';
import 'package:dmpcreative/view_model/AuthVM.dart';
import 'package:flutter/material.dart';

import '../../network/Models/Request/ApiResponse.dart';
import '../../utility/globalColors.dart';
import '../widgets/loadingdialog.dart';

class CalculationsView extends StatefulWidget {
  ProductCtegoryModel model;
  HistoryModel history;
  int source;
  CalculationsView(
      {super.key,
      required this.model,
      required this.source,
      required this.history});

  @override
  State<CalculationsView> createState() => _CalculationsViewState();
}

class _CalculationsViewState extends State<CalculationsView> {
  late Future<ProductModel> product;
  String calculate = "احسب الان";
  double calculateTaxSum(List<Tax> taxes) {
    double sum = 0.0;
    for (var tax in taxes) {
      sum += double.parse(tax.rate.toString());
    }
    return sum * 0.01;
  }

  NetworkApiService productdata = NetworkApiService();
  final AuthVm viewmodel1 = AuthVm();
  final amount = TextEditingController();
  void initState() {
    amount.text = widget.source == 0 ? "" : widget.history.amount.toString();


    product = productdata.getproductinfo(
        ApiEndPoints().getproductbyid,
        widget.source == 0
            ? widget.model.id.toString()
            : widget.history.productId.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<ProductModel>(
        future: product,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Container();
          }

          if (snapshot.hasData) {
            ProductModel product = snapshot.data!;

            double taxSum = calculateTaxSum(product.taxes!);
            double totalAmount = widget.source == 0
                ? 0.0
                : double.parse(widget.history.amount.toString()) * taxSum;

            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.073,
                  decoration: BoxDecoration(
                      color: GlobalColors.mainColor,
                      borderRadius: BorderRadius.circular(11)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        const Text(
                          "كود HS",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          product.hsCode.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.073,
                  decoration: BoxDecoration(
                      color: GlobalColors.mainColor,
                      borderRadius: BorderRadius.circular(11)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        const Text(
                          "العنوان",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          product.name.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.073,
                  decoration: BoxDecoration(
                      color: GlobalColors.mainColor,
                      borderRadius: BorderRadius.circular(11)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        const Text(
                          "الوصف",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          product.description.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "المبلغ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: GlobalColors.mainColor,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: amount,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 18,
                      );
                    },
                    itemCount: product.taxes!.length,
                    itemBuilder: (context, index) {
                      return calculationcard1(product.taxes![index], context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Button(
                    text: widget.source == 1 ? calculate : "اضافة",
                    func: widget.source == 0
                        ? () async {
                            showDialog(
                                context: context,
                                builder: (context) => LoadingDialog());

                            ApiResponse? r = await viewmodel1.addhistory(
                                product.id.toString(),
                                amount.text,
                                preferencesInstance.getId());
                            print('${ApiResponse}');
                            Navigator.of(context).pop();

                            if (r.status == null) {
                              final snackBar = SnackBar(
                                content: Text('An Error Occur: ${r.message}'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }

                            if (r.status == Status.ERROR) {
                              // show error
                              final snackBar = SnackBar(
                                content: Text('Failed: ${r.message}'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }

                            if (r.status == Status.COMPLETED) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ));
                            }

                            print(r);
                          }
                        : () {
                            setState(() {
                              calculate = totalAmount.toString();
                              
                            });
                          },
                    textColor: Colors.black,
                    buttonColor: GlobalColors.SelectedColor,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.08,
                    borderColor: GlobalColors.SelectedColor,
                    fontSize: 20),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }

          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: GlobalColors.mainColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
