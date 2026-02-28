import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    // إعدادات الألوان بناءً على الثيم
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color primaryColor =
        const Color(0xff00d9ff); // اللون السماوي المتوهج في الصورة
    Color textColor = isDarkMode ? Colors.white : Colors.black87;
    Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;
    Color bgColor = isDarkMode ? const Color(0xff0f172a) : Colors.white;

    return Container(
      color: bgColor,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 900;

          return Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. صورة البروفايل المتوهجة (على اليسار في الويب)
              _buildGlowProfileImage(isMobile, primaryColor),

              SizedBox(width: isMobile ? 0 : 80, height: isMobile ? 50 : 0),

              // 2. محتوى النصوص (على اليمين في الويب)
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                        children: [
                          TextSpan(
                              text: "About ",
                              style: TextStyle(color: textColor)),
                          TextSpan(
                              text: "Me",
                              style: TextStyle(color: primaryColor)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'I am a passionate Flutter Developer. I have a proven track record of building scalable cross-platform applications with Clean Architecture, BLoC, and Riverpod. Through my experience at DEPI and NTI, I have mastered integrating complex features like real-time updates and ensuring code scalability.',
                      textAlign: isMobile ? TextAlign.start : TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        color: subTextColor,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'My technical expertise includes RESTful APIs, Firebase, and optimizing performance for both mobile and web. I focus on building robust solutions that solve real-world problems.',
                      textAlign: isMobile ? TextAlign.start : TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        color: subTextColor,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ويلجت الصورة الدائرية مع تأثير التوهج الأزرق المحيط بها
  Widget _buildGlowProfileImage(bool isMobile, Color primaryColor) {
    double size = isMobile ? 280 : 400;
    return Container(
      width: size,
      height: size / 1.5, // لجعلها بيضاوية قليلاً كما في الصورة
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.elliptical(size, size / 1.5)),
        border: Border.all(color: primaryColor.withOpacity(0.8), width: 3),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.4),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.elliptical(size, size / 1.5)),
        child: Image.asset(
          'web/assets/profile.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
