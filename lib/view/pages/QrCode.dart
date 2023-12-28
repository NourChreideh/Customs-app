
import 'package:dmpcreative/utility/globalColors.dart';
import 'package:dmpcreative/view/widgets/button.dart';
import 'package:dmpcreative/view/widgets/mainline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'homepage.dart';
class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
    var qrstr ="يرجى مسح رمز HS";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      MainLine(),
      Column(children: [
        const SizedBox(
          height: 75,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
              ),
              Text(
                "مسح كود HS",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
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
        Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Stack(children: [
              Image.asset("assets/images/qrmainImage.png"),
              Positioned(
                top: 150,
                right: 10,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.48,
                    width:  MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11)),
                      child: Column(children: [
                        SizedBox(height: 20,),
                        Image.asset("assets/images/secondqr.png"),
                        SizedBox(height: 20,),
                        Text(qrstr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                            SizedBox(height: 70,),
                           Button(
                              text: "اوك",
                              textColor: Colors.black,
                              func:  scanQr,
                              buttonColor: GlobalColors.SelectedColor,
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.07,
                              borderColor: GlobalColors.SelectedColor,
                              fontSize: 20),
                                 const SizedBox(height: 10,),
                      ],),
                ),
              )
            ]))
      ])
    ]));
  }
    Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          qrstr=value;
        });
      });
    }catch(e){
      setState(() {
        qrstr='unable to read this';
      });
    }
  }
}
