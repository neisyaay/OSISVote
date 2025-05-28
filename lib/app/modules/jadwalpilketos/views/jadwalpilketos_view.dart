import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/jadwalpilketos_controller.dart';
import '../../home/views/home_view.dart';
import '../../profil/views/profil_view.dart';

class JadwalpilketosView extends GetView<JadwalpilketosController> {
  const JadwalpilketosView({super.key});

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
          // AppBar
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

          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C1C3A),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Jadwal Detail',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0C1C3A),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Table
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: const Color(0xFFEEF2F6),
                        dataTableTheme: DataTableThemeData(
                          headingTextStyle: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          dataTextStyle: GoogleFonts.poppins(
                            color: const Color(0xFF344054),
                            fontSize: 14,
                          ),
                          headingRowHeight: 50,
                          dataRowHeight: 60,
                          dividerThickness: 1,
                        ),
                      ),
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(const Color(0xFF0C1C3A)),
                        columnSpacing: 32,
                        columns: const [
                          DataColumn(label: Text('No')),
                          DataColumn(label: Text('Kegiatan')),
                          DataColumn(label: Text('Tanggal')),
                          DataColumn(label: Text('Waktu')),
                        ],
                        rows: [
                          _buildEnhancedRow('1', 'Sosialisasi Pemilihan', '20 Januari 2025', '08.00 - 09.30', _getStatusColor('completed')),
                          _buildEnhancedRow('2', 'Pendaftaran Bakal Calon', '21 - 25 Januari 2025', '08.00 - 09.30', _getStatusColor('completed')),
                          _buildEnhancedRow('3', 'Pengumuman Calon Tetap', '29 Januari 2025', '08.00 - 10.30', _getStatusColor('upcoming')),
                          _buildEnhancedRow('4', 'Kampanye Calon Ketua OSIS', '30 Jan - 5 Feb 2025', '08.00 - 11.30', _getStatusColor('upcoming')),
                          _buildEnhancedRow('5', 'Debat Terbuka', '6 Februari 2025', '08.00 - 10.30', _getStatusColor('upcoming')),
                          _buildEnhancedRow('6', 'Pemungutan Suara', '6 Februari 2025', '08.00 - selesai', _getStatusColor('upcoming')),
                          _buildEnhancedRow('7', 'Penghitungan Suara', '8 Februari 2025', '08.00 - selesai', _getStatusColor('upcoming')),
                          _buildEnhancedRow('8', 'Pengumuman Pemenang', '9 Februari 2025', '08.00 - selesai', _getStatusColor('upcoming')),
                          _buildEnhancedRow('9', 'Pelantikan', '15 Februari 2025', '08.00 - selesai', _getStatusColor('upcoming')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Informasi Penting
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(24, 16, 24, 16), // Reduced bottom margin
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFEBF5FF), Color(0xFFE0EEFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFD0E3FF)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  color: Color(0xFF0C1C3A),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Penting',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0C1C3A),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Jadwal dapat berubah sewaktu-waktu. Selalu periksa pengumuman terbaru.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF344054),
                        ),
                      ),
                    ],
                  ),
                )
              ],
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

  static DataRow _buildEnhancedRow(String no, String kegiatan, String tanggal, String waktu, Color statusColor) {
    return DataRow(
      cells: [
        DataCell(
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF0C1C3A),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              no,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
        DataCell(
          Container(
            width: 200, // Set fixed width to prevent overflow
            child: Text(
              kegiatan,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xFF344054),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataCell(
          Container(
            width: 150, // Set fixed width
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  size: 16,
                  color: const Color(0xFF0C1C3A).withOpacity(0.6),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    tanggal,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        DataCell(
          Container(
            width: 120, // Set fixed width
            child: Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 16,
                  color: const Color(0xFF0C1C3A).withOpacity(0.6),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    waktu,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Color _getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return const Color(0xFF0A8754);
      case 'ongoing':
        return const Color(0xFFFD7E14);
      case 'upcoming':
      default:
        return const Color(0xFF0C1C3A);
    }
  }
}