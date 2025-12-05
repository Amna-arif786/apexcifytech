import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: UserProfileScreen()));
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // 1. Define State Variables to hold the profile data
  String _name = 'Amna Arif';
  String _email = 'amnaarif@apexcifytechnology.com';
  String _role = 'Junior Flutter Developer';
  String _location = 'Lahore, Pakistan';
  String _phone = '+92 300 1234567';
  String _linkedin = 'linkedin.com/in/amna-arif';
  String _about =
      'I’m a Junior Flutter Developer with a strong interest in building clean, responsive, and user-friendly mobile apps. I enjoy working with modern UI/UX, writing readable code, and learning new techniques.';

  // 2. The function to show the Edit Dialog
  void _showEditProfileDialog() {
    final nameController = TextEditingController(text: _name);
    final roleController = TextEditingController(text: _role);
    final locationController = TextEditingController(text: _location);
    final phoneController = TextEditingController(text: _phone);
    final aboutController = TextEditingController(text: _about);
    final emailController = TextEditingController(text: _email);

    showDialog(
      context: context,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final dialogColor = isDark ? const Color(0xFF1A2C2A) : Colors.white;

        return AlertDialog(
          backgroundColor: dialogColor,
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(nameController, 'Name', Icons.person),
                const SizedBox(height: 10),
                _buildTextField(roleController, 'Role', Icons.work),
                const SizedBox(height: 10),
                _buildTextField(emailController, 'Email', Icons.email),
                const SizedBox(height: 10),
                _buildTextField(locationController, 'Location', Icons.location_on),
                const SizedBox(height: 10),
                _buildTextField(phoneController, 'Phone', Icons.phone),
                const SizedBox(height: 10),
                _buildTextField(aboutController, 'About', Icons.info, maxLines: 3),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF13ECDA),
              ),
              onPressed: () {
                // 3. Update the state when Save is pressed
                setState(() {
                  _name = nameController.text;
                  _role = roleController.text;
                  _location = locationController.text;
                  _phone = phoneController.text;
                  _about = aboutController.text;
                  _email = emailController.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile Updated Successfully!')),
                );
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Color(0xFF102220)),
              ),
            ),
          ],
        );
      },
    );
  }

  // Helper widget for the text fields in the dialog
  Widget _buildTextField(
      TextEditingController controller,
      String label,
      IconData icon, {
        int maxLines = 1,
      }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

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
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
                        _name, // USING VARIABLE
                        style: TextStyle(
                          color: textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _email, // USING VARIABLE
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
                      _about, // USING VARIABLE
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
                    value: _location, // USING VARIABLE
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
                    value: _role, // USING VARIABLE
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
                    value: _phone, // USING VARIABLE
                    textColor: textColor,
                    subtitleColor: subtitleColor,
                    primaryColor: primaryColor,
                    showDivider: true,
                  ),
                  _ContactInfoRow(
                    icon: Icons.email,
                    label: 'Email',
                    value: _email, // USING VARIABLE
                    textColor: textColor,
                    subtitleColor: subtitleColor,
                    primaryColor: primaryColor,
                    showDivider: true,
                  ),
                  _ContactInfoRow(
                    icon: Icons.link,
                    label: 'LinkedIn',
                    value: _linkedin, // USING VARIABLE
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
      // 4. Triggering the Edit Function
      floatingActionButton: FloatingActionButton(
        onPressed: _showEditProfileDialog, // CALLING THE FUNCTION
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.edit,
          color: Color(0xFF102220),
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------
//  HELPER WIDGETS (Kept same as before)
// ----------------------------------------------------------------

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