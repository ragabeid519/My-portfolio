import 'package:flutter/material.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Work Experience",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                  color: colors.onBackground,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "My professional journey is marked by a dedication to crafting robust and intuitive mobile experiences.",
                style: TextStyle(
                  fontSize: 16,
                  color: colors.onBackground.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 60),

              /// Timeline
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;

                  return Column(
                    children: [
                      _TimelineItem(
                        isLeft: !isMobile,
                        isMobile: isMobile,
                        title: "Software Engineer & Flutter Developer",
                        company: "TechInnovate Solutions",
                        date: "June 2022 – Present",
                        points: const [
                          "Led end-to-end development of high-performance Flutter applications.",
                          "Implemented efficient state management using BLoC and Provider.",
                          "Collaborated with cross-functional teams to define requirements.",
                          "Achieved a 20% reduction in app load times.",
                        ],
                      ),
                      const SizedBox(height: 40),
                      _TimelineItem(
                        isLeft: false,
                        isMobile: isMobile,
                        title: "Junior Flutter Developer",
                        company: "MobileCraft Studios",
                        date: "January 2021 – May 2022",
                        points: const [
                          "Contributed to development and maintenance of key mobile features.",
                          "Assisted in bug identification, debugging, and resolution.",
                          "Gained hands-on experience with Firebase services.",
                          "Participated in daily stand-ups and agile sprint cycles.",
                        ],
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
}

// ======================================================

class _TimelineItem extends StatelessWidget {
  final bool isLeft;
  final bool isMobile;
  final String title;
  final String company;
  final String date;
  final List<String> points;

  const _TimelineItem({
    required this.isLeft,
    required this.isMobile,
    required this.title,
    required this.company,
    required this.date,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMobile && isLeft) Expanded(child: _buildCard(context)),

        /// Timeline Line & Dot
        Column(
          children: [
            Container(
              width: 2,
              height: 120,
              color: colors.primary.withOpacity(0.3),
            ),
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: colors.primary,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: 120,
              color: colors.primary.withOpacity(0.3),
            ),
          ],
        ),

        if (isMobile || !isLeft)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: _buildCard(context),
            ),
          ),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.15),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            company,
            style: TextStyle(
              fontSize: 15,
              color: colors.primary,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              date,
              style: TextStyle(
                fontSize: 12,
                color: colors.onSurface.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...points.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• ",
                    style: TextStyle(color: colors.primary),
                  ),
                  Expanded(
                    child: Text(
                      p,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: colors.onSurface.withOpacity(0.85),
                      ),
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
