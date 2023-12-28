
import 'package:dmpcreative/network/Models/NewsModel.dart';
import 'package:dmpcreative/utility/globalColors.dart';
import 'package:dmpcreative/view/widgets/mainline.dart';
import 'package:flutter/material.dart';


class NewsDetail extends StatefulWidget {
  NewsModel news;
   NewsDetail({super.key,required this.news});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {



  
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
                    "التفاصيل",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: (){
  Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_forward_ios,color: Colors.white,))
               
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(widget.news.image.toString(),
                
                fit: BoxFit.fill,)),
            ),
              SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
               color: GlobalColors.mainColor), 
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.news.name.toString(),style: const TextStyle(color: Colors.white,fontSize: 18),),
                )),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
               color: GlobalColors.mainColor), 
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(widget.news.description.toString(),style: const TextStyle(color: Colors.white,fontSize: 16),),
                )),
            )
          
        
          ],
        ),
      ]),
   
    );
  }

}