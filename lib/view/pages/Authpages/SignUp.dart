import 'package:country_list_pick/country_list_pick.dart';
import 'package:dmpcreative/network/Models/LoginandSignUpreponse.dart';
import 'package:dmpcreative/network/Models/Request/ApiResponse.dart';
import 'package:dmpcreative/network/Models/Request/Status.dart';
import 'package:dmpcreative/utility/Preferences.dart';
import 'package:dmpcreative/utility/globalColors.dart';
import 'package:dmpcreative/view/pages/Authpages/SignIn.dart';
import 'package:dmpcreative/view/pages/homepage.dart';
import 'package:dmpcreative/view/widgets/CustomTextfield.dart';
import 'package:dmpcreative/view/widgets/button.dart';
import 'package:dmpcreative/view/widgets/loadingdialog.dart';
import 'package:dmpcreative/view_model/AuthVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/PasswordtextField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   bool _isChecked = false;
    String selectedCountryCode = "";
     final email_controller = TextEditingController();
  final pass_controller = TextEditingController();
  final name_controller=TextEditingController();
  final AuthVm viewmodel1 = AuthVm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.17,
                decoration: BoxDecoration(
                  color: GlobalColors.SelectedColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                  ),
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تسجيل ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  
                    SizedBox(
                      height: 10,
                    ),
                  
                    Text(
                      " انشاء حساب جديد",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
               const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    " الاسم الكامل",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller:name_controller ,
                hint: "John Doe",
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "البريد الالكتروني",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: email_controller,
                hint: "johndoe@gmail.com",
              ),
              const SizedBox(
                height: 20,
              ),
               const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    " رقم الهاتف",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(width: 20,),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.073,
                        decoration: BoxDecoration(
                          color: GlobalColors.mainColor,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: CountryListPick(
                            theme: CountryTheme(
                           alphabetSelectedTextColor: Colors.white,
                              isShowFlag: true,
                              isShowTitle: false,
                              isShowCode: false,
                              isDownIcon: true,
                              showEnglishName: false,
                            ),
                            initialSelection: '+966',
                            onChanged: (CountryCode? code) {
                              selectedCountryCode = code!.name!;
                                                 
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                    width:   MediaQuery.of(context).size.width * 0.65,
                      child: CustomTextfield(
                        hint: "223 665 7894",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "كلمة المرور",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              PasswordField(
       controller:         pass_controller,
                hint: ".......",
                onVisibilityChanged: (isVisible) {},
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
      children: [
        const SizedBox(width: 20,),
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
          },
          child: Text(
            'لقد وافقت على الشروط وسياسة الخصوصية',
            style: TextStyle(  fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: GlobalColors.SelectedColor),
          ),
        ),
      ],
    ),
             
              const SizedBox(
                height: 10,
              ),
              Button(
                  text: "سجل",
                  textColor: Colors.black,
                        func: () async {
                            showDialog(
                          context: context,
                          builder: (context) => LoadingDialog());

                      ApiResponse? r = await viewmodel1.signup(name_controller.text,
                        email_controller.text,
                        pass_controller.text,
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
                        print("Completed...$r");
              context.read<PrefProvider>().login();
 loginresponse res = loginresponse.fromJson(r.data);

                        String id = res.id;
                        String name=res.name;
                        String email=res.email;
                      

                        print("User Id = $name");
                        context.read<PrefProvider>().setId(id);
                          context.read<PrefProvider>().setname(name);
                             context.read<PrefProvider>().setemail(email);




                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));

                        return;
                      }

                      print(r);
           
                  },
                  buttonColor: GlobalColors.SelectedColor,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  borderColor: GlobalColors.SelectedColor,
                  fontSize: 18),
                   const SizedBox(
                height: 20,
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                 
                      const Text("هل لديك حساب بالفعل؟",style: TextStyle(fontSize: 16,color: Colors.white),),
                      InkWell(
                        onTap: (){  Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignIn(),
              ));},
                        
                        child: Text("تسجيل الدخول",style: TextStyle(fontSize: 16,color: GlobalColors.SelectedColor),))
                    ],
                  ),
                  const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
}}