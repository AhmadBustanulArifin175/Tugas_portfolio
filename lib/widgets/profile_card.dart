import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCard extends StatelessWidget {
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Tidak dapat membuka URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12), // semi transparan
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/profile1.jpg"),
          ),
          SizedBox(height: 10),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "bustanul ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "arifin",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Data Analyst",
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.code, color: Colors.white),
                onPressed: () => _launchURL("https://github.com/bustanularifin"),
                tooltip: "GitHub",
              ),
              IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.pinkAccent),
                onPressed: () => _launchURL("https://instagram.com/pinboyyyy"),
                tooltip: "Instagram",
              ),
              IconButton(
                icon: Icon(Icons.business, color: Colors.blueAccent),
                onPressed: () => _launchURL("https://linkedin.com/in/bustanularifin"),
                tooltip: "LinkedIn",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
