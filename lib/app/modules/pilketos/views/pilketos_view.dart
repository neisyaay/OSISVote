import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/pilketos_controller.dart';
import '../../home/views/home_view.dart';
import '../../profil/views/profil_view.dart';
import '../../kandidat1/views/kandidat1_view.dart';
import '../../kandidat2/views/kandidat2_view.dart'; // Import kandidat2
import '../../kandidat3/views/kandidat3_view.dart'; // Import kandidat3

class PilketosView extends GetView<PilketosController> {
  const PilketosView({super.key});

  // Navigation methods matching kandidat1_view.dart
  void _goToHome() => Get.to(() => const HomeView());
  void _goBack() => Get.back(); // Fixed back navigation
  void _goToProfile() => Get.to(() => const ProfilView());

  // Consistent nav item builder matching kandidat1_view.dart
  Widget _buildNavItem({
    required String iconAsset,
    required String label,
    required VoidCallback onTap,
    double iconSize = 22,
    double labelFontSize = 10,
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
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Column(
        children: [
          // HEADER
          Container(
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFF213555),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo/logo-splash.png',
                      height: 56,
                      width: 56,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'OSISVote',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                
                  ],
                ),
              ),
            ),
          ),

          // CONTENT
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // GREETING
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF213555),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Hallo Neisya!',
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF213555),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F3C2).withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.waving_hand,
                                  size: 20,
                                  color: Color(0xFF213555),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Silahkan pilih salah satu kandidat berikut untuk memberikan suara Anda!',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[700],
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // TITLE
                    Text(
                      'Kandidat Ketua OSIS',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF213555),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // GRID KANDIDAT
                    _buildCandidatesGrid(context),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar - Updated to match kandidat1_view.dart
      bottomNavigationBar: Container(
        color: const Color(0xFF213555), // warna background biru konsisten
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
                labelFontSize: 10,
                labelSpacing: 2,
              ),
              _buildNavItem(
                iconAsset: 'assets/icon/home_icon.png',
                label: 'Beranda',
                onTap: _goToHome,
                iconSize: 20,
                labelFontSize: 10,
                labelSpacing: 2,
              ),
              _buildNavItem(
                iconAsset: 'assets/icon/profile_icon.png',
                label: 'Profil',
                onTap: _goToProfile,
                iconSize: 20,
                labelFontSize: 10,
                labelSpacing: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCandidatesGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _CandidateCard(
                image: 'assets/logo/kandidat1.png',
                number: 1,
                onTap: () => Get.to(() => const Kandidat1View()), // ✅ Navigasi ke Kandidat1View
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _CandidateCard(
                image: 'assets/logo/kandidat2.png',
                number: 2,
                onTap: () => Get.to(() => const Kandidat2View()), // ✅ Navigasi ke Kandidat2View
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Spacer(flex: 1),
            Expanded(
              flex: 2,
              child: _CandidateCard(
                image: 'assets/logo/kandidat3.png',
                number: 3,
                onTap: () => Get.to(() => const Kandidat3View()), // ✅ Navigasi ke Kandidat3View
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ],
    );
  }
}

// Kartu Kandidat
class _CandidateCard extends StatelessWidget {
  final String image;
  final int number;
  final VoidCallback onTap;

  const _CandidateCard({
    Key? key,
    required this.image,
    required this.number,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(image, fit: BoxFit.cover),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: const Color(0xFF213555),
                  child: Text(
                    '$number',
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.how_to_vote, size: 16, color: Color(0xFF213555)),
                      const SizedBox(width: 6),
                      Text(
                        'Pilih Kandidat',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF213555),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}