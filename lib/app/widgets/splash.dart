import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Mulai animasi fade-in setelah sedikit delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Timer untuk pindah halaman setelah 8 detik
    Future.delayed(const Duration(seconds: 8), () {
      // TODO: Navigasi ke halaman berikutnya jika diperlukan
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF213555),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: _opacity,
                child: SizedBox(
                  width: 700,
                  height: 150,
                  child: Image.asset('assets/logo/logo-splash.png'),
                ),
              ),
              const SizedBox(height: 20), // Memberikan jarak antara logo dan teks
              AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: _opacity,
                child: const Text(
                  'OSISVote',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
