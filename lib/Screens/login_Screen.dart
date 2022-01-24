import 'package:ecommerce/Constans.dart';//importon file it Hold alot of Color And String we use it in diffren screens
import 'package:ecommerce/Provider/AdminMod.dart';
import 'package:ecommerce/Provider/moudelHub.dart';
import 'package:ecommerce/Screens/signup_Screen.dart';
import 'package:ecommerce/WidgetsToUse/CoustemIconView.dart';
import 'package:ecommerce/WidgetsToUse/coustemTextField.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AdminProtcols/AdminPage.dart';
import 'HomePage.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({Key? key}) : super(key: key);
  static String LoginSceern = "LoginSceern";//name of class
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();//we use globlas key to valdute our data we send
  String? _emaile, _passWOrd;// that to store our input that user entared
  String? ErrorHanling; // to Get error

  final _auth = Auth();// for firebase connetion

  @override
  Widget build(BuildContext context) {
    //To Take HightofanyScreen
    double heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        //Form widget cause we use From to get response
        key: _globalKey, //We use Key to send to valude to get error if we have
        child: ListView(
          children: [
            //We Gone Use The Store  Icon Alot so We Created coustom Widget to reuse it
            CoustomIconVeiw(),
            SizedBox(
              height: heightOfScreen * 0.04,
            ),
            CustomTextField(
              onClick: (value) {
                _emaile = value;
              },
              hint: HintMessgEmail, //value Get from Constans
              icon: Icons.email,
            ),
            SizedBox(
              height: heightOfScreen * 0.02,
            ),
            //CustomTextField is Coustam class I created to not Write the same attruptie twice
            CustomTextField(
                onClick: (value) {
                  _passWOrd = value;
                },
                hint: HintPasswordMessg,
                icon: Icons.lock),
            SizedBox(
              height: heightOfScreen * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Builder(builder: (context) {
                return TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: KBackGroundButton,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () async {

                    _Valdite(context);

                  },
                  child: Text(
                    ButtonTextLogin,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            ),
            SizedBox(
              height: heightOfScreen * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  HintBottomMessg,
                  style: TextStyle(color: KHintBottomMessgColor, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.signUpScreen);
                  },
                  child: Text(
                    HintTextSign,
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Provider.of<AdminMod>(context,listen: false).changeStatusAdmin(true);
                      },

                        child: Text(
                          HintTttypeAdmin,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Provider.of<AdminMod>(context,listen: false).isAdmin ? KMainColor:Colors.white,
                          ),
                        ),
                      ),
                    ),

                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Provider.of<AdminMod>(context,listen: false).changeStatusAdmin(false);
                      },
                      child: Text(
                        HintTttypeUser,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:  Provider.of<AdminMod>(context).isAdmin ? Colors.white:KMainColor,
                        ),
                      ),
                    ),
                  )


                ],
              ),
            )
          ], // ListViewChildern
        ),
      ),
    );
  }

  _Valdite(BuildContext ConText) async {
    final moudelhub = Provider.of<MoudleHud>(ConText,listen: false);
    moudelhub.changeIsLoading(true);
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      if (Provider.of<AdminMod>(ConText,listen: false).isAdmin) {
        if (_passWOrd==AdminPassword)
          {
            try {
              final authResult =
              await _auth.signIn(_emaile!, _passWOrd!);
              print(authResult.user?.uid);
              Navigator.pushNamed(ConText, AdminPage.adminPage);
            } catch (Exeption) {
              moudelhub.changeIsLoading(false);
              ErrorHanling=HandlingErroeFireBase(Exeption.toString());
              print(ErrorHanling);
              ScaffoldMessenger.of(ConText).showSnackBar(
                  SnackBar(content: Text(
                    ErrorHanling!,
                  )
                  )
              );
            }

          }
        else
          {
            moudelhub.changeIsLoading(false);
            ScaffoldMessenger.of(ConText).showSnackBar(
                SnackBar(content: Text(
                  AdmidinErrorMessg,
                )
                )
            );
          }
      } else {
        try {
          final authResult =
              await _auth.signIn(_emaile!, _passWOrd!);
          print(authResult.user?.uid);
          Navigator.pushNamed(ConText, HomePage.homePage);
        } catch (Exeption) {
          moudelhub.changeIsLoading(false);
          ErrorHanling=HandlingErroeFireBase(Exeption.toString());
          print(ErrorHanling);
          ScaffoldMessenger.of(ConText).showSnackBar(
              SnackBar(content: Text(
                ErrorHanling!,
              )
              )
          );
        }
      }
    }
    moudelhub.changeIsLoading(false);
  }
}
