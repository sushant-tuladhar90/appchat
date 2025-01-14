import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Function to sign out the user
  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // After signing out, redirect the user to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage(verificationid: '')), // Pass the required parameter if needed
      );
    } catch (e) {
      // Handle sign-out error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error signing out: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Text(
            "Menu",
            style: TextStyle(
              fontFamily: 'mulish',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Profile Section
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: Row(
              children: [
                // Profile Picture
                GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/images/Sushant.jpg", // Replace with actual image path
                      width: 49,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                // Name and Phone Number
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sushant Tuladhar",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "+977-9807010054",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add navigation action
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 0.5,
          ),
          // Menu Items
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(
                  icon: Icons.account_circle,
                  title: "Account",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.chat,
                  title: "Chat",
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 0.5,
                ),
                _buildMenuItem(
                  icon: Icons.brightness_6,
                  title: "Appearance",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.notifications,
                  title: "Notification",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.privacy_tip,
                  title: "Privacy",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: "Help",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.share,
                  title: "Invite your friends",
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 0.5,
                ),
                // Sign-out item
                GestureDetector(
                  onTap: _signOut,
                  child: const ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      size: 24,
                      color: Colors.black,
                    ),
                    title: Text(
                      "Sign Out",
                      style: TextStyle(
                        fontFamily: 'mulish',
                        fontSize: 16,
                      ),
                    ),
                    // trailing: Icon(
                    //   Icons.arrow_forward_ios,
                    //   size: 16,
                    //   color: Colors.grey,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 24, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'mulish',
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
