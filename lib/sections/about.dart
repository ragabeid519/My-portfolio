import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "About Me",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const CircleAvatar(
            radius: 70, // يمكنك تغيير حجم الصورة هنا
            backgroundImage: AssetImage(
              'web/assets/profile.jpg',
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 800,
            child: const Text(
              "I'm Ragab Eid, a Flutter Developer passionate about building mobile applications that solve real-world problems and provide excellent user experiences.",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "My Development Philosophy:",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const SizedBox(
            width: 800,
            child: Text(
              "I believe in writing clean, efficient code and creating intuitive mobile applications. My focus is on understanding user needs and implementing solutions that are both functional and user-friendly.",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
