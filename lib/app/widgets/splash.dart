import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  
  late Animation<double> _logoOpacity;
  late Animation<double> _logoScale;
  late Animation<Offset> _logoSlide;
  
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;
  late Animation<double> _textScale;

  @override
  void initState() {
    super.initState();
    
    // Controller untuk animasi logo
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    
    // Controller untuk animasi text
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    // === ANIMASI LOGO ===
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    
    _logoScale = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
      ),
    );
    
    _logoSlide = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack),
      ),
    );
    
    // === ANIMASI TEXT ===
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );
    
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
    );
    
    _textScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOutBack),
      ),
    );
    
    // Mulai animasi
    _startAnimation();
  }
  
  void _startAnimation() async {
    // Logo muncul terlebih dahulu
    _logoController.forward();
    
    // Text muncul setelah logo mulai terlihat
    await Future.delayed(const Duration(milliseconds: 1000));
    _textController.forward();
    
    // Navigasi setelah 4 detik
    await Future.delayed(const Duration(milliseconds: 3000));
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF213555),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // === LOGO ANIMATION ===
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return SlideTransition(
                  position: _logoSlide,
                  child: Transform.scale(
                    scale: _logoScale.value,
                    child: Opacity(
                      opacity: _logoOpacity.value,
                      child: SizedBox(
                        width: 200,
                        height: 100,
                        child: Image.asset('assets/logo/logo-splash.png'),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            // === TEXT ANIMATION ===
            AnimatedBuilder(
              animation: _textController,
              builder: (context, child) {
                return SlideTransition(
                  position: _textSlide,
                  child: Transform.scale(
                    scale: _textScale.value,
                    child: Opacity(
                      opacity: _textOpacity.value,
                      child: const Text(
                        'OSISVote',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}