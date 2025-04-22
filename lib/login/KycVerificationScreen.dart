import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class KycVerificationScreen extends StatefulWidget {
  const KycVerificationScreen({Key? key}) : super(key: key);

  @override
  State<KycVerificationScreen> createState() => _KycVerificationScreenState();
}

class _KycVerificationScreenState extends State<KycVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(8, (_) => TextEditingController());
  final _focusNodes  = List.generate(8, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes)  f.dispose();
    super.dispose();
  }

  Widget _buildAnimatedField({
    required int index,
    required String hint,
    bool optional = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint + (optional ? ' (Optional)' : ''),
          filled: true,
          fillColor: const Color(0xFFF3D5C2),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE06C1E)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFE06C1E),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3D5C2), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // Lottie animation instead of static PNG
                  SizedBox(
                    height: 120,
                    child: Lottie.asset(
                      'assets/lottie/kyc_animation.json',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Headline & subtitle
                  const Text(
                    '"Safe, Secure, And Hassle‑Free KYC."',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '"Submit Your Details And Unlock Access To All KISANGRO B2B Products"',
                    textAlign: TextAlign.center,
                  ),
                  const Divider(height: 32, thickness: 1),

                  // Primary Details
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Primary Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE06C1E),
                      ),
                    ),
                  ),
                  _buildAnimatedField(index: 0, hint: 'Full Name'),
                  _buildAnimatedField(
                    index: 1,
                    hint: 'Mail Id',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildAnimatedField(
                    index: 2,
                    hint: 'WhatsApp Number',
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 16),
                  // Business Details
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Business Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE06C1E),
                      ),
                    ),
                  ),
                  _buildAnimatedField(index: 3, hint: 'Business Name'),
                  _buildAnimatedField(index: 4, hint: 'GSTIN'),
                  _buildAnimatedField(
                    index: 5,
                    hint: 'Aadhaar Number (Owner)',
                    keyboardType: TextInputType.number,
                  ),
                  _buildAnimatedField(
                    index: 6,
                    hint: 'Business PAN Number',
                    optional: true,
                  ),

                  // Core Business Dropdown
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3D5C2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE06C1E)),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(border: InputBorder.none),
                      hint: const Text('Nature Of Core Business'),
                      items: [
                        'Retail',
                        'Wholesale',
                        'Processing',
                        'Other',
                      ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (_) {},
                    ),
                  ),

                  const SizedBox(height: 16),
                  // Business Contact (read‑only)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3D5C2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE06C1E)),
                    ),
                    child: const Text('+91 98765 43210'),
                  ),

                  const SizedBox(height: 24),
                  // Establishment Photo
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Establishment Photo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE06C1E),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      // TODO: open camera or gallery
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black26,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Icon(Icons.camera_alt, color: Color(0xFFE06C1E)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Take photo of the shop with good quality',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),
                  const Text(
                    '(Note: A verification team will be arriving within 3 working days at the given address to verify your business. Make sure you are available at that time.)',
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),
                  // Next button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE06C1E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Validate & submit KYC
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
