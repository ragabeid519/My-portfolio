import 'package:flutter/material.dart';

class FinalThoughtsSection extends StatelessWidget {
  const FinalThoughtsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = const Color(0xff00d9ff);
    final Color bgColor =
        isDarkMode ? const Color(0xff0f172a) : const Color(0xfff8fafc);
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;

        return Container(
          width: double.infinity,
          color: bgColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1250),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildImage(primaryColor),
                        const SizedBox(height: 35),
                        _buildTextContent(
                          isMobile: true,
                          primaryColor: primaryColor,
                          textColor: textColor,
                          subTextColor: subTextColor,
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _buildTextContent(
                            isMobile: false,
                            primaryColor: primaryColor,
                            textColor: textColor,
                            subTextColor: subTextColor,
                          ),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          flex: 2,
                          child: _buildImage(primaryColor),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextContent({
    required bool isMobile,
    required Color primaryColor,
    required Color textColor,
    required Color subTextColor,
  }) {
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
            "Final note",
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
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              height: 1.2,
            ),
            children: [
              TextSpan(
                text: "Let’s Build Something ",
                style: TextStyle(color: textColor),
              ),
              TextSpan(
                text: "Meaningful",
                style: TextStyle(color: primaryColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            "As a Flutter Developer, I’m passionate about building clean, scalable, and user-focused applications that solve real-world problems. I believe strong software is not only about writing code, but also about creating products that are reliable, maintainable, and valuable to users.",
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
            "I’m continuously learning, improving, and exploring better ways to deliver high-quality mobile experiences using Flutter, strong architecture, and modern development practices. I’m always open to meaningful opportunities, collaboration, and impactful projects.",
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: 17,
              color: subTextColor,
              height: 1.8,
            ),
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildTag("Flutter", primaryColor, textColor),
            _buildTag("Clean Architecture", primaryColor, textColor),
            _buildTag("Scalable Apps", primaryColor, textColor),
            _buildTag("Real-World Solutions", primaryColor, textColor),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(String label, Color primaryColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: primaryColor.withOpacity(0.22),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildImage(Color primaryColor) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: primaryColor.withOpacity(0.35),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.10),
            blurRadius: 24,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: AspectRatio(
          aspectRatio: 0.9,
          child: Image.asset(
            'web/assets/profile.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
