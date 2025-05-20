import 'package:flutter/material.dart';
import 'action_card.dart';

Widget buildQuickActionsSection(BuildContext context, bool isSmallScreen) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Quick Actions",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      GridView.count(
        padding: const EdgeInsets.only(bottom: 12),
        crossAxisCount: isSmallScreen ? 2 : 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.1,
        children: [
          buildActionCard(
            context: context,
            title: "Find Donors",
            icon: Icons.search,
            color: Colors.blue,
            onTap: () {},
          ),
          buildActionCard(
            context: context,
            title: "Donate Blood",
            icon: Icons.bloodtype,
            color: Colors.red,
            onTap: () {},
          ),
          buildActionCard(
            context: context,
            title: "My Requests",
            icon: Icons.history,
            color: Colors.orange,
            onTap: () {},
          ),
          buildActionCard(
            context: context,
            title: "Centers",
            icon: Icons.local_hospital,
            color: Colors.green,
            onTap: () {},
          ),
        ],
      ),
    ],
  );
}
