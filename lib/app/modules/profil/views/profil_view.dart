import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profil_controller.dart';
import '../../home/views/home_view.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});

  // Navigation methods
  void _goToHome() => Get.to(() => const HomeView());
  void _goBack() => Get.back();
  void _goToProfile() {}

  // Edit profile method
  void _editProfile() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: EditProfileDialog(),
      ),
    );
  }

  // Consistent nav item builder
  Widget _buildNavItem({
    required String iconAsset,
    required String label,
    required VoidCallback onTap,
    double iconSize = 22,
    double labelFontSize = 9,
    double labelSpacing = 2,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageIcon(
            AssetImage(iconAsset),
            color: Colors.white,
            size: iconSize,
          ),
          SizedBox(height: labelSpacing),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: labelFontSize,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Custom App Bar with gradient
          SliverAppBar(
            expandedHeight: screenHeight * 0.35,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF162B4D),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF162B4D),
                      Color(0xFF1E3A5F),
                      Color(0xFF2A4A72),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Background pattern
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.1,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/pattern.png'),
                              repeat: ImageRepeat.repeat,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Profile content
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.08),
                          _buildEnhancedProfilePhoto(screenWidth),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            'Neisya Ayu A.p',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.055,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          _buildStudentBadge(screenWidth),
                        ],
                      ),
                    ),
                    // Edit button
                    Positioned(
                      top: screenHeight * 0.05,
                      right: 20,
                      child: GestureDetector(
                        onTap: _editProfile,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Content
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    _buildSectionTitle('Informasi Pribadi', screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    
                    // Stats Cards
                    _buildStatsRow(screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    
                    // Information Cards
                    _buildInfoCard(
                      'Email',
                      'neisyaayu8585@gmail.com',
                      Icons.email_outlined,
                      const Color(0xFF4CAF50),
                      screenWidth,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    
                    _buildInfoCard(
                      'Telepon',
                      '+62 89506666166',
                      Icons.phone_outlined,
                      const Color(0xFF2196F3),
                      screenWidth,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    
                    _buildInfoCard(
                      'NISN',
                      '0098444801',
                      Icons.badge_outlined,
                      const Color(0xFFFF9800),
                      screenWidth,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    
                    _buildInfoCard(
                      'Alamat',
                      'Jl.joyo tambaksari',
                      Icons.location_on_outlined,
                      const Color(0xFFE91E63),
                      screenWidth,
                    ),
                    
                    SizedBox(height: screenHeight * 0.1), // Space for bottom nav
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF213555),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                iconAsset: 'assets/icon/back_icon.png',
                label: 'Kembali',
                onTap: _goBack,
                iconSize: 24,
                labelFontSize: 9,
                labelSpacing: 2,
              ),
              _buildNavItem(
                iconAsset: 'assets/icon/home_icon.png',
                label: 'Beranda',
                onTap: _goToHome,
                iconSize: 20,
                labelFontSize: 9,
                labelSpacing: 2,
              ),
              _buildNavItem(
                iconAsset: 'assets/icon/profile_icon.png',
                label: 'Profil',
                onTap: _goToProfile,
                iconSize: 20,
                labelFontSize: 9,
                labelSpacing: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedProfilePhoto(double screenWidth) {
    return Hero(
      tag: 'profile-photo',
      child: GestureDetector(
        onTap: () {
          // Show photo options
          Get.bottomSheet(
            _buildPhotoBottomSheet(),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: screenWidth * 0.28,
              height: screenWidth * 0.28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
                border: Border.all(color: Colors.white.withOpacity(0.5), width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.person,
                size: screenWidth * 0.12,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4CAF50), Color(0xFF45A049)],
                  ),
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentBadge(double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.25),
            Colors.white.withOpacity(0.15),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.school,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            'Siswa',
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.032,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Row(
      children: [
        Container(
          width: 4,
          height: screenWidth * 0.06,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF162B4D), Color(0xFF2A4A72)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF162B4D),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'Tahun Ajaran',
            '2024/2025',
            Icons.calendar_today,
            const Color(0xFF673AB7),
            screenWidth,
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: _buildStatCard(
            'Kelas',
            'IX B',
            Icons.class_,
            const Color(0xFF009688),
            screenWidth,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.028,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.032,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2C3E50),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon, Color color, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.032,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.037,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoBottomSheet() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Ubah Foto Profil',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPhotoOption('Kamera', Icons.camera_alt, () {}),
              _buildPhotoOption('Galeri', Icons.photo_library, () {}),
              _buildPhotoOption('Hapus', Icons.delete, () {}),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPhotoOption(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF162B4D).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF162B4D),
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }
}

// Edit Profile Dialog Widget
class EditProfileDialog extends StatefulWidget {
  @override
  _EditProfileDialogState createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  final _nameController = TextEditingController(text: 'Neisya Ayu A.p');
  final _emailController = TextEditingController(text: 'neisyaayu8585@gmail.com');
  final _phoneController = TextEditingController(text: '+62 89506666166');
  final _addressController = TextEditingController(text: 'Jl.joyo tambaksari');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Edit Profil',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF162B4D),
            ),
          ),
          const SizedBox(height: 24),
          _buildEditField('Nama', _nameController, Icons.person),
          const SizedBox(height: 16),
          _buildEditField('Email', _emailController, Icons.email),
          const SizedBox(height: 16),
          _buildEditField('Telepon', _phoneController, Icons.phone),
          const SizedBox(height: 16),
          _buildEditField('Alamat', _addressController, Icons.location_on),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'Batal',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Save changes
                    Get.back();
                    Get.snackbar('Sukses', 'Profil berhasil diperbarui');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF162B4D),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Simpan',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEditField(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(fontSize: 14),
        prefixIcon: Icon(icon, color: const Color(0xFF162B4D)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF162B4D)),
        ),
      ),
      style: GoogleFonts.poppins(fontSize: 14),
    );
  }
}