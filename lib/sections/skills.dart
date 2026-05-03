import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = const Color(0xff00d9ff);
    final Color bgColor =
        isDarkMode ? const Color(0xff111827) : const Color(0xfff8fafc);
    final Color cardColor = isDarkMode ? const Color(0xff1e293b) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    final List<Map<String, dynamic>> skills = [
      {
        "title": "Mobile Development",
        "icon": FontAwesomeIcons.mobileScreenButton,
        "subtitle":
            "Flutter, Dart, Cross-platform Development, Responsive UI, User-focused App Design",
      },
      {
        "title": "Architecture",
        "icon": FontAwesomeIcons.sitemap,
        "subtitle":
            "Clean Architecture, MVVM, SOLID Principles, Design Patterns, Scalable Code Structure",
      },
      {
        "title": "State Management",
        "icon": FontAwesomeIcons.layerGroup,
        "subtitle": "BLoC, Cubit, Provider, GetX, Reactive UI Updates",
      },
      {
        "title": "Backend & APIs",
        "icon": FontAwesomeIcons.server,
        "subtitle":
            "RESTful APIs, Firebase, Supabase, Authentication, Cloud Integration",
      },
      {
        "title": "Local Storage",
        "icon": FontAwesomeIcons.database,
        "subtitle":
            "Hive, SQLite, Shared Preferences, Flutter Secure Storage, GetStorage",
      },
      {
        "title": "Maps & Notifications",
        "icon": FontAwesomeIcons.locationDot,
        "subtitle":
            "Google Maps, Geolocator, Geocoding, Awesome Notifications, Connectivity Plus",
      },
    ];

    final List<String> techChips = [
      "Flutter",
      "Dart",
      "Firebase",
      "Supabase",
      "GetX",
      "BLoC",
      "Hive",
      "SQLite",
      "Geolocator",
      "Notifications",
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
                  "What I work with",
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
                      text: "My ",
                      style: TextStyle(color: textColor),
                    ),
                    TextSpan(
                      text: "Skills",
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  "A focused technical stack I use to build scalable, maintainable, and real-world Flutter applications with strong architecture and smooth user experiences.",
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
                  double childAspectRatio = 1.32;

                  if (constraints.maxWidth < 650) {
                    crossAxisCount = 1;
                    childAspectRatio = 1.45;
                  } else if (constraints.maxWidth < 1000) {
                    crossAxisCount = 2;
                    childAspectRatio = 1.35;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: skills.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      return _buildSkillCard(
                        title: skills[index]['title'],
                        subtitle: skills[index]['subtitle'],
                        icon: skills[index]['icon'],
                        primaryColor: primaryColor,
                        cardColor: cardColor,
                        textColor: textColor,
                        subTextColor: subTextColor,
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 40),

              // ===== Tech Chips =====
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Core Technologies",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: techChips.map((tech) {
                  return _buildTechChip(
                    label: tech,
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                    textColor: textColor,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color primaryColor,
    required Color cardColor,
    required Color textColor,
    required Color subTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: primaryColor.withOpacity(0.18),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.06),
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
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: TextStyle(
              color: subTextColor,
              fontSize: 14.5,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechChip({
    required String label,
    required Color primaryColor,
    required bool isDarkMode,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isDarkMode
            ? primaryColor.withOpacity(0.10)
            : primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: primaryColor.withOpacity(0.28),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 13.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
