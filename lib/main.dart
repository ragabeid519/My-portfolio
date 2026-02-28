import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ragab_portfolio/sections/achievement.dart';
import 'package:ragab_portfolio/sections/final_thoughts_section.dart';
import 'package:ragab_portfolio/sections/testimonial.dart';
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
      title: 'Ragab Eid Portfolio',
      theme: themeProvider.currentTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ragab Eid"),
        actions: [
          IconButton(
            icon:
                Icon(themeProvider.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: themeProvider.toggleTheme,
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            AboutSection(),
            SkillsSection(),
            ProfessionalExperienceSection(),
            ProjectsSection(),
            ServicesSection(),
            AchievementsSection(),
            TestimonialsSection(),
            ContactSection(),
            FinalThoughtsSection(),
          ],
        ),
      ),
    );
  }
}
