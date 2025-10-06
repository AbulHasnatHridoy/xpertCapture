import "package:flutter/material.dart";
import 'package:login/loginPage.dart';
import "orders_page.dart";
import 'profile_page.dart';
import 'visits_page.dart';
class DashbordPage extends StatefulWidget {
  const DashbordPage({super.key});

  @override
  State<DashbordPage> createState() => _DashbordPageState();
}

class _DashbordPageState extends State<DashbordPage> {
  final List<Map<String,dynamic>>dashbordCardItems=[
    {"icon": Icons.shopping_cart,"title":"Orders","page":OrdersPage()},
    {"icon": Icons.location_on,"title":"Visits","page":VisitsPage()},
    {"icon": Icons.person,"title":"Profile","page":ProfilePage()},
    {"icon":Icons.logout,"title":"Logout","page":null,"isLogout":true}
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            ),
            itemCount: dashbordCardItems.length,
             itemBuilder:(context,index){
              
              return _buildDashbordCard(
              context,
              dashbordCardItems[index]["icon"],
              dashbordCardItems[index]["title"],
              dashbordCardItems[index]["page"],
             isLogout: dashbordCardItems[index]["isLogout"]??false,
             );
             }),
        ),
    );
  }
  Widget _buildDashbordCard(
    BuildContext context,
    IconData icon,
    String title,
    Widget? page,
    {bool isLogout=false}
    )
    {
      return GestureDetector(
        onTap: () {
          if(isLogout)
          {
            Navigator.pushAndRemoveUntil(
              context, 
            MaterialPageRoute(
              builder: (context)=>Loginpage()),
               (route)=>false);
          }
          else{
            Navigator.push(
              context, 
            MaterialPageRoute(
              builder: (context)=>page!));
          }
        },
        child: Card(
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30.0),
            
          ),
          color:Colors.blueAccent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon,size: 50,color:Colors.white),
                SizedBox(height: 10,),
                Text(title,style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ),
        ),

        
      );
      
    }
}