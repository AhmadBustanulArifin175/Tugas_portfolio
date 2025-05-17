import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';
import 'profile_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/bandara.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content (dibungkus dengan Container agar bisa beri warna overlay)
          Container(
            color: Colors.black.withOpacity(0.5), // Optional: overlay gelap
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Portfolio',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Supaya terlihat di atas background
                    ),
                  ),
                  const SizedBox(height: 20),
                  ProfileCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
