import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/find_donors_controller.dart';

class LocationFilter extends StatelessWidget {
  final FindDonorsController controller = Get.find();

  LocationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Division Dropdown
        Obx(() => DropdownButtonFormField<String>(
          value: controller.selectedDivision.value,
          decoration: InputDecoration(
            labelText: 'Division',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          items: controller.divisionDistricts.keys.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) controller.changeDivision(value);
          },
        )),
        const SizedBox(height: 12),
        // District Dropdown
        Obx(() => DropdownButtonFormField<String>(
          value: controller.selectedDistrict.value,
          decoration: InputDecoration(
            labelText: 'District',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          items: controller.districts.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) controller.changeDistrict(value);
          },
        )),
      ],
    );
  }
}
