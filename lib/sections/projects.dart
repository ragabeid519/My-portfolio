import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ragab_portfolio/providers/theme_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = [
      {
        "title": "Murshid App",
        "description":
            "A smart educational mobile application built to streamline lecture and course management for both professors and students through one integrated, user-friendly experience.",
        "image": "web/assets/murshid_app.png",
        "technologies":
            "Flutter, Dart, Supabase, GetX, Awesome Notifications, Geolocator, Geocoding, Connectivity Plus, GetStorage",
        "keyFeatures":
            "Role-based authentication, course and schedule management, real-time notifications, geolocation-based attendance tracking, Arabic/English support, and offline access.",
        "impact":
            "Built to solve real academic workflow challenges while showcasing backend integration, location services, local persistence, and production-oriented Flutter development skills.",
        "github": "https://github.com/ragabeid519/murshid_app",
        "demo":
            "https://github.com/ragabeid519/murshid_app/raw/master/assets/videos/murshid_app_video.mp4",
        "featured": true,
      },
      {
        "title": "AI-Powered Translator App",
        "description":
            "A fast and resilient real-time translation mobile application. Built with Clean Architecture, it ensures a seamless multilingual communication experience while maintaining a scalable and easily testable codebase.",
        "image": "web/assets/translator_app.png",
        "technologies": "Flutter, Dart, MyMemory API, GetX, Clean Architecture",
        "keyFeatures":
            "Real-Time Translation, robust error handling, clean architecture, and an intuitive responsive UI.",
        "impact":
            "Demonstrated strong problem-solving in API integration, rate-limit handling, and stable app performance during network interruptions.",
        "github": "https://github.com/ragabeid519/translator-app.git",
      },
      {
        "title": "User Notes App",
        "description":
            "A clean and user-friendly notes application that allows users to create, edit, organize, and manage personal notes efficiently with a focus on performance and simplicity.",
        "image": "web/assets/user_notes_app.png",
        "technologies": "Flutter, Dart, Provider, SQLite, Clean Architecture",
        "keyFeatures":
            "Create and edit notes, organized note management, offline-first local persistence, responsive UI, and dark mode support.",
        "impact":
            "Showcases strong understanding of local databases, state management, and clean architecture with a minimal distraction-free UX.",
        "github": "https://github.com/ragabeid519/user-notes-app",
      },
      {
        "title": "Cairo Metro Planner Pro",
        "description":
            "A high-performance mobile application designed to improve the commuting experience in Cairo using geolocation intelligence, smart route planning, and automated fare calculation.",
        "image": "web/assets/metro_app_linkedin.jpg",
        "technologies":
            "Flutter, Dart, GetX, Geolocator API, Google Maps Integration",
        "keyFeatures":
            "Nearest station detection, intelligent pathfinding, automated fare calculation, clean architecture, and direct navigation support.",
        "impact":
            "Demonstrates handling of spatial data, graph-like route logic, and reliable performance with strong location and connectivity error handling.",
        "github": "https://github.com/ragabeid519/metro-app.git",
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Featured Projects",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Here are selected projects that reflect my skills in Flutter development, problem-solving, backend integration, and building real-world mobile experiences.",
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisSpacing: 28,
              crossAxisSpacing: 24,
              mainAxisExtent: 620,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) =>
                _buildProjectCard(projects[index], context),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project, BuildContext context) {
    final isLight = context.watch<ThemeProvider>().currentTheme == lightTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLight ? Colors.white : const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isLight ? Colors.black12 : Colors.white10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.grey.withOpacity(0.08),
                child: Image.asset(
                  project['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.withOpacity(0.08),
                    child: const Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                        size: 46,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            project['title'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          if (project['featured'] == true) ...[
            const SizedBox(height: 8),
            _buildFeaturedBadge(),
          ],
          const SizedBox(height: 10),
          ReadMoreText(
            project['description'],
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show more',
            trimExpandedText: ' Show less',
            moreStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
            lessStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: isLight ? Colors.black87 : Colors.white70,
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProjectDetail(
                    "Technologies",
                    project['technologies'],
                    context,
                  ),
                  _buildProjectDetail(
                    "Key Features",
                    project['keyFeatures'],
                    context,
                  ),
                  _buildProjectDetail(
                    "Impact",
                    project['impact'],
                    context,
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      if (project.containsKey('github'))
                        _buildProjectButton(
                          label: "GitHub",
                          icon: Icons.code,
                          outlined: true,
                          onTap: () => _launchURL(project['github']),
                        ),
                      if (project.containsKey('demo'))
                        _buildProjectButton(
                          label: "Watch Demo",
                          icon: Icons.play_circle_fill_rounded,
                          outlined: false,
                          onTap: () => _launchURL(project['demo']),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.12),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.orange.withOpacity(0.55)),
      ),
      child: const Text(
        "Featured Project",
        style: TextStyle(
          color: Colors.orange,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProjectDetail(
    String label,
    String content,
    BuildContext context,
  ) {
    final isLight = context.watch<ThemeProvider>().currentTheme == lightTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: TextStyle(
            fontSize: 13,
            height: 1.45,
            color: isLight ? Colors.black87 : Colors.white70,
          ),
          children: [
            TextSpan(
              text: "• $label: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isLight ? Colors.black : Colors.white,
              ),
            ),
            TextSpan(text: content),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required bool outlined,
  }) {
    if (outlined) {
      return OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 17),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.orange,
          side: const BorderSide(color: Colors.orange),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 17),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
