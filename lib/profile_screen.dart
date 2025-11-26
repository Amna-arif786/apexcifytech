import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.grey[200] : const Color(0xFF333333);
    final subtitleColor = isDark ? Colors.grey[400] : const Color(0xFF6B7280);
    final cardColor = isDark ? const Color(0xFF1A2C2A) : Colors.white;
    final primaryColor = const Color(0xFF13ECDA);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A1C71),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              children: [
                const CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQsn_VAkydQBV1cbyB90wSrZlwMez6FEkh8w&s",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amna Arif',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'amnaarif@apexcifytechnology.com',
                        style: TextStyle(
                          color: subtitleColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // About Card
            Card(
              color: cardColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'I’m a Junior Flutter Developer with a strong interest in building clean, responsive, and user-friendly mobile apps. I enjoy working with modern UI/UX, writing readable code, and learning new techniques to improve my development skills. I’m comfortable with Dart, state management basics, APIs integration, and Firebase. My goal is to grow as a developer and contribute to meaningful, real-world projects.',
                      style: TextStyle(
                        color: subtitleColor,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Info Cards Grid
            Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    icon: Icons.location_on,
                    label: 'Location',
                    value: 'Lahore, Pakistan',
                    cardColor: cardColor,
                    textColor: textColor!,
                    subtitleColor: subtitleColor!,
                    primaryColor: primaryColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _InfoCard(
                    icon: Icons.work,
                    label: 'Role',
                    value: 'Junior Flutter developer',
                    cardColor: cardColor,
                    textColor: textColor,
                    subtitleColor: subtitleColor,
                    primaryColor: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Contact Info Card
            Card(
              color: cardColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _ContactInfoRow(
                    icon: Icons.phone,
                    label: 'Phone',
                    value: '+92 300 1234567',
                    textColor: textColor,
                    subtitleColor: subtitleColor,
                    primaryColor: primaryColor,
                    showDivider: true,
                  ),
                  _ContactInfoRow(
                    icon: Icons.email,
                    label: 'Email',
                    value: 'im.amnaarif@gmail.com',
                    textColor: textColor,
                    subtitleColor: subtitleColor,
                    primaryColor: primaryColor,
                    showDivider: true,
                  ),
                  _ContactInfoRow(
                    icon: Icons.link,
                    label: 'LinkedIn',
                    value: 'linkedin.com/in/amna-arif',
                    textColor: textColor,
                    subtitleColor: subtitleColor,
                    primaryColor: primaryColor,
                    showDivider: true,
                  ),
                  _ContactInfoRow(
                    icon: Icons.calendar_today,
                    label: 'Joined',
                    value: 'November 15, 2025',
                    textColor: textColor,
                    subtitleColor: subtitleColor,
                    primaryColor: primaryColor,
                    showDivider: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.edit,
          color: Color(0xFF102220),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color cardColor;
  final Color textColor;
  final Color subtitleColor;
  final Color primaryColor;

  const _InfoCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.cardColor,
    required this.textColor,
    required this.subtitleColor,
    required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: primaryColor, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: subtitleColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color textColor;
  final Color subtitleColor;
  final Color primaryColor;
  final bool showDivider;

  const _ContactInfoRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.textColor,
    required this.subtitleColor,
    required this.primaryColor,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Icon(icon, color: primaryColor, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    color: subtitleColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            color: subtitleColor.withOpacity(0.2),
            indent: 20,
            endIndent: 20,
          ),
      ],
    );
  }
}