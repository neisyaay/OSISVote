import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tanyajawab_controller.dart';
import '../../home/views/home_view.dart';
import '../../profil/views/profil_view.dart';
// Import halaman form tanya kandidat
import 'tanya_kandidat_view.dart';

class TanyajawabView extends GetView<TanyajawabController> {
  const TanyajawabView({super.key});

  // Navigation methods matching pilketos_view.dart
  void _goToHome() => Get.to(() => const HomeView());
  void _goBack() => Get.back();
  void _goToProfile() => Get.to(() => const ProfilView());

  // Fungsi untuk navigasi ke halaman tanya kandidat
  void _tanyaKandidat(String kandidatImage, String kandidatNomor) {
    Get.to(() => TanyaKandidatView(
      kandidatImage: kandidatImage,
      kandidatNomor: kandidatNomor,
    ));
  }

  // Fungsi untuk navigasi ke halaman jawaban kandidat
  void _lihatJawaban(String kandidatNomor) {
    Get.to(() => JawabanKandidatView(kandidatNomor: kandidatNomor));
  }

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
      backgroundColor: const Color(0xFFF8F9FE),
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
              child: Column(
                children: [
                  // Header Section with Gradient
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF213555).withOpacity(0.1),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 20),
                      child: Column(
                        children: [
                          // Decorative icon
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF213555).withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.question_answer_rounded,
                              size: 32,
                              color: const Color(0xFF213555),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Tanya Jawab Kandidat',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF213555),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Ajukan pertanyaan kepada kandidat pilihanmu dan lihat jawaban mereka',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // KANDIDAT CARDS
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _buildKandidatCard(
                          image: 'assets/logo/kandidat1.png',
                          kandidatNomor: '1',
                          visi: 'Mewujudkan OSIS sebagai organisasi yang kreatif, inovatif, dan inspiratif bagi seluruh siswa untuk mencapai prestasi akademik maupun non-akademik.',
                          misi: [
                            'Mengembangkan program tahunan yang mendukung kreativitas, seperti kompetisi seni, olahraga, dan inovasi teknologi.',
                            'Menyediakan wadah bagi siswa untuk menyampaikan ide dan aspirasi melalui forum diskusi rutin.',
                            'Meningkatkan kolaborasi antarorganisasi siswa untuk menciptakan acara yang bermanfaat dan menarik.',
                            'Mendorong penggunaan teknologi dalam kegiatan OSIS untuk memudahkan efisiensi.'
                          ],
                        ),

                        const SizedBox(height: 20),

                        _buildKandidatCard(
                          image: 'assets/logo/kandidat2.png',
                          kandidatNomor: '2',
                          visi: 'Menjadikan OSIS sebagai rumah bersama yang mewakili suara seluruh siswa dan mendorong terciptanya lingkungan sekolah yang harmonis.',
                          misi: [
                            'Menyelenggarakan survei rutin untuk mengumpulkan aspirasi siswa dan menjadikannya dasar program kerja OSIS.',
                            'Memfasilitasi penyelesaian konflik dengan mediasi dan komunikasi efektif antara siswa dan pihak sekolah.',
                            'Membentuk kelompok kerja yang melibatkan siswa lintas kelas dalam kegiatan OSIS.',
                            'Memastikan setiap program OSIS bermanfaat dan dapat dirasakan oleh seluruh siswa.'
                          ],
                        ),

                        const SizedBox(height: 20),

                        _buildKandidatCard(
                          image: 'assets/logo/kandidat3.png',
                          kandidatNomor: '3',
                          visi: 'Membentuk siswa yang unggul dalam karakter, kepemimpinan, dan prestasi melalui program kerja OSIS yang terarah dan berkesinambungan.',
                          misi: [
                            'Mengadakan pelatihan kepemimpinan untuk pengurus OSIS dan siswa lainnya.',
                            'Membuat program pelatihan soft skill untuk membentuk mata pelajaran, seminar motivasi, dan bimbingan belajar.',
                            'Mendorong budaya apresiasi untuk siswa yang berprestasi baik di tingkat sekolah maupun luar sekolah.',
                            'Menjalankan program lingkungan sekolah seperti penghijauan dan pengurangan sampah.'
                          ],
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
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

  Widget _buildKandidatCard({
    required String image,
    required String kandidatNomor,
    required String visi,
    required List<String> misi,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF213555).withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Header dengan foto dan nomor kandidat
            Row(
              children: [
                // Candidate Image - Square and smaller
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF213555).withOpacity(0.1),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // Kandidat Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kandidat Number Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF213555),
                              const Color(0xFF213555).withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF213555).withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  kandidatNomor,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF213555),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Kandidat',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Stats Row
                      Row(
                        children: [
                          _buildStatItem(Icons.lightbulb_outline, "Visi & Misi"),
                          const SizedBox(width: 16),
                          _buildStatItem(Icons.people_outline, "Aspirasi"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Divider
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.grey.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Visi Section
            _buildSectionContainer(
              icon: Icons.visibility_outlined,
              title: 'Visi',
              content: visi,
            ),
            
            const SizedBox(height: 20),
            
            // Misi Section
            _buildMisiSection(misi),
            
            const SizedBox(height: 24),
            
            // Action Buttons Row
            Row(
              children: [
                // Tanya Kandidat Button
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF213555).withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () => _tanyaKandidat(image, kandidatNomor),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF213555),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline_rounded,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Tanya',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Lihat Jawaban Button
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF213555).withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: OutlinedButton(
                      onPressed: () => _lihatJawaban(kandidatNomor),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF213555),
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: const Color(0xFF213555).withOpacity(0.05),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Lihat Jawaban',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: const Color(0xFF213555).withOpacity(0.7),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionContainer({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF213555).withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF213555).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF213555),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF213555),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMisiSection(List<String> misi) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF213555).withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF213555).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF213555),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.flag_outlined,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Misi',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF213555),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...misi.asMap().entries.map((entry) {
            int index = entry.key;
            String misiItem = entry.value;
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFF213555),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      misiItem,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}