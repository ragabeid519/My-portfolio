import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color primaryColor = const Color(0xff00d9ff);
    Color cardColor = isDarkMode ? const Color(0xff1e293b) : Colors.white;
    Color textColor = isDarkMode ? Colors.white : Colors.black87;

    // قائمة المهارات بناءً على الـ CV الخاص بك
    final List<Map<String, dynamic>> skills = [
      {
        "title": "Mobile Development",
        "icon": FontAwesomeIcons.mobileScreenButton,
        "subtitle": "Flutter, Dart, Cross-platform, Responsive Design",
      },
      {
        "title": "State Management",
        "icon": FontAwesomeIcons.layerGroup,
        "subtitle": "BLoC, Provider, Riverpod, Cubit",
      },
      {
        "title": "Architecture",
        "icon": FontAwesomeIcons.gears,
        "subtitle":
            "Clean Architecture, MVVM, SOLID Principles, Design Patterns",
      },
      {
        "title": "Backend Integration",
        "icon": FontAwesomeIcons.database,
        "subtitle": "RESTful APIs, Firebase, Odoo ERP, Payment Gateways",
      },
      {
        "title": "Tools",
        "icon": FontAwesomeIcons.wrench,
        "subtitle": "Android Studio, Git/GitHub, Postman, Figma, Adobe XD",
      },
      {
        "title": "Database",
        "icon": FontAwesomeIcons.server,
        "subtitle": "Firestore, Hive, SQLite, Shared Preferences",
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: isDarkMode ? const Color(0xff0f172a) : Colors.grey[100],
      child: Column(
        children: [
          Text(
            "My Skills",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 50),

          // شبكة المهارات المتجاوبة
          LayoutBuilder(builder: (context, constraints) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: skills.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth < 600
                    ? 1
                    : (constraints.maxWidth < 1000 ? 2 : 3),
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                return _buildSkillCard(
                  skills[index]['title'],
                  skills[index]['subtitle'],
                  skills[index]['icon'],
                  primaryColor,
                  cardColor,
                  textColor,
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String title, String subtitle, IconData icon,
      Color primaryColor, Color cardColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: primaryColor.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: primaryColor, size: 40),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor.withOpacity(0.7), fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }
}
