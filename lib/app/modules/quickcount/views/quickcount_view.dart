import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/quickcount_controller.dart';
import '../../home/views/home_view.dart';
import '../../profil/views/profil_view.dart';

class QuickcountView extends GetView<QuickcountController> {
  const QuickcountView({super.key});

  // Navigation methods matching pilketos_view.dart
  void _goToHome() => Get.to(() => const HomeView());
  void _goBack() => Get.back();
  void _goToProfile() => Get.to(() => const ProfilView());

  // Consistent nav item builder matching pilketos_view.dart
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
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // HEADER - Same as pilketos_view.dart
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
              padding: const EdgeInsets.only(top: 20, bottom: 24),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Leading Candidate Highlight - CENTERED
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'AURALITA & RIDWAN',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF213555),
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset(
                              'assets/logo/kandidat3.png',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFF213555),
                                  child: const Icon(
                                    Icons.people,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Results Title
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFF213555),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Hasil Perolehan Suara',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF213555),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Voting Results with Enhanced Design
                    Column(
                      children: [
                        // Candidate 1 - Reyhana & Anindya
                        _buildEnhancedCandidateCard(
                          candidateName: 'Reyhana Rahma & Anindya Danendra',
                          percentage: 20,
                          votes: 'Dipilih 1 dari 5 pemilih',
                          color: const Color(0xFF3498DB),
                          isLeading: false,
                          candidateNumber: 1,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Candidate 2 - Aldanila & Louse
                        _buildEnhancedCandidateCard(
                          candidateName: 'Aldanila Mianighta & Louse Batari',
                          percentage: 20,
                          votes: 'Dipilih 1 dari 5 pemilih',
                          color: const Color(0xFF9B59B6),
                          isLeading: false,
                          candidateNumber: 2,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Candidate 3 - Adinda & Muhammad (Leading)
                        _buildEnhancedCandidateCard(
                          candidateName: 'Adinda Auralita & Muhammad Ridwan',
                          percentage: 40,
                          votes: 'Dipilih 2 dari 5 pemilih',
                          color: const Color(0xFF213555),
                          isLeading: true,
                          candidateNumber: 3,
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Enhanced Update Info
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF213555).withOpacity(0.1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF213555).withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.info_outline_rounded,
                              color: Color(0xFF213555),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'Data diperbarui secara real-time berdasarkan hasil perhitungan suara',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: const Color(0xFF213555),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar - Same as pilketos_view.dart
      bottomNavigationBar: Container(
        color: const Color(0xFF213555),
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

  Widget _buildEnhancedCandidateCard({
    required String candidateName,
    required int percentage,
    required String votes,
    required Color color,
    required bool isLeading,
    required int candidateNumber,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isLeading 
              ? color.withOpacity(0.15) 
              : Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: isLeading 
          ? Border.all(color: color, width: 2)
          : Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Enhanced Candidate Number
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withOpacity(0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$candidateNumber',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      candidateName,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF213555),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      votes,
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (isLeading)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [color, color.withOpacity(0.8)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.trending_up,
                            color: Colors.white,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'UNGGUL',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    '$percentage%',
                    style: GoogleFonts.poppins(
                      color: color,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Enhanced Progress Bar
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: percentage / 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color, color.withOpacity(0.7)],
                      ),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}