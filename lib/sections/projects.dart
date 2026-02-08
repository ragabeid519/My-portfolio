import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ragab_portfolio/providers/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = [
      // قائمة المشاريع مع التفاصيل1
      {
        "title": "User Notes App – Smart & Secure Note Taking",
        "description":
            "A clean and user-friendly notes application that allows users to create, edit, organize, and manage personal notes efficiently with a focus on performance and simplicity.",
        "image": "web/assets/user_notes_app.png",
        "technologies": "Flutter, Dart, Provider, SQLite, Clean Architecture",
        "keyFeatures":
            """📝 Create & Edit Notes: Smooth note creation with real-time updates.

🗂️ Organized Notes: Categorize and search notes easily.

💾 Local Persistence: Offline-first experience using SQLite.

🎨 Responsive UI: Adaptive layout for mobile, tablet, and web.

🌙 Dark Mode Support: Fully responsive colors with system theme.""",
        "impact":
            """Improved Productivity: Enabled users to manage daily thoughts and tasks efficiently.

Technical Growth: Demonstrated strong understanding of local databases, state management, and clean architecture.

UX Focus: Delivered a minimal and distraction-free interface with smooth performance.""",
        "github": "https://github.com/ragabeid519/user-notes-app"
      },
      {
        "title": "Cairo Metro Planner Pro: Smart Transit & Location-Aware App",
        "description":
            "Cairo Metro Planner Pro is a high-performance mobile application designed to revolutionize the commuting experience in Egypt's capital. Built with Flutter and GetX, the app goes beyond simple route mapping by integrating real-time Geolocation intelligence. It solves the common commuter's struggle of finding the nearest station in unfamiliar areas and provides a precise, automated guide through Cairo's complex three-line underground network, including the latest expansions and branches.",
        "image": "web/assets/metro_app_linkedin.jpg",
        "technologies":
            "Flutter, Dart, GetX, Geolocator API, Google Maps Integration.",
        "keyFeatures":
            """📍 Smart Proximity Engine: Utilizes GPS and the Haversine Algorithm to instantly calculate and suggest the nearest metro entry point based on the user's live coordinates.

🧠 Intelligent Pathfinding: A custom-built algorithm that handles multi-line transfers and the intricate branching of Line 3 (Imbaba & Cairo University directions) to ensure the most efficient path.

💰 Automated Fare System: A dynamic pricing engine that calculates ticket costs (8, 10, 15, or 20 EGP) and travel duration in real-time based on the latest official tariffs.

🏗️ Clean Architecture: Developed using a strict Controller-Service-Model pattern with GetX, ensuring a highly responsive UI and a scalable, maintainable codebase.

🗺️ Direct Navigation: Integrated with Google Maps API to provide seamless turn-by-turn directions from the user’s current location to the station gate.""",
        "impact":
            """User Empowerment: Reduced the \"decision fatigue\" for commuters by automating station selection and route planning, saving time and effort.

Technical Excellence: Demonstrated mastery in handling Spatial Data and complex Data Structures to represent the metro network as a searchable graph.

Robust Reliability: Achieved a high level of app stability by implementing custom error-handling layers to manage location permission states and network connectivity issues gracefully.

Optimized Performance: Leveraged reactive programming to ensure that calculations are performed in the background without affecting the smooth 60 FPS user experience.""",
        "github": "https://github.com/ragabeid519/metro-app.git"
      },
      {
        "title": "SwiftConnect Messenger",
        "description":
            "A real-time chat application designed for seamless communication, offering instant messaging and media sharing.",
        "image": "web/assets/swift_connect.png",
        "technologies": "Flutter, Firebase (Firestore, Auth, Cloud Messaging)",
        "keyFeatures":
            "User authentication, real-time messaging, push notifications, image/video sharing.",
        "impact":
            "5,000+ active users, 99.8% uptime, 30% increase in user engagement.",
      },
      {
        "title": "FitTrack Pro",
        "description":
            "A personalized fitness and nutrition tracking app that helps users manage custom workout plans and monitor calorie intake.",
        "image": "web/assets/fittrack.png",
        "technologies": "Flutter, RESTful APIs, SQLite (local caching)",
        "keyFeatures":
            "Custom workout builder, calorie tracker, progress dashboards, integration with external fitness APIs.",
        "impact":
            "Improved user retention by 25%, faster data loading, highly positive user feedback on UI/UX.",
      },
      {
        "title": "EcoWaste Connect",
        "description":
            "A community-driven platform facilitating efficient waste management and recycling efforts through geo-location services.",
        "image": "web/assets/ecowaste.png",
        "technologies":
            "Flutter, Google Maps API, Firebase Cloud Functions, Geo-tagging",
        "keyFeatures":
            "Waste pickup scheduling, nearest recycling point finder, community reporting, gamified eco-actions.",
        "impact":
            "Successful pilot in 2 cities, 10% reduction in landfill waste, increased community participation.",
      },
      {
        "title": "NTI Task 5 - Flutter Application",
        "description":
            "A comprehensive Flutter application developed as part of NTI training program, demonstrating advanced mobile development practices.",
        "image": "web/assets/nti_task5.png",
        "technologies": "Flutter, Dart, Firebase, REST APIs",
        "keyFeatures":
            "Multi-platform support (Android, iOS, Linux, macOS), responsive UI design, efficient state management.",
        "impact":
            "Successfully completed NTI training requirements, showcasing proficiency in full-stack Flutter development.",
        "github": "https://github.com/RagabEid5111999/nti_task_5"
      },
      {
        "title": "NTI Task 4 - Flutter Application",
        "description":
            "An advanced Flutter application developed during NTI training, showcasing professional development practices and multi-platform implementation expertise.",
        "image": "web/assets/nti_task4.png",
        "technologies": "Flutter, Dart, Firebase, REST APIs",
        "keyFeatures":
            "Cross-platform support (Android, iOS, Linux, macOS), advanced UI/UX implementation, state management, efficient code architecture",
        "impact":
            "Demonstrates mastery of Flutter development fundamentals and advanced features, successfully completed as part of NTI curriculum",
        "github": "https://github.com/RagabEid5111999/nti_task_4"
      },
      {
        "title": "Complex Layout Task - Flutter Application",
        "description":
            "A sophisticated Flutter application focused on advanced UI/UX implementation, demonstrating expertise in handling complex layout challenges and responsive design patterns.",
        "image": "web/assets/complex_layout_task.png",
        "technologies": "Flutter, Dart, Custom Widgets, Responsive Design",
        "keyFeatures":
            "Complex layout implementations, responsive UI across multiple screen sizes, custom widget development, advanced UI patterns, cross-platform support (Android, iOS, Linux, macOS)",
        "impact":
            "Showcases advanced Flutter UI/UX skills and ability to handle intricate design requirements, demonstrating proficiency in building scalable and maintainable layout solutions",
        "github": "https://github.com/RagabEid5111999/complex_layout_task"
      },
      {
        "title": "NTI Task 2 - Flutter Application",
        "description":
            "A comprehensive Flutter application developed as part of NTI training curriculum, demonstrating core mobile development concepts and cross-platform implementation skills.",
        "image": "web/assets/nti_task2.png",
        "technologies": "Flutter, Dart, Firebase, REST APIs",
        "keyFeatures":
            "Multi-platform support (Android, iOS, Linux, macOS, Web), responsive design, state management, efficient code architecture, platform-specific implementations",
        "impact":
            "Successfully completed NTI training requirements, showcasing solid understanding of Flutter fundamentals and ability to build functional applications across multiple platforms",
        "github": "https://github.com/RagabEid5111999/nti_task_2"
      }
      // أضف بقية المشاريع هنا...
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 60), // تقليل البادينج الجانبي للموبايل
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
            "Here are some of my recent projects that highlight my expertise in Flutter development and problem-solving.",
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 40),

          // استخدام GridView.builder مع MaxCrossAxisExtent لجعل الحجم "Active"
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  400, // أقصى عرض للكارت الواحد قبل أن يفتح عموداً جديداً
              mainAxisSpacing: 40,
              crossAxisSpacing: 25,
              mainAxisExtent:
                  550, // تحديد ارتفاع ثابت للكارت لضمان التناسق ومنع Overflow
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الصورة مع تأثير حركي بسيط عند التحميل
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              child: Image.asset(
                project['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                    child:
                        Icon(Icons.broken_image, size: 50, color: Colors.grey)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          project['title'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60, // تثبيت مساحة الوصف لتوحيد شكل الكروت
          child: Text(
            project['description'],
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, height: 1.4),
          ),
        ),
        const SizedBox(height: 15),
        // عرض التفاصيل مع مرونة في النص
        Expanded(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                _buildProjectDetail(
                    "Technologies", project['technologies'], context),
                _buildProjectDetail(
                    "Key Features", project['keyFeatures'], context),
                _buildProjectDetail("Impact", project['impact'], context),
              ],
            ),
          ),
        ),
        if (project.containsKey('github')) ...[
          const Divider(),
          const Text("GitHub:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          InkWell(
            onTap: () => _launchURL(project['github']),
            child: Text(
              project['github'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildProjectDetail(
      String label, String content, BuildContext context) {
    final isLight = context.watch<ThemeProvider>().currentTheme == lightTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: TextStyle(
            fontSize: 13,
            height: 1.4,
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

  // Future<void> _launchURL(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   }
  // }
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
