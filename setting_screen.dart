import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _ArtisanSettingsScreenState createState() => _ArtisanSettingsScreenState();
}

class _ArtisanSettingsScreenState extends State<SettingsScreen> {
  bool _emailNotifications = true;
  bool _smsNotifications = true;
  bool _pushNotifications = true;
  bool _twoFactorAuthentication = false;
  bool _visibility = true;
  bool _publicProfileInformation = true;
  bool _reviews = true;

  // Add your logout implementation here
  void _logout() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        titleTextStyle: const TextStyle(color: Colors.black),
        title: Text('Artisan Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          // Personal Information
          Text(
            'Personal Information',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone number'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Address'),
          ),

          SizedBox(height: 16),

          // Business Information
          Text(
            'Business Information',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Business name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Business description'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Business category'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Business location'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Business hours'),
          ),

          SizedBox(height: 16),

          // Notification Settings
          Text(
            'Notification Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: Text('Email notifications'),
            value: _emailNotifications,
            onChanged: (bool value) {
              setState(() {
                _emailNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('SMS notifications'),
            value: _smsNotifications,
            onChanged: (bool value) {
              setState(() {
                _smsNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Push notifications'),
            value: _pushNotifications,
            onChanged: (bool value) {
              setState(() {
                _pushNotifications = value;
              });
            },
          ),

          SizedBox(height: 16),

          // Security Settings
          Text(
            'Security Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Change password'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Add your change password implementation here
            },
          ),
          SwitchListTile(
            title: Text('Two-factor authentication'),
            value: _twoFactorAuthentication,
            onChanged: (bool value) {
              setState(() {
                _twoFactorAuthentication = value;
              });
            },
          ),

          SizedBox(height: 16),

          // Payment Settings
          Text(
            'Payment Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Payment method'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
// Add your payment method implementation here
            },
          ),
          ListTile(
            title: Text('Bank account details'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
// Add your bank account details implementation here
            },
          ),

          SizedBox(height: 16),

          // Privacy Settings
          Text(
            'Privacy Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: Text('Visibility'),
            value: _visibility,
            onChanged: (bool value) {
              setState(() {
                _visibility = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Public profile information'),
            value: _publicProfileInformation,
            onChanged: (bool value) {
              setState(() {
                _publicProfileInformation = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Reviews'),
            value: _reviews,
            onChanged: (bool value) {
              setState(() {
                _reviews = value;
              });
            },
          ),

          SizedBox(height: 16),

          // Help & Support
          Text(
            'Help & Support',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('FAQ'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Add your FAQ implementation here
            },
          ),
          ListTile(
            title: Text('Contact support'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Add your contact support implementation here
            },
          ),

          SizedBox(height: 32),

          // Logout button
          ElevatedButton(
            onPressed: _logout,
            child: Text('Logout'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.yellow[600],
        // unselectedItemColor:
        //     Colors.black, // <-- set the unselected item color here
        // onTap: _onItemTapped,
      ),
    );
  }
}
