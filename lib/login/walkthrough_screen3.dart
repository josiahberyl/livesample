import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class WalkthroughScreen3 extends StatelessWidget {
  const WalkthroughScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3D5C2), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Main Illustration
                SvgPicture.asset(
                  'assets/images/lap.svg',
                  height: 240,
                ),
                const SizedBox(height: 50),

                // Safe & Secure Payments
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.verified, size: 24, color: Colors.black),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Safe & Secure Payments',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Customer Support - Two lines properly aligned
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.headset_mic, size: 24, color: Colors.black),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '24/7 Customer Support\n-Reach Out Us Anytime',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),

                // Ready to Shop! + GIF + Underline
                Column(
                  children: [
                    Container
                    
                    (decoration:BoxDecoration(border: Border(bottom: BorderSide(width: 2,color: Colors.black))),
                    child :Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/cart.gif',
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Ready To Shop!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),)
                    
                    
                   
                  ],
                ),

                const SizedBox(height: 40),

                // Dive In Button (slightly smaller now)
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dive In',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Dot Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dot(false),
                    dot(false),
                    dot(true),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dot(bool isActive) {
    return Container(
      width: isActive ? 24 : 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
