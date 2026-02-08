import 'package:flutter/material.dart';

class FinalThoughtsSection extends StatelessWidget {
  const FinalThoughtsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          // color: const Color(0xFFFDF9F0), // نفس لون الخلفية الموحد
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Final Thoughts: Be Genuine & Passionate',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Serif',
                  // color: Color(0xFF4E342E),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              // استخدام Flex للتبديل بين Row و Column بناءً على المساحة
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // قسم النصوص
                  Expanded(
                    flex: isMobile ? 0 : 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _ThoughtParagraph(
                          text:
                              'My journey as a Flutter developer is driven by a genuine passion for creating exceptional mobile experiences. I believe in writing clean, maintainable code and building applications that solve real-world problems.',
                        ),
                        _ThoughtParagraph(
                          text:
                              "I'm committed to continuous learning and staying updated with the latest technologies and best practices in mobile development. Every challenge I face is an opportunity to grow and improve my skills.",
                        ),
                        _ThoughtParagraph(
                          text:
                              "I'm excited to collaborate with teams and clients who share my vision for innovation and excellence. Let's build something amazing together!",
                        ),
                        _ThoughtParagraph(
                          text:
                              "Feel free to reach out through any of the contact methods below. I'm always open to discussing new projects, opportunities, and ideas.",
                        ),
                      ],
                    ),
                  ),
                  if (!isMobile) const SizedBox(width: 50),
                  if (isMobile) const SizedBox(height: 30),
                  // قسم الصورة
                  Expanded(
                    flex: isMobile ? 0 : 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'web/assets/profile.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ThoughtParagraph extends StatelessWidget {
  final String text;
  const _ThoughtParagraph({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          // color: Color(0xFF6D4C41),
          height: 1.6,
        ),
      ),
    );
  }
}
