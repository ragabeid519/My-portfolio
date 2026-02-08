// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContactSection extends StatelessWidget {
//   const ContactSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
//       // color: const Color(0xFFFDF9F0), // الخلفية الكريمية المميزة
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Let's Work Together",
//             style: TextStyle(
//               fontSize: 42,
//               fontFamily: 'Serif',
//               // color: Color(0xFF5D4037),
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           const SizedBox(height: 15),
//           const Text(
//             "Ready to collaborate? Let's discuss your next project!",
//             style: TextStyle(
//               fontSize: 18,
//               // color: Color(0xFF795548),
//             ),
//           ),
//           const SizedBox(height: 50),
//           LayoutBuilder(
//             builder: (context, constraints) {
//               // تحديد عدد الأعمدة بناءً على العرض المتاح
//               int crossAxisCount = constraints.maxWidth > 900
//                   ? 3
//                   : (constraints.maxWidth > 600 ? 2 : 1);

//               return GridView.count(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: crossAxisCount,
//                 childAspectRatio: crossAxisCount == 1 ? 3 : 2.5,
//                 mainAxisSpacing: 30,
//                 crossAxisSpacing: 20,
//                 children: const [
//                   ContactItem(
//                     icon: Icons.email_outlined,
//                     label: 'Email',
//                     value: 'ragabeid5111999@gmail.com',
//                     url: 'mailto:ragabeid5111999@gmail.com',
//                   ),
//                   ContactItem(
//                     icon: Icons.phone_outlined,
//                     label: 'Phone',
//                     value: '+20 1128792749',
//                     url: 'tel:+201128792749',
//                   ),
//                   ContactItem(
//                     icon: Icons.folder_shared_outlined,
//                     label: 'GitHub',
//                     value: 'RagabEid5111999',
//                     url: 'https://github.com/RagabEid5111999',
//                   ),
//                   ContactItem(
//                     icon: Icons.account_tree_outlined,
//                     label: 'LinkedIn',
//                     value: 'ragabeid',
//                     url: 'https://linkedin.com/in/ragabeid',
//                   ),
//                   ContactItem(
//                     icon: Icons.chat_bubble_outline, // أيقونة بديلة للواتساب
//                     label: 'WhatsApp',
//                     value: 'Chat or Call\n+20 1128792749',
//                     url: 'https://wa.me/201128792749',
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ContactItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;
//   final String url;

//   const ContactItem({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.value,
//     required this.url,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const Color orangeColor = Color(0xFFF28B50);

//     return InkWell(
//       onTap: () async {
//         final Uri uri = Uri.parse(url);
//         if (await canLaunchUrl(uri)) {
//           await launchUrl(uri);
//         }
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: orangeColor, size: 36),
//           const SizedBox(height: 15),
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 22,
//               // color: Color(0xFF5D4037),
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 16,
//               color: orangeColor,
//               fontWeight: FontWeight.bold,
//               decoration: TextDecoration.underline,
//               height: 1.4,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  int getCrossAxisCount(double width) {
    if (width > 1000) return 3;
    if (width > 650) return 2;
    return 1;
  }

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
                "Let's Work Together",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w500,
                  color: colors.onBackground,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Ready to collaborate? Let's discuss your next project!",
                style: TextStyle(
                  fontSize: 18,
                  color: colors.onBackground.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(constraints.maxWidth),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: 170, // 👈 حل الاستاك
                    ),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return ContactItem(
                        icon: item.icon,
                        label: item.label,
                        value: item.value,
                        url: item.url,
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

// =====================================================

class ContactItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final String url;

  const ContactItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
  });

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: isHover
                    ? colors.shadow.withOpacity(0.25)
                    : colors.shadow.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Icon(
                widget.icon,
                size: 36,
                color: colors.primary,
              ),
              // const SizedBox(height: 8),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: colors.onSurface,
                ),
              ),
              // const SizedBox(height: 6),
              Text(
                widget.value,
                style: TextStyle(
                  fontSize: 15,
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================

class _ContactData {
  final IconData icon;
  final String label;
  final String value;
  final String url;

  const _ContactData(this.icon, this.label, this.value, this.url);
}

const List<_ContactData> _items = [
  _ContactData(
    Icons.email_outlined,
    'Email',
    'ragabeid5111999@gmail.com',
    'mailto:ragabeid5111999@gmail.com',
  ),
  _ContactData(
    Icons.phone_outlined,
    'Phone',
    '+20 1128792749',
    'tel:+201128792749',
  ),
  _ContactData(
    Icons.folder_shared_outlined,
    'GitHub',
    'RagabEid5111999',
    'https://github.com/RagabEid5111999',
  ),
  _ContactData(
    Icons.folder_shared_outlined,
    'GitHub',
    'RagabEid519',
    'https://github.com/ragabeid519',
  ),
  _ContactData(
    Icons.account_tree_outlined,
    'LinkedIn',
    'ragabeid',
    'https://linkedin.com/in/ragabeid',
  ),
  _ContactData(
    Icons.chat_bubble_outline,
    'WhatsApp',
    'Chat or Call\n+20 1128792749',
    'https://wa.me/201128792749',
  ),
];
