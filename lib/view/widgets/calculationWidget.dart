import 'package:dmpcreative/network/Models/ItemsModel.dart';
import 'package:dmpcreative/network/Models/ProductsModel.dart';
import 'package:flutter/material.dart';

import '../../utility/globalColors.dart';

Widget calculationcard(ItemModels item, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 10),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.073,
      decoration: BoxDecoration(
          color: GlobalColors.mainColor,
          borderRadius: BorderRadius.circular(11)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            Text(
              item.title.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Spacer(),
            Text(
              item.title1.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );
}

Widget calculationcard1(Tax item, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.29,
    decoration: BoxDecoration(
        color: GlobalColors.mainColor, borderRadius: BorderRadius.circular(11)),
    child: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            item.name.toString(),
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            item.rate.toString(),
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        )
      ],
    ),
  );
}
