import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  int getCrossAxisCount(double width) {
    if (width > 1000) return 3;
    if (width > 650) return 2;
    return 1;
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = const Color(0xff00d9ff);
    final Color bgColor =
        isDarkMode ? const Color(0xff111827) : const Color(0xfff8fafc);
    final Color cardColor = isDarkMode ? const Color(0xff1e293b) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
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
                  "Get in touch",
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
                      text: "Let's Work ",
                      style: TextStyle(color: textColor),
                    ),
                    TextSpan(
                      text: "Together",
                      style: TextStyle(color: primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  "I’m open to Flutter development opportunities, freelance collaborations, and meaningful tech conversations. Feel free to reach out through any of the channels below.",
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
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(constraints.maxWidth),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: 220,
                    ),
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return ContactItem(
                        icon: item.icon,
                        label: item.label,
                        value: item.value,
                        url: item.url,
                        primaryColor: primaryColor,
                        cardColor: cardColor,
                        textColor: textColor,
                        subTextColor: subTextColor,
                        onTap: () => _openUrl(item.url),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 42),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 14,
                runSpacing: 14,
                children: [
                  _buildActionButton(
                    label: "Send Email",
                    icon: Icons.email_outlined,
                    isPrimary: true,
                    primaryColor: primaryColor,
                    onTap: () => _openUrl(_items[0].url),
                  ),
                  _buildActionButton(
                    label: "Open LinkedIn",
                    icon: Icons.account_tree_outlined,
                    isPrimary: false,
                    primaryColor: primaryColor,
                    onTap: () => _openUrl(_items[3].url),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required bool isPrimary,
    required Color primaryColor,
    required VoidCallback onTap,
  }) {
    if (isPrimary) {
      return ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 8,
        ),
      );
    }

    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: BorderSide(color: primaryColor, width: 1.6),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class ContactItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final String url;
  final Color primaryColor;
  final Color cardColor;
  final Color textColor;
  final Color subTextColor;
  final VoidCallback onTap;

  const ContactItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
    required this.primaryColor,
    required this.cardColor,
    required this.textColor,
    required this.subTextColor,
    required this.onTap,
  });

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.identity()..translate(0.0, isHover ? -4.0 : 0.0),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: widget.cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.primaryColor.withOpacity(isHover ? 0.30 : 0.16),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.primaryColor.withOpacity(isHover ? 0.10 : 0.05),
                blurRadius: isHover ? 22 : 16,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: widget.primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  widget.icon,
                  size: 24,
                  color: widget.primaryColor,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: widget.textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.value,
                style: TextStyle(
                  fontSize: 14.5,
                  color: widget.subTextColor,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    'https://mail.google.com/mail/?view=cm&fs=1&to=ragabeid5111999@gmail.com&su=Hello Ragab Eid&body=I would like to connect with you',
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
    'ragabeid519',
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
