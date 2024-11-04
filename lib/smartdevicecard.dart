import 'package:flutter/material.dart';

class SmartDeviceCard extends StatefulWidget {
  final String deviceName;
  final IconData icon;
  final bool isActive;

  const SmartDeviceCard({
    required this.deviceName,
    required this.icon,
    required this.isActive,
  });

  @override
  _SmartDeviceCardState createState() => _SmartDeviceCardState();
}

class _SmartDeviceCardState extends State<SmartDeviceCard> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.blueAccent : Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isActive ? Colors.blue.withOpacity(0.4) : Colors.black45,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 40,
              color: isActive ? Colors.white : Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              widget.deviceName,
              style: TextStyle(
                fontSize: 16,
                color: isActive ? Colors.white : Colors.grey,
              ),
            ),
            const Spacer(),
            Switch(
              value: isActive,
              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
              },
              activeColor: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}