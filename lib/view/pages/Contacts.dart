import 'dart:ffi';

import 'package:dmpcreative/network/Base/ApiEndPoints.dart';
import 'package:dmpcreative/network/Models/ContactModel.dart';
import 'package:dmpcreative/utility/globalColors.dart';
import 'package:dmpcreative/view/pages/homepage.dart';
import 'package:dmpcreative/view/widgets/bottomnavBar.dart';
import 'package:dmpcreative/view/widgets/floatingbutton.dart';
import 'package:dmpcreative/view/widgets/ContactinfoBottomsheet.dart';
import 'package:dmpcreative/view/widgets/mainline.dart';
import 'package:flutter/material.dart';

import '../../network/Base/NetworkApiService.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  late Future<List<ContactModel>> contact;
    NetworkApiService contactdata = NetworkApiService();

  @override
   initState(){
    contact=contactdata.getallcontact(ApiEndPoints().getallcontact);
    super.initState();
  

  }

  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          const MainLine(),
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
                    const SizedBox(
                      width: 150,
                    ),
                    const Text(
                      "جهات الاتصال",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
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
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.95,
                height: MediaQuery.of(context).size.height * 0.5,
                child:
                
                 FutureBuilder(
                    future: contact,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return contactCard(context,
                             snapshot.data![index]
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10,);
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
        ]),
        bottomNavigationBar: Container(
            color: GlobalColors.mainColor,
            child: CustomNavBar(currentIndex: _selectedIndex)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloattingButton());
  }
}

Widget contactCard(BuildContext context,ContactModel contact){
  return  InkWell(
  
                              onTap: () {
                                ContactInfoBottomsheet(context,contact);
                              },
    child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: GlobalColors.mainColor,
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          contact.name,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
  );
}