import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = const Color(0xff00d9ff);
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;
    final Color bgColor = isDarkMode ? const Color(0xff0f172a) : Colors.white;
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1250),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildGlowProfileImage(true, primaryColor),
                    const SizedBox(height: 40),
                    _buildTextContent(
                      isMobile,
                      primaryColor,
                      textColor,
                      subTextColor,
                      isDarkMode,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildGlowProfileImage(false, primaryColor),
                    const SizedBox(width: 80),
                    Expanded(
                      child: _buildTextContent(
                        isMobile,
                        primaryColor,
                        textColor,
                        subTextColor,
                        isDarkMode,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildTextContent(
    bool isMobile,
    Color primaryColor,
    Color textColor,
    Color subTextColor,
    bool isDarkMode,
  ) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: primaryColor.withOpacity(0.25),
            ),
          ),
          child: Text(
            "Get to know me",
            style: TextStyle(
              color: primaryColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 18),
        RichText(
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              height: 1.2,
            ),
            children: [
              TextSpan(
                text: "About ",
                style: TextStyle(color: textColor),
              ),
              TextSpan(
                text: "Me",
                style: TextStyle(color: primaryColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Flutter Developer | Software Engineer",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            "I am a passionate Flutter Developer with hands-on experience building scalable cross-platform applications using Clean Architecture, BLoC, and modern development practices. Through my training and real-world project work at DEPI and NTI, I have strengthened my ability to deliver clean, maintainable, and user-focused mobile solutions.",
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: 17,
              color: subTextColor,
              height: 1.8,
            ),
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            "My technical expertise includes RESTful APIs, Firebase, Supabase, state management, and performance optimization for mobile applications. I enjoy transforming ideas into reliable digital products that solve real-world problems and provide meaningful user experiences.",
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: 17,
              color: subTextColor,
              height: 1.8,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 14,
          runSpacing: 14,
          children: [
            _buildHighlightCard(
              icon: Icons.architecture_rounded,
              title: "Clean Architecture",
              primaryColor: primaryColor,
              isDarkMode: isDarkMode,
              textColor: textColor,
            ),
            _buildHighlightCard(
              icon: Icons.code_rounded,
              title: "BLoC & State Management",
              primaryColor: primaryColor,
              isDarkMode: isDarkMode,
              textColor: textColor,
            ),
            _buildHighlightCard(
              icon: Icons.cloud_done_rounded,
              title: "API & Backend Integration",
              primaryColor: primaryColor,
              isDarkMode: isDarkMode,
              textColor: textColor,
            ),
            _buildHighlightCard(
              icon: Icons.phone_android_rounded,
              title: "Cross-Platform Apps",
              primaryColor: primaryColor,
              isDarkMode: isDarkMode,
              textColor: textColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHighlightCard({
    required IconData icon,
    required String title,
    required Color primaryColor,
    required bool isDarkMode,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xff111c2f) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryColor.withOpacity(0.18),
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.06),
            blurRadius: 18,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlowProfileImage(bool isMobile, Color primaryColor) {
    final double width = isMobile ? 280 : 400;
    final double height = isMobile ? 340 : 470;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: primaryColor.withOpacity(0.75),
          width: 2.5,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.28),
            blurRadius: 45,
            spreadRadius: 6,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'web/assets/profile.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
