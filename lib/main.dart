import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ragab_portfolio/sections/achievement.dart';
import 'package:ragab_portfolio/sections/final_thoughts_section.dart';
import 'package:ragab_portfolio/sections/work_experience.dart';
import 'providers/theme_provider.dart';
import 'sections/hero.dart';
import 'sections/about.dart';
import 'sections/skills.dart';
import 'sections/projects.dart';
import 'sections/services.dart';
import 'sections/contact.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ragab Eid | Flutter Developer',
      theme: themeProvider.currentTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // مفتاح الـ Scaffold عشان نتحكم في فتح الـ Drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // === مفاتيح الأقسام ===
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // === دالة النزول السلس (مع قفل الـ Drawer أولاً) ===
  Future<void> _scrollToSection(GlobalKey key,
      {bool isFromDrawer = false}) async {
    // لو ضغطنا من الـ Drawer، نقفله الأول
    if (isFromDrawer) {
      Navigator.of(context).pop();
      // ننتظر الـ Drawer يقفل بالكامل
      await Future.delayed(const Duration(milliseconds: 300));
    }

    final keyContext = key.currentContext;
    if (keyContext != null) {
      await Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDesktop = MediaQuery.of(context).size.width > 950;

    return Scaffold(
      key: _scaffoldKey, // ربط الـ Scaffold بالمفتاح

      // === شريط التنقل ===
      appBar: AppBar(
        // تخفي زرار الـ Drawer التلقائي (هنعمل بتاعنا)
        automaticallyImplyLeading: false,

        title: GestureDetector(
          onTap: () => _scrollToSection(_heroKey),
          child: const Text(
            "< Ragab Eid />",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        actions: [
          // === أزرار التنقل تظهر لو الشاشة كبيرة فقط ===
          if (isDesktop) ...[
            _navButton("Home", _heroKey),
            _navButton("About", _aboutKey),
            _navButton("Skills", _skillsKey),
            _navButton("Experience", _experienceKey),
            _navButton("Projects", _projectsKey),
            _navButton("Services", _servicesKey),
            _navButton("Achievements", _achievementsKey),
            _navButton("Contact", _contactKey),
            const SizedBox(width: 10),
          ],

          // === زرار تغيير الثيم ===
          IconButton(
            tooltip: themeProvider.isDark ? "Light Mode" : "Dark Mode",
            icon: Icon(
              themeProvider.isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: themeProvider.toggleTheme,
          ),

          // === زرار القائمة (☰) يظهر لو الشاشة صغيرة ===
          if (!isDesktop)
            IconButton(
              tooltip: "Menu",
              icon: const Icon(Icons.menu, size: 28),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),

          const SizedBox(width: 10),
        ],
      ),

      // === القائمة الجانبية للموبايل ===
      endDrawer: isDesktop ? null : _buildMobileDrawer(),

      // === محتوى الموقع ===
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(key: _heroKey, child: const HeroSection()),
            Container(key: _aboutKey, child: const AboutSection()),
            Container(key: _skillsKey, child: const SkillsSection()),
            Container(
                key: _experienceKey,
                child: const ProfessionalExperienceSection()),
            Container(key: _projectsKey, child: const ProjectsSection()),
            Container(key: _servicesKey, child: const ServicesSection()),
            Container(
                key: _achievementsKey, child: const AchievementsSection()),
            Container(key: _contactKey, child: const ContactSection()),
            const FinalThoughtsSection(),
          ],
        ),
      ),
    );
  }

  // === أزرار الـ Navbar للاب توب ===
  Widget _navButton(String title, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () => _scrollToSection(key),
        style: TextButton.styleFrom(
          foregroundColor: Colors.orange,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // === القائمة الجانبية للموبايل ===
  Widget _buildMobileDrawer() {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "Navigation",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            const Divider(height: 20),
            _drawerItem("Home", Icons.home_outlined, _heroKey),
            _drawerItem("About", Icons.person_outline, _aboutKey),
            _drawerItem("Skills", Icons.code_outlined, _skillsKey),
            _drawerItem("Experience", Icons.work_outline, _experienceKey),
            _drawerItem("Projects", Icons.folder_outlined, _projectsKey),
            _drawerItem("Services", Icons.handshake_outlined, _servicesKey),
            _drawerItem(
                "Achievements", Icons.emoji_events_outlined, _achievementsKey),
            _drawerItem("Contact", Icons.contact_mail_outlined, _contactKey),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon, GlobalKey key) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () => _scrollToSection(key, isFromDrawer: true),
    );
  }
}
