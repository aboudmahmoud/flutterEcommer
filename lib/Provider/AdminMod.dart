import 'package:flutter/cupertino.dart';

class AdminMod extends ChangeNotifier{
  bool isAdmin=false;
  changeStatusAdmin(bool IsAdmin)
  {
    isAdmin=IsAdmin;
    notifyListeners(); // the metod to repulid when status of admin is change to user

  }


}