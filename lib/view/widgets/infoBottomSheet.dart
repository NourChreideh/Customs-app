

import 'package:dmpcreative/network/Models/InformationModel.dart';
import 'package:flutter/material.dart';

import '../../utility/globalColors.dart';

void infoBottomsheet(BuildContext context,InformationModel model) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    isScrollControlled: true,
    context: context,
    backgroundColor: GlobalColors.mainColor,
    builder: (BuildContext context) {
      return infoBottomSheet(model: model,);
    },
  );
}

class infoBottomSheet extends StatefulWidget {
   InformationModel model;
   infoBottomSheet({super.key,required this.model}) {
     
    
   }
 
  @override
  State<infoBottomSheet> createState() => _infoBottomSheet();
}

class _infoBottomSheet extends State<infoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.2,
        minChildSize: 0.1,
        maxChildSize: 0.2,
        expand: false,
        builder: (context, scrollController) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Container(
                              height: 4,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "التفاصيل ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: GlobalColors.SelectedColor),
                            ),
                          ],
                        ),
                       
                        SizedBox(height: 10,),
                             Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                               widget.model.description,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                                    SizedBox(height: 10,),
                                 Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            
                      ],
                    ),
                  ]))));
        });
  }
}
