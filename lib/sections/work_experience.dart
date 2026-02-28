import 'package:flutter/material.dart';

class ProfessionalExperienceSection extends StatelessWidget {
  const ProfessionalExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color primaryColor = const Color(0xff00d9ff); // اللون السماوي (Cyan)
    Color bgColor = isDarkMode ? const Color(0xff0f172a) : Colors.grey;
    Color cardColor = isDarkMode ? const Color(0xff1e293b) : Colors.white;
    Color textColor = isDarkMode ? Colors.white : Colors.black87;

    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          // العنوان الرئيسي
          RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, color: textColor),
              children: [
                const TextSpan(text: "Professional "),
                TextSpan(
                    text: "Experience", style: TextStyle(color: primaryColor)),
              ],
            ),
          ),
          const SizedBox(height: 60),

          // محتوى الخبرة والتعليم
          LayoutBuilder(builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 900;
            return Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // عمود الخبرة (Experience)
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(
                          "Experience", Icons.work_outline, textColor),
                      const SizedBox(height: 30),
                      _buildTimelineItem(
                        title: "Cross Platform Mobile App Developer",
                        organization:
                            "Digital Egypt Pioneers Initiative (DEPI)",
                        date: "11/2025 - Present",
                        description:
                            "• Developed cross-platform mobile apps using Flutter & Dart following Clean Architecture.\n• Implemented BLoC/Cubit state management and integrated REST APIs, Firebase, and Google Maps.",
                        primaryColor: primaryColor,
                        cardColor: cardColor,
                        textColor: textColor,
                      ),
                      _buildTimelineItem(
                        title: "Mobile App Development Intern",
                        organization:
                            "National Telecommunication Institute (NTI)",
                        date: "06/2025 - 08/2025",
                        description:
                            "• Participated in a 120-hour internship in mobile development with Flutter and Dart.\n• Worked on practical app development projects with backend integration and real-time updates.",
                        primaryColor: primaryColor,
                        cardColor: cardColor,
                        textColor: textColor,
                        isLast: true,
                      ),
                    ],
                  ),
                ),

                if (!isMobile) const SizedBox(width: 50),
                if (isMobile) const SizedBox(height: 50),

                // عمود التعليم (Education)
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(
                          "Education", Icons.school_outlined, textColor),
                      const SizedBox(height: 30),
                      _buildTimelineItem(
                        title: "B.Sc. Computer and Artificial Intelligence",
                        organization: "Beni-Suef University",
                        date: "2018 - 2022",
                        description:
                            "Major: Computer Science | Grade: Good\nFocus on Software Engineering and AI fundamentals.",
                        primaryColor: primaryColor,
                        cardColor: cardColor,
                        textColor: textColor,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon, Color textColor) {
    return Row(
      children: [
        Icon(icon, color: textColor, size: 28),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: textColor),
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String organization,
    required String date,
    required String description,
    required Color primaryColor,
    required Color cardColor,
    required Color textColor,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          // خط التايملاين والدوائر
          Column(
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: primaryColor.withOpacity(0.5), blurRadius: 8)
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: primaryColor.withOpacity(0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          // كارت التفاصيل
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: primaryColor.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: primaryColor, size: 16),
                      const SizedBox(width: 5),
                      Text(date,
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor)),
                  Text(organization,
                      style: TextStyle(
                          fontSize: 14, color: primaryColor.withOpacity(0.8))),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                        color: textColor.withOpacity(0.6), height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
