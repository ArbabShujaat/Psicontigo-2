import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier{
  int _count=0;
  int get count=>_count;

  incrementCounter(){
    _count++;
    notifyListeners();
  }
  decrementCounter(){
    if(_count>0)
      _count--;
    notifyListeners();
  }
}