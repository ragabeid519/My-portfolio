import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  // Future<void> openCV() async {
  //   const url = 'web/assets/Ragab_Eid_Sedik_Flutter_developer.pdf';
  //   final uri = Uri.parse(url);
  //   await launchUrl(uri);
  // }
  // Future<void> openCV() async {
  //   final uri = Uri.parse('/assets/Ragab_Eid_Sedik_Flutter_developer.pdf');
  //   if (!await launchUrl(
  //     uri,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw 'Could not launch CV';
  //   }
  // }

  Future<void> openCV() async {
    if (kIsWeb) {
      // ===== Flutter Web =====
      final uri = Uri.parse('/assets/Ragab_Eid_Sedik_Flutter_developer.pdf');
      await launchUrl(uri);
    } else {
      // ===== Android / iOS =====
      final uri = Uri.parse(
        // 'https://your-domain.com/assets/Ragab_Eid_Sedik_Flutter_developer.pdf',
        'https://boxwood-ray-479905-e5.web.app/assets/Ragab_Eid_Sedik_Flutter_developer.pdf',
      );
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch CV';
      }
    }
  }

// firebase deploy
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff4F46E5), Color(0xff9333EA)],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ===== صورة البروفايل =====
              Container(
                width: isMobile ? 180 : 260,
                height: isMobile ? 180 : 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('web/assets/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
              ),

              SizedBox(width: isMobile ? 0 : 60, height: isMobile ? 40 : 0),

              // ===== النص =====
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ragab Eid",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Flutter Developer",
                    style: TextStyle(fontSize: 22, color: Colors.white70),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "I build high-performance Flutter applications\nwith clean architecture and modern UI/UX.",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    onPressed: openCV,
                    child: const Text("Download CV"),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
