import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';
import 'project_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Stack(
        children: [
          // Gambar latar belakang full screen
          SizedBox.expand(
            child: Image.asset(
              'assets/images/bandara.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Overlay isi konten
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 ProfileCard(),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjectScreen()),
                    );
                  },
                  child: const Text('View Project'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
