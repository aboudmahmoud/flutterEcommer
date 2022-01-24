import 'package:flutter/cupertino.dart';

class MoudleHud extends ChangeNotifier{
  bool isLoading=false;
  changeIsLoading(bool stats)
  {
    isLoading=stats;
    notifyListeners();
  }
}