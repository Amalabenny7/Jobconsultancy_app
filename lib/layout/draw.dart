


import 'package:flutter/material.dart';
import 'login.dart';

class Draw extends StatelessWidget {
  // const Draw({super.key});
  const Draw({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E2A47), Color(0xFF4A5D82)], // Matches home page theme
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            // Drawer Header Section
            Container(
              padding: const EdgeInsets.only(bottom: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF1E2A47), // Dark header
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              // child: const DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('asset/a.png'),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Keen App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            // ),

            // Drawer Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(Icons.apartment, "View Job", context, '/view_job'),
                  _buildDrawerItem(Icons.report, "Complaints", context, '/ccc'),
                  _buildDrawerItem(Icons.comment, "Feedback", context, '/ffff'),
                   _buildDrawerItem(Icons.comment, "Feedback History", context, '/nnn'),
                  _buildDrawerItem(Icons.question_mark_outlined, "Post Enquiry", context, '/eee'),
                  _buildDrawerItem(Icons.person, "Update Profile", context, '/edit'),
                  // _buildDrawerItem(Icons.track_changes, "Track Application", context, '/vwpass'),
                  _buildDrawerItem(Icons.notifications, "Reply", context, '/reply'),
                  _buildDrawerItem(Icons.notifications, "Enquiry Response", context, '/response'),
                  _buildDrawerItem(Icons.assignment, "Agreement", context, '/cmp'),
                  _buildDrawerItem(Icons.check_circle, "Application Status", context, '/applicationstatus'),
                  _buildDrawerItem(Icons.history, "Application History", context, '/applicationhistory'),
                   _buildDrawerItem(Icons.history, "Favourites", context, '/hhh'),
                  const SizedBox(height: 12), // Space before logout
                  _buildDrawerItem(Icons.logout, "Logout", context, '/logout', isLogout: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Drawer Item Widget
  Widget _buildDrawerItem(IconData icon, String title, BuildContext context, String route, {bool isLogout = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.white24,
          onTap: () {
            if (isLogout) {
              // Handle Logout
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (Route<dynamic> route) => false,
              );
            } else {
              // Navigate to other screens
              Navigator.pushNamed(context, route);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white30, width: 1), // Border effect
            ),
            child: ListTile(
              leading: Icon(icon, color: Colors.white, size: 26),
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
