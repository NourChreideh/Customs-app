
import 'package:dmpcreative/view/pages/Contacts.dart';
import 'package:dmpcreative/view/pages/News.dart';
import 'package:dmpcreative/view/pages/Records.dart';
import 'package:dmpcreative/view/pages/homepage.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final int? currentIndex;

  CustomNavBar({super.key, this.currentIndex});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int? _selectedIndex;

  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const News()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Records()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Contacts()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
          boxShadow: [
      BoxShadow(
        color: Colors.white, 
        offset: Offset(0, -0), 
        blurRadius: 3.0, 
      ),
    ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
      height: 70  ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () => _onItemTapped(0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/Home.png",
                      
                    ),
                    const SizedBox(height: 5,),
                    Text("الرئيسية",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff8F8F8F))),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () => _onItemTapped(1),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/News.png",
                      
                    ),
                    const SizedBox(height: 5,),
                    Text("اخبار",
                        style: TextStyle(
                            fontSize: 12,
                            color:  Color(0xff8F8F8F))),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),

          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () => _onItemTapped(2),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/Records.png",
                     
                    ),
                    const SizedBox(height: 5,),
                    Text("السجلات",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff8F8F8F))),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () => _onItemTapped(3),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/Contacts.png",
                    
                    ),
                    const SizedBox(height: 5,),
                     Text("جهات الاتصال",
                        style: TextStyle(fontSize: 12, color:Color(0xff8F8F8F)  )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
