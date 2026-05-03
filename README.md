# Ragab Eid Portfolio

<div align="center">

![Website Status](https://img.shields.io/website?url=https%3A%2F%2Fragab-eid-511.web.app&style=flat-square)
![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue?logo=flutter&style=flat-square)
![Dart](https://img.shields.io/badge/Dart-Language-00B4AB?logo=dart&style=flat-square)
![Firebase](https://img.shields.io/badge/Firebase-Hosting-FFA726?logo=firebase&style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

A modern and responsive personal portfolio website built with **Flutter Web** to showcase my projects, technical skills, professional background, and contact information.

[Live Demo](https://ragab-eid-511.web.app/) • [GitHub](https://github.com/ragabeid519) • [LinkedIn](https://www.linkedin.com/in/ragabeid/) • [Download CV](https://drive.google.com/file/d/1Rmf16LwqKEWnPx3NXvaX9Ftfy663Lwzo/view?usp=drive_link)

</div>

---

## Overview

This portfolio represents my work as a **Flutter Developer | Software Engineer** with a strong focus on building scalable, maintainable, and user-friendly mobile applications.

It highlights:
- My technical background and development approach
- Professional experience and training
- Selected Flutter projects
- Services and contribution areas
- Contact and collaboration channels

---

## Features

✨ **Responsive Design** for desktop, tablet, and mobile
🎨 **Smooth Navigation** with section-based scrolling and mobile drawer
🎯 **Hero Section** with quick introduction and direct call-to-action buttons
👤 **About Section** with technical summary and development focus
🔧 **Skills Section** with categorized technical stack and core technologies
💼 **Professional Experience Section** for experience and education
🚀 **Projects Section** featuring selected Flutter projects
📞 **Services Section** outlining what I can build and contribute
🏆 **Achievements & Milestones Section** highlighting training and growth
📧 **Contact Section** with direct links for communication
💬 **Final Thoughts Section** as a strong closing message
🌙 **Dark/Light Theme** with smooth transitions and persistent preferences

---

## Featured Project

### Murshid App
A smart educational mobile application built to streamline lecture and course management for both professors and students through one integrated, user-friendly experience.

**Key highlights:**
- Role-based authentication
- Course and schedule management
- Real-time notifications
- Geolocation-based attendance tracking
- Offline support
- Arabic and English support

---

## Tech Stack

- **Framework:** Flutter Web
- **Language:** Dart (3.0+)
- **State Management:** Provider
- **UI Libraries:**
  - Animated Text Kit (text animations)
  - Font Awesome Flutter (icons)
  - Google Fonts (typography)
  - Readmore (expandable text)
  - URL Launcher (deep linking)
- **Hosting:** Firebase Hosting
- **Design System:** Material Design 3

---

## Project Structure

```
lib/
├── main.dart                    # Application entry point
├── providers/
│   └── theme_provider.dart      # Theme management (dark/light)
├── sections/
│   ├── hero.dart               # Hero introduction section
│   ├── about.dart              # About me section
│   ├── skills.dart             # Technical skills showcase
│   ├── work_experience.dart    # Professional experience & education
│   ├── projects.dart           # Featured projects
│   ├── services.dart           # Services offered
│   ├── achievement.dart        # Achievements & certifications
│   ├── contact.dart            # Contact & social links
│   └── final_thoughts_section.dart # Closing message
└── web/
    ├── index.html              # HTML entry point with SEO tags
    ├── manifest.json           # PWA manifest
    └── assets/                 # Images and resources
```

---

## Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Dart 3.0+
- A modern web browser (Chrome, Firefox, Safari, Edge)

### Run Locally

```bash
# Clone the repository
git clone https://github.com/ragabeid519/My-portfolio.git
cd portfolio_web

# Install dependencies
flutter pub get

# Run on Chrome
flutter run -d chrome
```

### Build for Web

```bash
# Build optimized release version
flutter build web --release

# Output will be in build/web/
```

---

## Deployment

### Deploy to Firebase Hosting

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Deploy
firebase deploy
```

The portfolio is currently hosted at: **https://ragab-eid-511.web.app/**

---

## Key Sections

| Section | Description |
|---------|-------------|
| **Hero** | Initial impression with animated title and CTA buttons |
| **About** | Professional background and technical focus |
| **Skills** | Categorized technical expertise |
| **Experience** | Work history and educational background |
| **Projects** | Featured Flutter projects and case studies |
| **Services** | Available services and expertise areas |
| **Achievements** | Training, certifications, and milestones |
| **Contact** | Multiple contact channels and social links |
| **Final Thoughts** | Closing message and call to action |

---

## SEO Optimization

The portfolio includes:
- Optimized meta tags and descriptions
- Open Graph tags for social media sharing
- Twitter Card support
- Structured data for search engines
- Mobile-friendly responsive design
- Fast performance optimizations

---

## Performance Features

- ⚡ Optimized Flutter Web build
- 🎯 Smooth animations and transitions
- 📱 Mobile-first responsive design
- 🌙 Dark mode support with theme persistence
- 🔄 Smooth section scrolling
- ♿ Accessible design principles

---

## Customization

### Colors and Theme
Edit theme values in individual section files:
```dart
Color primaryColor = const Color(0xff00d9ff);
Color darkBg = const Color(0xff0f172a);
```

### Content
Modify content directly in `lib/sections/`:
- **Hero:** Name, title, and CTA text
- **About:** Professional bio and focus areas
- **Skills:** Technical stack and expertise
- **Projects:** Portfolio projects and case studies
- **Contact:** Social media links and email

### Images

```dart

Image(
  image: AssetImage('assets/images/your_image.jpg'),
  fit: BoxFit.cover,
),

```

---

## Connect & Collaborate

| Platform | Link |
|----------|------|
| 🌐 Portfolio | [ragab-eid-511.web.app](https://ragab-eid-511.web.app/) |
| 💼 LinkedIn | [@ragabeid](https://www.linkedin.com/in/ragabeid/) |
| 🐙 GitHub | [@ragabeid519](https://github.com/ragabeid519) |
| 📧 Email | ragabeid5111999@gmail.com |
| 📱 WhatsApp | [+201128792749](https://wa.me/201128792749) |

---

## Contributing

Contributions are welcome! Feel free to:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Make your changes
4. Commit (`git commit -m 'Add improvement'`)
5. Push (`git push origin feature/improvement`)
6. Open a Pull Request

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Notes

This portfolio is continuously updated as I improve my projects, technical skills, and personal branding as a Flutter Developer and Software Engineer.

---

<div align="center">

**Built with ❤️ using Flutter**

If you find this portfolio helpful, please consider giving it a ⭐ Star

[⬆ Back to top](#ragab-eid-portfolio)

</div>
