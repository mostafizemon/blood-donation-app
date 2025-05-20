import 'package:blood_donation/feature/screens/home_screen/widgets/quick_action.dart';
import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/emergency_card.dart';
import 'widgets/recent_donations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverPadding(
            padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                buildEmergencyRequestCard(context),
                SizedBox(height: isSmallScreen ? 12 : 16),
                buildQuickActionsSection(context, isSmallScreen),
                SizedBox(height: isSmallScreen ? 12 : 16),
                buildRecentDonationsSection(context),
                SizedBox(height: isSmallScreen ? 12 : 16),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
