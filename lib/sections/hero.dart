import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  // دالة لفتح الروابط الخارجية
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(uri);
    }
  }

  Future<void> openCV() async {
    final String url = kIsWeb
        ? 'https://drive.google.com/file/d/1Rmf16LwqKEWnPx3NXvaX9Ftfy663Lwzo/view?usp=drive_link'
        : 'https://drive.google.com/file/d/1Rmf16LwqKEWnPx3NXvaX9Ftfy663Lwzo/view?usp=drive_link';

    _launchURL(url);
  }

  @override
  Widget build(BuildContext context) {
    // التحقق من وضع الثيم الحالي (داكن أم فاتح)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color primaryColor =
        const Color(0xff00d9ff); // اللون السماوي المميز في الصورة والفيديو
    Color textColor = isDarkMode ? Colors.white : Colors.black87;
    Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xff0f172a) : Colors.grey[50],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 900;

          return Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isMobile) _buildProfileImage(isMobile, primaryColor),
              if (isMobile) const SizedBox(height: 40),
              Expanded(
                flex: isMobile ? 0 : 0,
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, It's Me",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Ragab Eid",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 56,
                          fontWeight: FontWeight.bold),
                    ),

                    // تأثير الكتابة المتحركةو
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: isMobile
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.start,
                        children: [
                          Text("And I'm a ",
                              style: TextStyle(color: textColor, fontSize: 24)),
                          DefaultTextStyle(
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                TypewriterAnimatedText('Flutter Developer',
                                    speed: const Duration(milliseconds: 100)),
                                TypewriterAnimatedText('Mobile App Expert',
                                    speed: const Duration(milliseconds: 100)),
                                TypewriterAnimatedText('Software Engineer',
                                    speed: const Duration(milliseconds: 100)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "I build scalable Flutter applications with Clean Architecture,    \nBLoC, and seamless API integrations.     ",
                      textAlign: isMobile ? TextAlign.start : TextAlign.start,
                      style: TextStyle(
                          color: subTextColor, fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 30),

                    // أيقونات التواصل الاجتماعي
                    Row(
                      mainAxisAlignment: isMobile
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.start,
                      children: [
                        _socialIcon(
                            Icons.link,
                            "https://www.linkedin.com/in/ragabeid/",
                            primaryColor),
                        const SizedBox(width: 15),
                        _socialIcon(Icons.code,
                            "https://github.com/ragabeid519", primaryColor),
                        const SizedBox(width: 15),
                        _socialIcon(
                            Icons.email,
                            // "mailto:ragabeid5111999@gmail.com", primaryColor),
                            // to open email client with pre-filled email address
                            "mailto:ragabeid5111999@gmail.com?subject=Hello Ragab Eid&body=I would like to connect with you",
                            primaryColor),
                      ],
                    ),
                    const SizedBox(height: 40),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 10,
                        shadowColor: primaryColor.withOpacity(0.5),
                      ),
                      onPressed: openCV,
                      child: const Text("Download CV",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              if (!isMobile) _buildProfileImage(isMobile, primaryColor),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileImage(bool isMobile, Color primaryColor) {
    return Container(
      width: isMobile ? 250 : 380,
      height: isMobile ? 250 : 380,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primaryColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 50,
            spreadRadius: 5,
          )
        ],
        image: const DecorationImage(
          image: AssetImage('web/assets/profile.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, String url, Color primaryColor) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: primaryColor, width: 2),
        ),
        child: Icon(icon, color: primaryColor, size: 28),
      ),
    );
  }
}
