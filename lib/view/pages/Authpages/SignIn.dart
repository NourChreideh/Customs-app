import 'package:dmpcreative/network/Models/Request/ApiResponse.dart';
import 'package:dmpcreative/network/Models/Request/Status.dart';
import 'package:dmpcreative/utility/Preferences.dart';
import 'package:dmpcreative/utility/globalColors.dart';
import 'package:dmpcreative/view/pages/Authpages/SignUp.dart';
import 'package:dmpcreative/view/pages/homepage.dart';
import 'package:dmpcreative/view/widgets/CustomTextfield.dart';
import 'package:dmpcreative/view/widgets/PasswordtextField.dart';
import 'package:dmpcreative/view/widgets/button.dart';
import 'package:dmpcreative/view_model/AuthVM.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../network/Models/LoginandSignUpreponse.dart';
import '../../widgets/loadingdialog.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   final email_controller = TextEditingController();
  final pass_controller = TextEditingController();
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
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: GlobalColors.SelectedColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                  ),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                
                      decoration: BoxDecoration(
                              color: Colors.black,
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      " مرحبًا بعودتك!",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "  تسجيل الدخول إلى حسابك!",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
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
                controller: pass_controller,
                hint: ".......",
                onVisibilityChanged: (isVisible) {},
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "هل نسيت المرور؟",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: GlobalColors.SelectedColor),
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Button(
                  text: "تسجيل الدخول",
                  textColor: Colors.black,
                        func: () async {
                            showDialog(
                          context: context,
                          builder: (context) => LoadingDialog());

                      ApiResponse? r = await viewmodel1.login(
                        email_controller.text,
                        pass_controller.text,
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
                        String bio=res.bio;

                        print("User Id = $name");
                        context.read<PrefProvider>().setId(id);
                          context.read<PrefProvider>().setname(name);
                             context.read<PrefProvider>().setemail(email);
                                  context.read<PrefProvider>().setbio(bio);



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
                height: 50,
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                 
                      const Text("لا يوجد لديك حساب؟",style: TextStyle(fontSize: 16,color: Colors.white),),
                      InkWell(
                                       onTap: (){  Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUp(),
              ));},
                        
                        child: Text("اشتراك",style: TextStyle(fontSize: 16,color: GlobalColors.SelectedColor),))
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
