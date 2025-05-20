import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/find_donors_controller.dart';
import '../model/blood_group.dart';

class BloodGroupFilter extends StatelessWidget {
  final FindDonorsController controller = Get.find();

  BloodGroupFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Wrap(
      spacing: 8,
      runSpacing: 8,
      children: BloodGroup.values.map((group) {
        return FilterChip(
          label: Text(group.name),
          selected: group == controller.selectedBloodGroup.value,
          onSelected: (selected) => controller.changeBloodGroup(group),
          selectedColor: Colors.red[100],
          checkmarkColor: Colors.red,
          labelStyle: TextStyle(
            color: group == controller.selectedBloodGroup.value
                ? Colors.red
                : Colors.black,
          ),
        );
      }).toList(),
    ));
  }
}