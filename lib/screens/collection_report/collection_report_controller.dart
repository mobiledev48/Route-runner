import 'package:get/get.dart';

class CollectionReportController extends GetxController {
  bool onClick = false;
  void nextPage(index) {
    onClick = index;
    update(['collection']);
  }
}
