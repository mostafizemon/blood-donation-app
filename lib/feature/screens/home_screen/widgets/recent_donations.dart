import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

Widget buildRecentDonationsSection(BuildContext context) {
  final donations = [
    {
      'bloodType': 'A+',
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'location': 'City Blood Center',
      'units': 1,
    },
    {
      'bloodType': 'O-',
      'date': DateTime.now().subtract(const Duration(days: 30)),
      'location': 'Regional Hospital',
      'units': 2,
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          "Recent Donations",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: donations.isEmpty
            ? _buildEmptyState()
            : Column(
          children: [
            ...donations.map((donation) => _buildDonationTile(donation)).toList(),
            _buildViewAllButton(context),
          ],
        ),
      ),
    ],
  );
}

Widget _buildDonationTile(Map<String, dynamic> donation) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    leading: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          donation['bloodType'],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    ),
    title: Text(
      donation['location'],
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
    subtitle: Text(
      DateFormat('MMM dd, yyyy').format(donation['date']),
      style: TextStyle(color: Colors.grey[600]),
    ),
    trailing: Chip(
      backgroundColor: Colors.green[50],
      label: Text(
        '${donation['units']} unit${donation['units'] > 1 ? 's' : ''}',
        style: TextStyle(color: Colors.green[800]),
      ),
    ),
  );
}

Widget _buildEmptyState() {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        Icon(Icons.bloodtype, size: 48, color: Colors.grey[400]),
        const SizedBox(height: 16),
        Text(
          "No recent donations",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Your donation history will appear here",
          style: TextStyle(color: Colors.grey[500]),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget _buildViewAllButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
        },
        child: const Text("View All Donations"),
      ),
    ),
  );
}