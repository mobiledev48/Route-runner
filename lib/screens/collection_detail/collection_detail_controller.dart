import 'package:get/get.dart';

class CollectionDetailController extends GetxController {
  List data = ['In', 'Out'];

  num calculateTotalValue(num? In, num? out) {
    num total = (In ?? 0) + (out ?? 0);
    return total;
  }

  num calculateSubtractedValue(num? In, num? out) {
    num total = (In ?? 0) - (out ?? 0);
    return total;
  }
}
