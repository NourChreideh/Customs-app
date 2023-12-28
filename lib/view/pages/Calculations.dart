import 'package:dmpcreative/network/Models/HistoryModel.dart';
import 'package:dmpcreative/network/Models/productCategoryModel.dart';
import 'package:dmpcreative/view/pages/CalculationScreen.dart';
import 'package:dmpcreative/view/pages/InformationScreen.dart';
import 'package:dmpcreative/view/pages/homepage.dart';

import 'package:dmpcreative/view/widgets/mainline.dart';
import 'package:flutter/material.dart';

import '../../utility/globalColors.dart';

class Calculations extends StatefulWidget {
  ProductCtegoryModel model;
  HistoryModel history;
  int source;
   Calculations({super.key,required this.model,required this.source,required this.history});

  @override
  State<Calculations> createState() => _CalculationsState();
}

class _CalculationsState extends State<Calculations>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
              SizedBox(
                height: 40,
                width: 200,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.white,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  labelColor: GlobalColors.SelectedColor,
                  indicatorColor: GlobalColors.SelectedColor,
                  controller: _tabController,
                  tabs: [
                    Tab(text: "الحسابات"),
                    Tab(text: "المعلومات"),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              CalculationsView(model: widget.model,source: widget.source,history: widget.history,),
              InformationView(model: widget.model,),
            ],
          ))
        ],
      ),
    ]));
  }
}
