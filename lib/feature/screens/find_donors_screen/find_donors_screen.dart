import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/find_donors_controller.dart';
import 'widgets/blood_group_filter.dart';
import 'widgets/location_filter.dart';
import 'widgets/donor_card.dart';

class FindDonorsScreen extends StatelessWidget {
  final FindDonorsController controller = Get.put(FindDonorsController());

  FindDonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find Blood Donors'), centerTitle: true),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildFilterCard(
                    title: 'Select Blood Group',
                    child: BloodGroupFilter(),
                  ),
                  const SizedBox(height: 16),
                  _buildFilterCard(
                    title: 'Select Location',
                    child: LocationFilter(),
                  ),
                  const SizedBox(height: 16),
                  _buildSearchButton(),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => DonorCard(),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCard({required String title, required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          final bloodGroup = controller.selectedBloodGroup.value.name;
          final division = controller.selectedDivision.value;
          final district = controller.selectedDistrict.value;

          Get.snackbar(
            'Searching Donors',
            'Blood Group: $bloodGroup\nLocation: $district, $division',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        child: const Text(
          'Search Donors',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
