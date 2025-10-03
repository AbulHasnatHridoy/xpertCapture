import 'package:flutter/material.dart';
import 'orders_page.dart';
import 'visits_page.dart';
import 'profile_page.dart';
import 'loginPage.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false, // remove back button
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          _buildDashboardCard(
              context, Icons.shopping_cart, "Orders", const OrdersPage()),
          _buildDashboardCard(
              context, Icons.location_on, "Visits", const VisitsPage()),
          _buildDashboardCard(
              context, Icons.person, "Profile", const ProfilePage()),
          _buildDashboardCard(
              context, Icons.logout, "Logout", null, isLogout: true),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, IconData icon, String title,
      Widget? page,
      {bool isLogout = false}) {
    return GestureDetector(
      onTap: () {
        if (isLogout) {
          // Navigate back to login page and clear navigation stack
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Loginpage()),
            (route) => false,
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page!),
          );
        }
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
