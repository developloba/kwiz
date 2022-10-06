import 'package:flutter/foundation.dart';

class SpinnerModel extends ChangeNotifier {
  bool spinnerstate = false;
  void togglespinnerstate() {
    if (spinnerstate == false) {
      spinnerstate == true;
      notifyListeners();
    } else if (spinnerstate == true) {
      spinnerstate == false;
      notifyListeners();
    }
  }
}
