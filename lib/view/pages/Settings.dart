import 'package:dmpcreative/generated/l10n.dart';
import 'package:dmpcreative/main.dart';
import 'package:dmpcreative/network/Base/ApiEndPoints.dart';
import 'package:dmpcreative/network/Base/NetworkApiService.dart';
import 'package:dmpcreative/network/Models/Request/ApiResponse.dart';
import 'package:dmpcreative/network/Models/Request/Status.dart';
import 'package:dmpcreative/utility/Preferences.dart';
import 'package:dmpcreative/utility/globalColors.dart';
import 'package:dmpcreative/view/pages/Authpages/SignIn.dart';
import 'package:dmpcreative/view/pages/Authpages/SignUp.dart';
import 'package:dmpcreative/view/pages/homepage.dart';
import 'package:dmpcreative/view/widgets/CustomTextfield.dart';
import 'package:dmpcreative/view/widgets/button.dart';
import 'package:dmpcreative/view/widgets/loadingdialog.dart';
import 'package:dmpcreative/view/widgets/mainline.dart';
import 'package:dmpcreative/view_model/AuthVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  NetworkApiService api=NetworkApiService();
    final AuthVm viewmodel1 = AuthVm();
       final email_controller = TextEditingController();
  final pass_controller = TextEditingController();
  final bio_controller=TextEditingController();
  final name_controller=TextEditingController();
@override
  void initState() {
     name_controller.text=preferencesInstance.getname();
     email_controller.text=preferencesInstance.getemail();
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        MainLine(),
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                  ),
                  Text(
                    "حسابي",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: CustomTextfield(
                  controller: name_controller,
                    hint: "الاسم الكامل",
                   ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: CustomTextfield(
                  controller:email_controller ,
                    hint: "البريد الالكتروني",
                    ),
              ),
  
              SizedBox(
                height: 50,
              ),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                      text: "حفظ ",
                      textColor: Colors.black,
                      buttonColor: GlobalColors.SelectedColor,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      borderColor: GlobalColors.mainColor,
                      func: () async {
                            showDialog(
                          context: context,
                          builder: (context) => LoadingDialog());

                      ApiResponse? r = await viewmodel1.editprofile(name_controller.text,
                        email_controller.text,
                       "123456789",
                        "1"
                      );
                      print('${ApiResponse}');
                      Navigator.of(context).pop();

                      if (r.status == null) {
                        final snackBar = SnackBar(
                          content: Text('An Error Occur: ${r.message}'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      if (r.status == Status.ERROR) {
                        // show error
                        final snackBar = SnackBar(
                          content: Text('Failed: ${r.message}'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      if (r.status == Status.COMPLETED) {
                         context.read<PrefProvider>().setname(name_controller.text);
                             context.read<PrefProvider>().setemail(email_controller.text);
                              



                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));

                        return;
                      }

                      print(r);
           
                  },
                      fontSize: 16),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(
                      text: "حذف الحساب",
                      textColor: Colors.black,
                      buttonColor: GlobalColors.SelectedColor,
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.07,
                      borderColor: GlobalColors.mainColor,
                      func: (){
                        showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
  title: Text('تأكيد حذف الحساب', style: TextStyle(fontSize: 14, color: Colors.white)),
  content: Text('هل أنت متأكد أنك تريد حذف حسابك؟', style: TextStyle(fontSize: 14, color: Colors.white)),
  backgroundColor: GlobalColors.mainColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  actions: [
    TextButton(
      onPressed: () async {
        Future<String> response = api.deleteissues(ApiEndPoints().deleteUser, preferencesInstance.getId());
        String responseString = await response;
        if (responseString == "User deleted successfully") {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const SignUp()));
        } else {
          final snackBar = SnackBar(
            content: Text('Failed to delete your account'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        return;
      },
      child: Text('نعم', style: TextStyle(fontSize: 14, color: Colors.white)),
    ),
    TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('لا', style: TextStyle(fontSize: 14, color: Colors.white)),
    ),
  ],
);

      },
    );
           
                      },
                      fontSize: 16),
                      SizedBox(
                height: 12,
              ),
                          Button(
                     text: "تسجيل الخروج",
                     textColor: Colors.black,
                     buttonColor: GlobalColors.SelectedColor,
                     width: MediaQuery.of(context).size.width * 0.45,
                     height: MediaQuery.of(context).size.height * 0.07,
                     borderColor: GlobalColors.mainColor,
                     func: (){
                          context.read<PrefProvider>().logout();
                                Navigator.pushReplacement(
                             context, MaterialPageRoute(builder: (context) => const SignIn()));
                     },
                     fontSize: 16),
                ],
              ),
              
             
                   SizedBox(
                height: 12,
              ),
              
            ],
          ),
        ),
      ]),
    );
  }
}
