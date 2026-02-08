import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  int getCrossAxisCount(double width) {
    if (width > 1200) return 3;
    if (width > 800) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "title": "PROGRAMMING LANGUAGES",
        "icon": Icons.code,
        "skills": ["Dart", "Java", "Kotlin"],
      },
      {
        "title": "MOBILE DEVELOPMENT",
        "icon": Icons.phone_android,
        "skills": ["Flutter", "Firebase", "REST APIs"],
      },
      {
        "title": "TOOLS & TECHNOLOGIES",
        "icon": Icons.settings,
        "skills": ["Git", "Android Studio", "VS Code"],
      },
      {
        "title": "OTHER SKILLS",
        "icon": Icons.lightbulb_outline,
        "skills": ["UI/UX Principles", "State Management", "Database Design"],
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Technical Skills",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Technologies & tools I use to build scalable applications",
                style: TextStyle(
                  fontSize: 16,
                  // color: Colors.grey,
                ),
              ),
              const SizedBox(height: 50),
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(constraints.maxWidth),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: 240,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final item = categories[index];
                      return SkillCard(
                        title: item['title'] as String,
                        icon: item['icon'] as IconData,
                        skills: List<String>.from(item['skills'] as List),
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

// =================== Skill Card ===================

class SkillCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> skills;

  const SkillCard({
    super.key,
    required this.title,
    required this.icon,
    required this.skills,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: isHover
            ? (Matrix4.identity()..translate(0, -8))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: isHover ? Colors.black12 : Colors.black.withOpacity(0.06),
              blurRadius: 25,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(widget.icon, color: Colors.brown, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              ...widget.skills.map(
                (skill) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "• $skill",
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
