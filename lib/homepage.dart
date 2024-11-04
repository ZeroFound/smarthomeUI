import 'package:flutter/material.dart';
import 'package:smarthome_ui/smartdevicecard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.more_horiz, color: Colors.white),
          onPressed: () {
            _showMoreOptions(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent.shade700,
                  Colors.purple.shade700,
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Futuristic Overlay with Blur Effect
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                backgroundBlendMode: BlendMode.overlay,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Text(
                  'Welcome Home,',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                SizedBox(height: 4),
                Text(
                  'ZEROFOUND',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Smart Devices',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      SmartDeviceCard(
                        deviceName: 'Smart Light',
                        icon: Icons.lightbulb_outline,
                        isActive: false,
                      ),
                      SmartDeviceCard(
                        deviceName: 'Smart AC',
                        icon: Icons.ac_unit,
                        isActive: false,
                      ),
                      SmartDeviceCard(
                        deviceName: 'Smart TV',
                        icon: Icons.tv,
                        isActive: false,
                      ),
                      SmartDeviceCard(
                        deviceName: 'Smart Fan',
                        icon: Icons.toys,
                        isActive: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.brightness_6, color: Colors.white),
                title: Text('Change Theme', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Logic for changing theme can be added here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Logic for logout can be added here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Logic for opening settings can be added here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}