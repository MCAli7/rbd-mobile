import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = 'SettingsScreen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white), // Change text color to black
        ),
        backgroundColor: Color(0xFF357A77), // Same color as your main theme
        iconTheme: IconThemeData(color: Colors.white), // Make the back button icon black if needed
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('Profile'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to profile screen
                },
              ),
              ListTile(
                title: Text('Change Password'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to change password screen
                },
              ),
              SizedBox(height: 20),
              Text(
                'Preferences',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              SwitchListTile(
                title: Text('Dark Mode'),
                value: false, // You can bind this to a state variable
                onChanged: (bool value) {
                  // Handle dark mode toggle
                },
              ),
              SwitchListTile(
                title: Text('Notifications'),
                value: true, // You can bind this to a state variable
                onChanged: (bool value) {
                  // Handle notifications toggle
                },
              ),
              SizedBox(height: 20),
              Text(
                'About',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('Terms of Service'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to terms of service
                },
              ),
              ListTile(
                title: Text('Privacy Policy'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to privacy policy
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle log out
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Change color to suit your theme
                  ),
                  child: Text('Log Out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
