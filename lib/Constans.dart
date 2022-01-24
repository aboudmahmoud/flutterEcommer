import 'package:flutter/material.dart';
//Colors
const KMainColor=Color(0xFFe0b589);
const KTextBackGroundColor=Color(0xFFf0dbc6);
const KBackGroundButton=Color(0xFFe089b4);
const KHintBottomMessgColor=Color(0xFFf8efe6);
const KLikeWhiteColor=Color(0xFFeeeee4);

//String
//this text our headling and We use it in CoustemIconView.dart page
const String CommercialPhrases="Where shopping is convenient";
// this our hint field text we use it in signup  page
const String HintMeesgName="Enter your name ";
// this our hint field text we use it in signup and login page
const String HintMessgEmail="Enter your email address";
// this our hint field text we use it in signup and login page
const String HintPasswordMessg="Enter your Password";
// this our hint field text we use it in  login page
const String ButtonTextLogin="Login";
// this our hint field text we use it in signup  page
const String HintTextSign="Sign up";
// this our hint field text we use it in  login page
const String HintBottomMessg="don't have  an account ?";
// this our hint field text we use it in signup  page
const String HintBottomMessgLog="you hav an account ?";
// this our hint field text we use  datrmine if use is admin or normal user
const String HintTttypeUser="I'm User";
// this our hint field text we use  datrmine if use is admin or normal user
const String HintTttypeAdmin="I'm Admin";
const String AdminPassword="admin1234";
const String AdmidinErrorMessg="Somethin Worng";
//Error Message That user wall read if TextField of name is Empty
const String ErrorNameMessg="Name is Empty";
//Error Message That user wall read if TextField of Email is Empty
const String ErrorEmailMessg="Email is Empty";
const String ErrorPasswordMessg="Password is Empty";
/* Here We are Dealing With Error Type of Firebase Massge*/
const String ErrorEmailFireBase="[firebase_auth/invalid-email] The email address is badly formatted.";
const String HandlingErrorEmail="Please make sure to write the email correctly";
const String ErrorPassowrdFireBase="[firebase_auth/weak-password] Password should be at least 6 characters";
const String HandlingErrorPasswordfire="Password should be at least 6 characters";
const String ErrorPassowrdFireBaselOGIN="[firebase_auth/wrong-password] The password is invalid or the user does not have a password.";
const String HandlingPassworLogin="The password is invalid";
const String ErrorEmailNotfound="[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.";
const String HandlinEmailError="Email not found";
const String ErrorNoInterConnection="[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
const String HanldingInterntError="no internet connection";
//Text show in Buttoun use in AdminPage.dart and in addProudcte
const String BTNAdd="Add Proudect";
/* Text show in Buttoun use in AdminPage.dart*/
const String  BTNManage="Mangae Proudect";
const String  BTNDlete="Delete Proudect";
/* hint messg we Display on AddProudcte.dart and we use it on store.dart */
const String HintProuductName="Proudcte Name";
const String HintProudctPrice= "Producte Price";
const String HintProductDescription="Producte Description";
const String HintProductCategory="Producte Category";
const String HintProductImage="Producte Image";
const String ProductColletion="Product";
/* here is the message we use in  EditProducte.dart*/
const String LoadingMessg="Loadin...";
const String EditMessg="Edit";
const String DeletMessg="Delet";
/*here is Text For widget in tab bar in HomePage.dar*/
const String All="All";
const String CD="CD";
const String jacket="jacket";
const String AC="AC";
const String pc="PC";
const String ps="ps5";
const String Discvoer="Discvoer";
const String homepage="Home Page";
const String cart="Cart";
const String wallet="wallet";
const String share="share";



//Methods

//We use that method in login and sing in screen
//that method get in any text hes is typing by geting the hintmessage
//than if we got empty or null from that text field we return message to tell hem
String? ErorrMessg(String ErrorMssg)
{
  switch(ErrorMssg)
  {
    case HintMeesgName: return ErrorNameMessg;
    case HintMessgEmail: return ErrorEmailMessg;
    case HintPasswordMessg: return ErrorPasswordMessg;

  }

}

//We Use That Method to Get deal with Error exption that come form firepase
// The firebase Exption it come with long and not undstaple for Normal user . so we Replaced Most Comon Error

String? HandlingErroeFireBase(String Exeption) {
  String? ErrorHanling;
  if (Exeption == ErrorEmailFireBase) {
    ErrorHanling = HandlingErrorEmail;
    return ErrorHanling;
  } else if (Exeption == ErrorPassowrdFireBase) {
    ErrorHanling = HandlingErrorPasswordfire;
    return ErrorHanling;
  } else if (Exeption == ErrorPassowrdFireBaselOGIN) {
    ErrorHanling = HandlingPassworLogin;
    return ErrorHanling;
  } else if (Exeption == ErrorEmailNotfound) {
    ErrorHanling = HandlinEmailError;
    return ErrorHanling;
  }else if (Exeption==ErrorNoInterConnection)
    {
      ErrorHanling=HanldingInterntError;
      return ErrorHanling;
    }
  else {
    ErrorHanling = Exeption;
    return ErrorHanling;
  }
}