import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = const Color(0xff00d9ff);
    final Color bgColor =
        isDarkMode ? const Color(0xff111827) : const Color(0xfff8fafc);
    final Color cardColor = isDarkMode ? const Color(0xff1e293b) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    final List<Map<String, dynamic>> services = [
      {
        "title": "Custom Flutter App Development",
        "description":
            "Building cross-platform mobile applications from idea to deployment with clean, scalable, and maintainable Flutter code.",
        "icon": Icons.phone_iphone_rounded,
      },
      {
        "title": "UI Implementation & Responsive Design",
        "description":
            "Transforming app designs into smooth, responsive, and user-friendly interfaces that work well across different screen sizes.",
        "icon": Icons.design_services_outlined,
      },
      {
        "title": "Backend & API Integration",
        "description":
            "Integrating REST APIs, Firebase, and Supabase services including authentication, cloud data handling, and real-time features.",
        "icon": Icons.cloud_sync_outlined,
      },
      {
        "title": "State Management & App Architecture",
        "description":
            "Structuring applications using Clean Architecture and managing app state efficiently with BLoC, Provider, and GetX.",
        "icon": Icons.account_tree_outlined,
      },
      {
        "title": "Performance Optimization & Bug Fixing",
        "description":
            "Improving app performance, fixing issues, reducing complexity, and enhancing reliability for smoother user experiences.",
        "icon": Icons.speed_rounded,
      },
      {
        "title": "Maintenance & Feature Enhancement",
        "description":
            "Maintaining existing Flutter apps, refining old features, and adding new capabilities while preserving code quality and stability.",
        "icon": Icons.build_circle_outlined,
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
                  "What I can deliver",
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
                      text: "What I Build & ",
                      style: TextStyle(color: textColor),
                    ),
                    TextSpan(
                      text: "How I Contribute",
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  "A focused set of Flutter development services aimed at building reliable, scalable, and user-centered mobile applications.",
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
                  double childAspectRatio = 1.15;

                  if (constraints.maxWidth < 700) {
                    crossAxisCount = 1;
                    childAspectRatio = 1.45;
                  } else if (constraints.maxWidth < 1050) {
                    crossAxisCount = 2;
                    childAspectRatio = 1.20;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: services.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      return _buildServiceCard(
                        service: services[index],
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

  Widget _buildServiceCard({
    required Map<String, dynamic> service,
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
              service['icon'],
              color: primaryColor,
              size: 26,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            service['title'],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            service['description'],
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
