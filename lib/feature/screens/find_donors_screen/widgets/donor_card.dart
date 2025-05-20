import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/find_donors_controller.dart';

class DonorCard extends StatelessWidget {
  final FindDonorsController controller = Get.find();

  DonorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Blood Group Badge
            Obx(() => Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.red[50],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
              ),
              child: Center(
                child: Text(
                  controller.selectedBloodGroup.value.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[800],
                  ),
                ),
              ),
            )),

            const SizedBox(width: 16),

            // Donor Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Obx(() => Text(
                    '${controller.selectedDistrict.value}, Bangladesh',
                    style: TextStyle(color: Colors.grey[600]),
                  )),
                  const SizedBox(height: 4),
                  Text(
                    'Last donated: 2 months ago',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),

            // Contact Button
            IconButton(
              icon: Icon(Icons.phone, color: Colors.red),
              onPressed: () => _showContactDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showContactDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'Contact Donor',
      content: const Text('Would you like to call or message this donor?'),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
            Get.snackbar('Calling', 'Connecting to donor...');
          },
          child: const Text('Call'),
        ),
      ],
    );
  }
}