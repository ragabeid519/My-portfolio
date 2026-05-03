import 'package:flutter/material.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = const Color(0xff00d9ff);
    final Color bgColor =
        isDarkMode ? const Color(0xff0f172a) : const Color(0xfff8fafc);
    final Color cardColor = isDarkMode ? const Color(0xff1e293b) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    final List<Map<String, dynamic>> achievements = [
      {
        "icon": Icons.workspace_premium_outlined,
        "title": "DEPI Flutter Training",
        "description":
            "Selected for the Digital Egypt Pioneers Initiative (DEPI), where I strengthened my practical experience in Flutter, Clean Architecture, state management, and real-world app development workflows.",
      },
      {
        "icon": Icons.school_outlined,
        "title": "NTI Mobile Development Internship",
        "description":
            "Completed a 120-hour internship at the National Telecommunication Institute (NTI), gaining hands-on experience in Flutter development, backend integration, and real-time mobile application features.",
      },
      {
        "icon": Icons.rocket_launch_outlined,
        "title": "Real-World Flutter Projects",
        "description":
            "Built multiple practical Flutter applications including educational systems, location-based solutions, productivity tools, and API-integrated apps with a focus on performance and usability.",
      },
      {
        "icon": Icons.architecture_outlined,
        "title": "Strong Engineering Practices",
        "description":
            "Applied Clean Architecture, SOLID principles, and structured state management patterns such as BLoC, Provider, and GetX across different projects to improve maintainability and scalability.",
      },
      {
        "icon": Icons.cloud_done_outlined,
        "title": "Backend & Service Integration",
        "description":
            "Integrated Firebase, Supabase, REST APIs, local storage, notifications, and geolocation services into cross-platform apps to solve practical product requirements.",
      },
      {
        "icon": Icons.person_search_outlined,
        "title": "Portfolio & Continuous Growth",
        "description":
            "Built a professional portfolio showcasing selected projects and continuously improved technical presentation, project quality, and personal branding as a Flutter Developer.",
      },
    ];

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: primaryColor.withOpacity(0.25),
                  ),
                ),
                child: Text(
                  "Professional Highlights",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  children: [
                    TextSpan(
                      text: "Professional Highlights & ",
                      style: TextStyle(color: textColor),
                    ),
                    TextSpan(
                      text: "Milestones",
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  "A snapshot of the training, project work, and technical progress that shaped my journey as a Flutter Developer.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: subTextColor,
                    height: 1.7,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 3;
                  double childAspectRatio = 1.18;

                  if (constraints.maxWidth < 700) {
                    crossAxisCount = 1;
                    childAspectRatio = 1.45;
                  } else if (constraints.maxWidth < 1050) {
                    crossAxisCount = 2;
                    childAspectRatio = 1.28;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: achievements.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      return AchievementCard(
                        icon: achievements[index]['icon'],
                        title: achievements[index]['title'],
                        description: achievements[index]['description'],
                        primaryColor: primaryColor,
                        cardColor: cardColor,
                        textColor: textColor,
                        subTextColor: subTextColor,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color primaryColor;
  final Color cardColor;
  final Color textColor;
  final Color subTextColor;

  const AchievementCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.primaryColor,
    required this.cardColor,
    required this.textColor,
    required this.subTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: primaryColor.withOpacity(0.16),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.05),
            blurRadius: 18,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 26,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 14.5,
              color: subTextColor,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
