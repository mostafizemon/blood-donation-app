import 'package:get/get.dart';
import '../model/location.dart';
import '../model/blood_group.dart';

class FindDonorsController extends GetxController {
  var selectedBloodGroup = BloodGroup.aPositive.obs;

  // Location selection
  var selectedDivision = Location.bangladeshDivisions.first.obs;
  var selectedDistrict = Location.divisionDistricts[Location.bangladeshDivisions.first]!.first.obs;

  // Optional getter for cleaner access in UI
  Map<String, List<String>> get divisionDistricts => Location.divisionDistricts;

  void changeBloodGroup(BloodGroup group) {
    selectedBloodGroup.value = group;
  }

  void changeDivision(String division) {
    selectedDivision.value = division;
    selectedDistrict.value = Location.divisionDistricts[division]!.first;
  }

  void changeDistrict(String district) {
    selectedDistrict.value = district;
  }

  List<String> get districts => Location.divisionDistricts[selectedDivision.value] ?? [];
}
