import 'package:get/get.dart';
import 'package:route_runner/api_call/add_new_collection_api/add_new_collection_api.dart';
import 'package:route_runner/api_call/add_new_collection_api/add_new_collection_model.dart';

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
  RxBool loader = false.obs;


  Future<bool> addNewRepair({
    required String location,
    required String machineNumber,
    required String serialNumber,
    required String auditNumber,
    required String inNumbersPrevious,
    required String inNumbersCurrent,
    required String outNumbersPrevious,
    required String outNumbersCurrent,
    required String total,
    required String image,
  })
  async {
    loader.value = true;
    addNewCollectionModel =  await CustomerNewCollectionApi.customerNewCollectionApi(
      location: location,
      machineNumber: machineNumber,
      serialNumber: serialNumber,
      auditNumber: auditNumber,
      inNumbersPrevious: inNumbersPrevious,
      inNumbersCurrent: inNumbersCurrent,
      outNumbersPrevious: outNumbersPrevious,
      outNumbersCurrent: outNumbersCurrent,
      total: total,
      image: image,
    );
    update(['collection']);
    update(['newRepair']);
    loader.value = false;

    return  loader.value;
  }
  AddNewCollectionModel addNewCollectionModel =AddNewCollectionModel();


}
