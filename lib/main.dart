import 'package:ecommerce/Screens/signup_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Provider/AdminMod.dart';
import 'Provider/moudelHub.dart';
import 'Screens/AdminProtcols/AddProducte.dart';
import 'Screens/AdminProtcols/AdminPage.dart';
import 'Screens/AdminProtcols/EditProducte.dart';
import 'Screens/AdminProtcols/UpdateProducte.dart';
import 'Screens/HomePage.dart';
import 'Screens/login_Screen.dart';
import 'package:flutter/services.dart';

void main() async {
  //this Stop App From Rotating
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//This For Connectiong to datapasw
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MultiProvider(
      providers: [
    ChangeNotifierProvider<MoudleHud>(
    create: (context)=>MoudleHud(),
    ),
        ChangeNotifierProvider<AdminMod>(
          create: (context)=>AdminMod(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.LoginSceern,
          routes: {
            EditProducte.editProducte:(context)=>EditProducte(),
            LoginScreen.LoginSceern: (context) => LoginScreen(),
            SignUpScreen.signUpScreen: (context) => SignUpScreen(),
            HomePage.homePage:(context)=>HomePage(),
            AdminPage.adminPage:(context)=>AdminPage(),
            AddProducte.addProducte:(context)=>AddProducte(),
            MangeProducte.manageProducte:(context)=>MangeProducte()
          },
        ),
    );
  }
}
