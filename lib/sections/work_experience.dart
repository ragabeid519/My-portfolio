import 'package:flutter/material.dart';

class ProfessionalExperienceSection extends StatelessWidget {
  const ProfessionalExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = const Color(0xff00d9ff);
    final Color bgColor =
        isDarkMode ? const Color(0xff0f172a) : const Color(0xfff8fafc);
    final Color cardColor = isDarkMode ? const Color(0xff1e293b) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

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
                  "My background",
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
                      text: "Professional ",
                      style: TextStyle(color: textColor),
                    ),
                    TextSpan(
                      text: "Experience",
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  "My academic and practical journey in software engineering, mobile development, and hands-on Flutter training.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: subTextColor,
                    height: 1.7,
                  ),
                ),
              ),
              const SizedBox(height: 55),
              LayoutBuilder(
                builder: (context, constraints) {
                  final bool isMobile = constraints.maxWidth < 900;

                  if (isMobile) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildColumnTitle(
                          "Experience",
                          Icons.work_outline_rounded,
                          textColor,
                          primaryColor,
                        ),
                        const SizedBox(height: 28),
                        _buildTimelineItem(
                          title: "Cross Platform Mobile App Developer",
                          organization:
                              "Digital Egypt Pioneers Initiative (DEPI)",
                          date: "Nov 2025 - Present",
                          description:
                              "Develop cross-platform mobile applications using Flutter and Dart following Clean Architecture principles. Implement BLoC/Cubit state management and integrate REST APIs, Firebase, and Google Maps in practical development scenarios.",
                          primaryColor: primaryColor,
                          cardColor: cardColor,
                          textColor: textColor,
                          subTextColor: subTextColor,
                        ),
                        _buildTimelineItem(
                          title: "Mobile App Development Intern",
                          organization:
                              "National Telecommunication Institute (NTI)",
                          date: "Jun 2025 - Aug 2025",
                          description:
                              "Completed a 120-hour internship focused on mobile application development using Flutter and Dart. Built practical projects with backend integration and real-time updates while applying Clean Architecture and structured state management.",
                          primaryColor: primaryColor,
                          cardColor: cardColor,
                          textColor: textColor,
                          subTextColor: subTextColor,
                          isLast: true,
                        ),
                        const SizedBox(height: 45),
                        _buildColumnTitle(
                          "Education",
                          Icons.school_outlined,
                          textColor,
                          primaryColor,
                        ),
                        const SizedBox(height: 28),
                        _buildTimelineItem(
                          title: "B.Sc. Computer and Artificial Intelligence",
                          organization: "Beni-Suef University",
                          date: "2018 - 2022",
                          description:
                              "Major: Computer Science | Grade: Good. Built a strong foundation in software engineering, problem solving, and computer science fundamentals.",
                          primaryColor: primaryColor,
                          cardColor: cardColor,
                          textColor: textColor,
                          subTextColor: subTextColor,
                          isLast: true,
                        ),
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildColumnTitle(
                              "Experience",
                              Icons.work_outline_rounded,
                              textColor,
                              primaryColor,
                            ),
                            const SizedBox(height: 30),
                            _buildTimelineItem(
                              title: "Cross Platform Mobile App Developer",
                              organization:
                                  "Digital Egypt Pioneers Initiative (DEPI)",
                              date: "Nov 2025 - Present",
                              description:
                                  "Develop cross-platform mobile applications using Flutter and Dart following Clean Architecture principles. Implement BLoC/Cubit state management and integrate REST APIs, Firebase, and Google Maps in practical development scenarios.",
                              primaryColor: primaryColor,
                              cardColor: cardColor,
                              textColor: textColor,
                              subTextColor: subTextColor,
                            ),
                            _buildTimelineItem(
                              title: "Mobile App Development Intern",
                              organization:
                                  "National Telecommunication Institute (NTI)",
                              date: "Jun 2025 - Aug 2025",
                              description:
                                  "Completed a 120-hour internship focused on mobile application development using Flutter and Dart. Built practical projects with backend integration and real-time updates while applying Clean Architecture and structured state management.",
                              primaryColor: primaryColor,
                              cardColor: cardColor,
                              textColor: textColor,
                              subTextColor: subTextColor,
                              isLast: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildColumnTitle(
                              "Education",
                              Icons.school_outlined,
                              textColor,
                              primaryColor,
                            ),
                            const SizedBox(height: 30),
                            _buildTimelineItem(
                              title:
                                  "B.Sc. Computer and Artificial Intelligence",
                              organization: "Beni-Suef University",
                              date: "2018 - 2022",
                              description:
                                  "Major: Computer Science | Grade: Good. Built a strong foundation in software engineering, problem solving, and computer science fundamentals.",
                              primaryColor: primaryColor,
                              cardColor: cardColor,
                              textColor: textColor,
                              subTextColor: subTextColor,
                              isLast: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumnTitle(
    String title,
    IconData icon,
    Color textColor,
    Color primaryColor,
  ) {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: primaryColor,
            size: 22,
          ),
        ),
        const SizedBox(width: 14),
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
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
    required Color subTextColor,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.45),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: primaryColor.withOpacity(0.25),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 28),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: primaryColor.withOpacity(0.14),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: primaryColor,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          date,
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    organization,
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                      color: primaryColor.withOpacity(0.92),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    description,
                    style: TextStyle(
                      color: subTextColor,
                      fontSize: 14.5,
                      height: 1.7,
                    ),
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
