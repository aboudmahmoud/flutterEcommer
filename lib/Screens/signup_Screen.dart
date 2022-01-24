import 'package:ecommerce/Provider/moudelHub.dart';
import 'package:ecommerce/WidgetsToUse/CoustemIconView.dart';
import 'package:ecommerce/WidgetsToUse/coustemTextField.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/auth.dart';
import '../Constans.dart'; //importon file it Hold alot of Color And String we use it in diffren screens
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static String signUpScreen = "SignUpScreen";//name of class
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();//we use globlas key to valdute our data we send
  String? _name, _emaile, _passWOrd; // that to store our input that user entared
  String? ErrorHanling; // to Get error
  final _auth = Auth(); // for firebase connetion

  @override
  Widget build(BuildContext context) {
    //To Take HightofanyScreen
    double heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<MoudleHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              CoustomIconVeiw(),
              SizedBox(
                height: heightOfScreen * 0.04,
              ),
              CustomTextField(
                  onClick: (value) {
                    _name = value;
                  },
                  hint: HintMeesgName,
                  icon: Icons.perm_identity),
              SizedBox(
                height: heightOfScreen * 0.02,
              ),
              CustomTextField(
                onClick: (value) {// value is the textfield.gettext that user put
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
                      final moudelhub =
                          Provider.of<MoudleHud>(context, listen: false);
                      moudelhub.changeIsLoading(true);
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        try {
                          final authResult =
                              await _auth.signUp(_emaile!, _passWOrd!);
                          moudelhub.changeIsLoading(false);
                          Navigator.pop(context);
                        } catch (exeption) {
                          moudelhub.changeIsLoading(false);

                          /*   if (exeption.toString() == ErrorEmailFireBase) {
                              ErrorHanling = HandlingErrorEmail;
                            } else if (exeption.toString() ==
                                ErrorPassowrdFireBase) {
                              ErrorHanling = HandlingErrorPasswordfire;
                            } else {
                              ErrorHanling = exeption.toString();
                            }*/
                          ErrorHanling =
                              HandlingErroeFireBase(exeption.toString());

                          Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text(ErrorHanling!)),
                          );
                        }
                      }
                      //there No Need For Else statmen in validate Repulid with Error Message
                      moudelhub.changeIsLoading(false);
                    },
                    child: Text(
                      HintTextSign,
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
                    HintBottomMessgLog,
                    style:
                        TextStyle(color: KHintBottomMessgColor, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context); // We use pop instaed of Creatd new Route (stack strucre)
                      // Navigator.pushNamed(context, LoginScreen.LoginSceern);
                    },
                    child: Text(
                      ButtonTextLogin,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              )
            ], // ListViewChildern
          ),
        ),
      ),
    );
  }
}
