import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../login/login_screen.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              _buildWalkthroughPage1(),
              _buildWalkthroughPage2(),
              _buildWalkthroughPage3(),
            ],
          ),
          if (_currentPage == 0)
            Positioned(
              top: 50,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => dot(index == _currentPage)),
    );
  }

  Widget _buildWalkthroughPage1() {
    return _buildGradientContainer(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          const Text(
            'Welcome To KISANGRO',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SvgPicture.asset('assets/images/hello_image.svg'),
          const SizedBox(height: 16),
          const Text(
            'Your “One-Stop Shop”\nFor All Agricultural Needs!',
            style: TextStyle(fontSize: 16, height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SvgPicture.asset('assets/images/delivery_image.svg'),
          const SizedBox(height: 30),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Agri-Products ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Delivered\nTo Your '),
                TextSpan(text: 'Door Step', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          _buildDotIndicator(),
        ],
      ),
    );
  }

  Widget _buildWalkthroughPage2() {
    return _buildGradientContainer(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          const Text(
            'Trusted Agri Marketplace',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SvgPicture.asset('assets/images/sale.svg', height: 220),
          const SizedBox(height: 30),
          const Text(
            'From seeds to solutions,\nWe’ve got it all covered!',
            style: TextStyle(fontSize: 16, height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Trusted by thousands of\nfarmers across the country.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          _buildDotIndicator(),
        ],
      ),
    );
  }

  Widget _buildWalkthroughPage3() {
    return _buildGradientContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          SvgPicture.asset('assets/images/lap.svg', height: 240),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.verified, size: 24, color: Colors.black),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Safe & Secure Payments',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.headset_mic, size: 24, color: Colors.black),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  '24/7 Customer Support\n-Reach Out Us Anytime',
                  style: TextStyle(fontSize: 16, color: Colors.black, height: 1.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 2, color: Colors.black)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/cart.gif', height: 80, fit: BoxFit.fill),
                const SizedBox(width: 12),
                const Text(
                  'Ready To Shop!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
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
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildDotIndicator(),
        ],
      ),
    );
  }

  Widget _buildGradientContainer(Widget child) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF3D5C2), Color(0xFFFFFFFF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SafeArea(child: child),
    );
  }
}
