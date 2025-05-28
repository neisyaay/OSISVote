import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../home/views/home_view.dart';
import '../../register/views/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showSnackbar(String title, String message, Color color) {
    final textColor = color.withOpacity(0.8);
    Get.snackbar(
      title,
      message,
      backgroundColor: color.withOpacity(0.1),
      colorText: textColor,
      icon: Icon(
        color == Colors.orange ? Icons.warning_amber_rounded : Icons.error_outline,
        color: textColor,
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void _login() {
    FocusScope.of(context).unfocus();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackbar("Form tidak lengkap", "Silakan isi email dan password.", Colors.orange);
    } else if (email == "neisya@gmail.com" && password == "1234") {
      Get.offAll(() => const HomeView());
    } else {
      _showSnackbar("Login Gagal", "Email atau password salah!", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final headerHeight = screenSize.height * 0.38;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Stack(
          children: [
            _buildHeader(headerHeight),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: headerHeight - 50),
                  FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    child: _buildLoginBox(),
                  ),
                  const SizedBox(height: 16),
                  _buildRegisterPrompt(),
                  const SizedBox(height: 16),
                  _buildDivider(),
                  const SizedBox(height: 16),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 800),
                    child: _buildSocialIcons(),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double height) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1A2B50), Color(0xFF213555)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElasticIn(
            duration: const Duration(milliseconds: 1200),
            child: Image.asset(
              'assets/logo/logo-splash.png',
              width: 150,
              height: 90,
            ),
          ),
          const SizedBox(height: 16),
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: const Text(
              'OSISVote',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 8),
          FadeInUp(
            delay: const Duration(milliseconds: 500),
            child: const Text(
              'Sistem Pemilihan Digital',
              style: TextStyle(
                color: Colors.white70,
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'MASUK',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Color(0xFF213555),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Masukkan detail akun Anda',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontFamily: 'Poppins',
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildTextField(
            hint: 'Masukkan email Anda',
            icon: Icons.email_outlined,
            controller: emailController,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            hint: 'Masukkan password Anda',
            icon: Icons.lock_outline,
            controller: passwordController,
            isPassword: true,
          ),
         
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF213555),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Masuk',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? _obscurePassword : false,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          prefixIcon: Icon(icon, color: const Color(0xFF213555).withOpacity(0.7)),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
        ),
        style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
      ),
    );
  }

  Widget _buildRegisterPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Belum punya akun? ",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
            color: Colors.grey.shade700,
          ),
        ),
        GestureDetector(
          onTap: () => Get.to(() => const RegisterView()),
          child: const Text(
            "Daftar",
            style: TextStyle(
              color: Color(0xFF213555),
              fontWeight: FontWeight.w600,
              fontSize: 13,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Expanded(child: Divider(color: Colors.grey.shade300)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Atau",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ),
          Expanded(child: Divider(color: Colors.grey.shade300)),
        ],
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon('assets/icon/google.png', 'Google'),
        const SizedBox(width: 16),
        _buildSocialIcon('assets/icon/facebook.png', 'Facebook'),
        const SizedBox(width: 16),
        _buildSocialIcon('assets/icon/apple.png', 'Apple'),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath, String provider) {
    return GestureDetector(
      onTap: () => _showSnackbar("Info", "Login dengan $provider belum tersedia", Colors.orange),
      child: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3)),
          ],
        ),
        child: Image.asset(assetPath),
      ),
    );
  }
}
