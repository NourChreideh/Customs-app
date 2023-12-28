
import 'package:dmpcreative/network/Models/ContactModel.dart';
import 'package:flutter/material.dart';

import '../../utility/globalColors.dart';

void ContactInfoBottomsheet(BuildContext context,ContactModel model) {
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
      return ContactinfoBottomsheet(model: model,);
    },
  );
}

class ContactinfoBottomsheet extends StatefulWidget {
   ContactModel model;
   ContactinfoBottomsheet({super.key,required this.model}) {
     
    
   }
 
  @override
  State<ContactinfoBottomsheet> createState() => _infoBottomSheet();
}

class _infoBottomSheet extends State<ContactinfoBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.1,
        maxChildSize: 0.3,
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
                              "البريد الالكتروني ",
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
                               widget.model.email,
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
                            Text(
                              "رقم الهاتف",
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
                               widget.model.phone,
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
                            Text(
                              " العنوان",
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
                               widget.model.address,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  )));
        });
  }
}
