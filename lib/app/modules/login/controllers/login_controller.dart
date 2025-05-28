import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Controller untuk TextField
  final nameController = TextEditingController();
  final nisnController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Obx untuk visibilitas password
  var isPasswordVisible = false.obs;

  // Toggle icon mata untuk password
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Fungsi register (sementara hanya validasi kosong)
  void register() {
    if (nameController.text.isEmpty ||
        nisnController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar("Pendaftaran Gagal", "Semua field wajib diisi");
      return;
    }

    // Simulasi sukses
    Get.snackbar("Pendaftaran Berhasil", "Selamat datang ${nameController.text}!");
  }

  // Navigasi ke halaman login
  void goToLogin() {
    Get.offNamed('/login'); // Ganti '/login' sesuai rute kamu
  }

  // Login sosial media (simulasi)
  void signInWithGoogle() {
    Get.snackbar("Google", "Login dengan Google belum tersedia");
  }

  void signInWithFacebook() {
    Get.snackbar("Facebook", "Login dengan Facebook belum tersedia");
  }

  void signInWithApple() {
    Get.snackbar("Apple", "Login dengan Apple belum tersedia");
  }

  // Pastikan untuk dispose controller
  @override
  void onClose() {
    nameController.dispose();
    nisnController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
