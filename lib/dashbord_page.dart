import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'orders_page.dart';
import 'visits_page.dart';
import 'profile_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  
  final List<Map<String, dynamic>> dashboardItems = [
    {"icon": Icons.shopping_cart, "title": "Orders", "page": OrdersPage()},
    {"icon": Icons.location_on, "title": "Visits", "page": VisitsPage()},
    {"icon": Icons.person, "title": "Profile", "page": ProfilePage()},
    {"icon": Icons.logout, "title": "Logout", "page": null, "isLogout": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: dashboardItems.length,
          itemBuilder: (context, index) {
            final item = dashboardItems[index];
            return _buildDashboardCard(
              context,
              item["icon"],
              item["title"],
              item["page"],
              isLogout: item["isLogout"] ?? false,
            );
          },
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    IconData icon,
    String title,
    Widget? page, {
    bool isLogout = false,
  }) {
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}