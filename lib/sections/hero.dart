import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// ✅ import الملف الجديد

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  static const String _cvUrl =
      'https://drive.google.com/file/d/1Rmf16LwqKEWnPx3NXvaX9Ftfy663Lwzo/view?usp=drive_link';
  static const String _linkedinUrl = 'https://www.linkedin.com/in/ragabeid/';
  static const String _githubUrl = 'https://github.com/ragabeid519';
  static const String _whatsappUrl = 'https://wa.me/201128792749';
  static const String _email = 'ragabeid5111999@gmail.com';

  // ✅ دالة للروابط العادية
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

// ✅ فتح Gmail مباشرة في المتصفح
  void _launchEmail() {
    _launchURL(
      'https://mail.google.com/mail/?view=cm&fs=1&to=ragabeid5111999@gmail.com&su=Hello Ragab Eid&body=I would like to connect with you',
    );
  }

  Future<void> openCV() async {
    _launchURL(_cvUrl);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color primaryColor = const Color(0xff00d9ff);
    Color textColor = isDarkMode ? Colors.white : Colors.black87;
    Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
              ? [const Color(0xff0f172a), const Color(0xff1e293b)]
              : [Colors.grey[50]!, Colors.white],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 900;

          Widget textContent = Column(
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: primaryColor.withOpacity(0.3), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.6),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Available for Work",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Hello, It's Me 👋",
                style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),
              const SizedBox(height: 8),
              Text(
                "Ragab Eid",
                style: TextStyle(
                  color: textColor,
                  fontSize: isMobile ? 42 : 60,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: isMobile
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    Text(
                      "And I'm a ",
                      style: TextStyle(color: textColor, fontSize: 22),
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 22,
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
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 550),
                child: Text(
                  "Software Engineer specialized in building high-performance, scalable Flutter applications using Clean Architecture, BLoC, and seamless API integrations to deliver real-world mobile solutions.",
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style:
                      TextStyle(color: subTextColor, fontSize: 16, height: 1.6),
                ),
              ),
              const SizedBox(height: 30),
              _buildStatsRow(isMobile, primaryColor, textColor, subTextColor),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: isMobile
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  _socialIcon(Icons.link, () => _launchURL(_linkedinUrl),
                      primaryColor, "LinkedIn"),
                  const SizedBox(width: 15),
                  _socialIcon(Icons.code, () => _launchURL(_githubUrl),
                      primaryColor, "GitHub"),
                  const SizedBox(width: 15),
                  _socialIcon(Icons.email_outlined, _launchEmail, primaryColor,
                      "Email"),
                  const SizedBox(width: 15),
                  _socialIcon(Icons.chat_bubble_outline,
                      () => _launchURL(_whatsappUrl), primaryColor, "WhatsApp"),
                ],
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment:
                    isMobile ? WrapAlignment.center : WrapAlignment.start,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 10,
                      shadowColor: primaryColor.withOpacity(0.5),
                    ),
                    onPressed: openCV,
                    icon: const Icon(Icons.download_rounded, size: 20),
                    label: const Text("Download CV",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: BorderSide(color: primaryColor, width: 2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _launchEmail,
                    icon: const Icon(Icons.send_rounded, size: 20),
                    label: const Text("Hire Me",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ],
          );

          if (isMobile) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildProfileImage(true, primaryColor),
                const SizedBox(height: 40),
                textContent,
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: textContent),
              const SizedBox(width: 50),
              _buildProfileImage(false, primaryColor),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatsRow(
      bool isMobile, Color primaryColor, Color textColor, Color subTextColor) {
    return Wrap(
      spacing: 30,
      runSpacing: 15,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        _statCard("10+", "Projects", primaryColor, textColor, subTextColor),
        _verticalDivider(subTextColor),
        _statCard(
            "1+", "Years Experience", primaryColor, textColor, subTextColor),
        _verticalDivider(subTextColor),
        _statCard("5+", "Technologies", primaryColor, textColor, subTextColor),
      ],
    );
  }

  Widget _statCard(String number, String label, Color primaryColor,
      Color textColor, Color subTextColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(number,
            style: TextStyle(
                color: primaryColor,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: subTextColor, fontSize: 13)),
      ],
    );
  }

  Widget _verticalDivider(Color color) {
    return Container(width: 1, height: 35, color: color.withOpacity(0.3));
  }

  Widget _buildProfileImage(bool isMobile, Color primaryColor) {
    return Container(
      width: isMobile ? 250 : 380,
      height: isMobile ? 250 : 380,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primaryColor, width: 3),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.4),
            blurRadius: 60,
            spreadRadius: 8,
          )
        ],
        image: const DecorationImage(
          image: AssetImage('web/assets/profile.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _socialIcon(
      IconData icon, VoidCallback onTap, Color primaryColor, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: 2),
          ),
          child: Icon(icon, color: primaryColor, size: 24),
        ),
      ),
    );
  }
}
