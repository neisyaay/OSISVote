import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../login/views/login_view.dart';
import '../../profil/views/profil_view.dart';
import '../../jadwalpilketos/views/jadwalpilketos_view.dart';
import '../../pilketos/views/pilketos_view.dart';
import '../../quickcount/views/quickcount_view.dart';
import '../../tanyajawab/views/tanyajawab_view.dart';
import '../../pengaturan/views/pengaturan_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  bool _isMenuVisible = false;
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutBack));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  void _goToProfile() {
    _toggleMenu();
    Get.to(() => const ProfilView());
  }

  void _goToHome() {
    _showAestheticNotification('🏠 Sudah berada di halaman beranda');
  }
  void _goToJadwal() => Get.to(() => const JadwalpilketosView());
  void _goToQuickCount() => Get.to(() => const QuickcountView());
  void _goToProfilNav() => Get.to(() => const ProfilView());
  void _goToTanyaJawab() => Get.to(() => const TanyajawabView());
  
  void _goBack() {
    if (Navigator.of(context).canPop()) {
      Get.back();
    } else {
      _showAestheticNotification('🏠 Sudah berada di halaman beranda');
    }
  }

  void _showAestheticNotification(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.white.withOpacity(0.95),
        borderRadius: 12,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        snackPosition: SnackPosition.BOTTOM,
        icon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF1A334E).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.home_rounded,
            color: Color(0xFF1A334E),
            size: 20,
          ),
        ),
        titleText: Text(
          'Informasi',
          style: GoogleFonts.poppins(
            color: const Color(0xFF1A334E),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        messageText: Text(
          message,
          style: GoogleFonts.poppins(
            color: const Color(0xFF667085),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        boxShadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        animationDuration: const Duration(milliseconds: 600),
        forwardAnimationCurve: Curves.easeOutBack,
        reverseAnimationCurve: Curves.easeInBack,
      ),
    );
  }

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
      backgroundColor: const Color(0xFFF8F9FC),
      body: Stack(
        children: [
          Column(
            children: [
              // Header - TIDAK BERUBAH
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A334E),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Color(0xFF1A334E),
                            size: 28,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Neisya Ayu A.p",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Siswa",
                            style: GoogleFonts.poppins(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: _toggleMenu,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset(
                                'assets/icon/menu_icon.png',
                                color: Colors.white,
                                errorBuilder: (context, error, stackTrace) => const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // KONTEN UTAMA - PREMIUM DESIGN
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          
                          // Premium Welcome Card - IMPROVED DESIGN
                         Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: const Color(0xFFE2E8F0),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Stack(
      children: [
        // Background Pattern
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            width: 120,
            height: 120,

          ),
        ),
       
        
       // Main Content Padding
Padding(
  padding: const EdgeInsets.all(24),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Header Section
      Row(
        children: [
          // Removed Container with blue background decoration
          Image.asset(
            'assets/icon/student_icon.png',
            width: 120,  // Increased from 60 to 100
            height: 120, // Increased from 60 to 100
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.person, size: 100, color: Colors.grey), // Also increased fallback icon size
          ),
          const SizedBox(width: 10), // Reduced from 20 to 12
                  
          Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      Text(
        "Pemilihan Ketua OSIS",
        style: GoogleFonts.poppins(
          color: const Color(0xFF0F172A),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        "SMPN 13 Malang",
        style: GoogleFonts.poppins(
          color: const Color(0xFF64748B),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
),
        ],
      ),

              const SizedBox(height: 20),
              
              // Description
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF213555).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.campaign_outlined,
                        color: Color(0xFF213555),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Berikan suara terbaik Anda untuk masa depan OSIS yang lebih baik",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF475569),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),
                          const SizedBox(height: 24),
                           
                          // Statistics Row
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: _buildStatCard(
                                    icon: Icons.how_to_vote_outlined,
                                    title: "Total Suara",
                                    value: "1,247",
                                    color: const Color(0xFF3B82F6),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildStatCard(
                                    icon: Icons.people_outline,
                                    title: "Partisipasi",
                                    value: "87%",
                                    color: const Color(0xFF10B981),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildStatCard(
                                    icon: Icons.timeline_outlined,
                                    title: "Progress Pemilihan",
                                    value: "73%",
                                    color: const Color(0xFFF59E0B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Section Header
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1A334E).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.dashboard_outlined,
                                    color: Color(0xFF1A334E),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "Menu Utama",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1A334E).withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF10B981),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        "4 Menu",
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: const Color(0xFF64748B),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 16),

                          // Premium Menu Cards
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                _buildPremiumMenuCard(
                                  icon: Icons.calendar_today_outlined,
                                  iconAsset: 'assets/icon/calendar_icon.png',
                                  title: "Jadwal Pemilihan",
                                  subtitle: "Lihat jadwal lengkap pemilihan",
                                  color: const Color(0xFF3B82F6),
                                  badge: "Terbaru",
                                  onTap: _goToJadwal,
                                ),
                                const SizedBox(height: 12),
                                _buildPremiumMenuCard(
                                  icon: Icons.bar_chart_outlined,
                                  iconAsset: 'assets/icon/quickcount_icon.png',
                                  title: "Quick Count",
                                  subtitle: "Pantau hasil sementara real-time",
                                  color: const Color(0xFF10B981),
                                  badge: "Live",
                                  onTap: _goToQuickCount,
                                ),
                                const SizedBox(height: 12),
                                _buildPremiumMenuCard(
                                  icon: Icons.how_to_vote_outlined,
                                  iconAsset: 'assets/icon/vote_icon.png',
                                  title: "Pemilihan Ketua OSIS",
                                  subtitle: "Berikan suara pilihan Anda",
                                  color: const Color(0xFFEF4444),
                                  badge: "Penting",
                                  onTap: () => Get.to(() => const PilketosView()),
                                ),
                                const SizedBox(height: 12),
                                _buildPremiumMenuCard(
                                  icon: Icons.help_outline,
                                  iconAsset: 'assets/icon/faq_icon.png',
                                  title: "Tanya Jawab",
                                  subtitle: "Dapatkan informasi lengkap",
                                  color: const Color(0xFFF59E0B),
                                  onTap: _goToTanyaJawab,
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Info Banner
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white,
                                    const Color(0xFFF8F9FC),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: const Color(0xFF1A334E).withOpacity(0.1),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1A334E).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.info_outline,
                                        color: Color(0xFF1A334E),
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Informasi Penting",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: const Color(0xFF0F172A),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Pastikan Anda sudah memberikan suara sebelum batas waktu berakhir",
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: const Color(0xFF64748B),
                                              height: 1.4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Menu overlay - TIDAK BERUBAH
          if (_isMenuVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleMenu,
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
            ),

          // Drawer kanan - TIDAK BERUBAH
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: 0,
            bottom: 0,
            right: _isMenuVisible ? 0 : -MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Material(
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "OSISVote",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF1A334E),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                   const Divider(height: 1),
_buildSideMenuItem(
  icon: Icons.person_outline,
  label: "Profile",
  onTap: _goToProfile,
),
_buildSideMenuItem(
  icon: Icons.settings,
  label: "Pengaturan",
  onTap: () {
    _toggleMenu(); // Tutup menu dropdown
    Get.to(() => const PengaturanView()); // Navigasi ke halaman pengaturan
  },
),
_buildSideMenuItem(
  icon: Icons.logout,
  label: "Log out",
  onTap: () {
    _toggleMenu();
    Get.offAll(() => const LoginView());
  },
                  ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      
      // Bottom Navigation Bar - TIDAK BERUBAH
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
                onTap: _goToProfilNav,
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

  // Statistics Card Widget
  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  // Premium Menu Card Widget
  Widget _buildPremiumMenuCard({
    required IconData icon,
    required String iconAsset,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    String? badge,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color.withOpacity(0.15),
                        color.withOpacity(0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: Image.asset(
                        iconAsset,
                        color: color,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          icon,
                          color: color,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF0F172A),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (badge != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                badge,
                                style: GoogleFonts.poppins(
                                  color: color,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF64748B),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF64748B),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSideMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: const Color(0xFF667085)),
            const SizedBox(width: 24),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: const Color(0xFF1A334E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  } 
}