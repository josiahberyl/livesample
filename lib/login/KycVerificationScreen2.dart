import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'KycInProcessScreen.dart';

class KYCVerificationScreen2 extends StatefulWidget {
  const KYCVerificationScreen2({super.key});

  @override
  State<KYCVerificationScreen2> createState() => _KYCVerificationScreen2State();
}

class _KYCVerificationScreen2State extends State<KYCVerificationScreen2>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(11, (_) => TextEditingController());
  String? _coreBusiness;
  bool _isPhotoUploaded = false;
  late AnimationController _editAnimationController;

  bool get _isFormFilled {
    return _controllers
            .asMap()
            .entries
            .where((e) => e.key != 2) // Optional field
            .every((e) => e.value.text.trim().isNotEmpty) &&
        _coreBusiness != null &&
        _isPhotoUploaded;
  }

  void _goToInProcessScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KYCInProcessScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _editAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.8,
      upperBound: 1.2,
    )..repeat(reverse: true);

    for (var c in _controllers) {
      c.addListener(() => setState(() {}));
    }

    // Example pre-filled data from previous KYC screen
    _controllers[0].text = "27ABCDE1234F2Z5"; // GSTIN
    _controllers[1].text = "ABC Enterprises"; // Business Name
    _controllers[2].text = "John Doe"; // Owner Name
    _controllers[3].text = "john@example.com"; // Email
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    _editAnimationController.dispose();
    super.dispose();
  }

  Widget _buildFloatingField({
    required int index,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool optional = false,
  }) {
    return TextFormField(
      controller: _controllers[index],
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label + (optional ? ' (Optional)' : ''),
        filled: true,
        fillColor: const Color(0xFFF3D5C2),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE06C1E)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE06C1E), width: 2),
        ),
      ),
    );
  }

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(child: Image.asset('assets/images/kyc1.gif', height: 150)),
                  const SizedBox(height: 16),
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          '"Safe, Secure, And Hassle-Free KYC."',
                          style: TextStyle(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 6),
                        Text(
                          '"Submit Your Details And Unlock Access To All KISANGRO B2B Products"',
                          style: TextStyle(fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 32, thickness: 1),

                  const Text(
                    'Primary Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE06C1E)),
                  ),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 0, label: 'GSTIN'),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 1, label: 'Business Name'),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 2, label: 'Owner Name'),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 3, label: 'Email ID', keyboardType: TextInputType.emailAddress),

                  const SizedBox(height: 16),
                  const Text(
                    'Additional Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE06C1E)),
                  ),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 4, label: 'Business Type'),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 5, label: 'Business Contact Number', keyboardType: TextInputType.phone),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 6, label: 'Alternate Contact (Optional)', optional: true),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 7, label: 'GST Registered Address'),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 8, label: 'City'),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 9, label: 'State'),
                  const SizedBox(height: 8),
                  _buildFloatingField(index: 10, label: 'Pincode', keyboardType: TextInputType.number),

                  const SizedBox(height: 16),
                  const Text(
                    'Nature of Core Business',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE06C1E)),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _coreBusiness,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF3D5C2),
                      hintText: 'Select your core business',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE06C1E)),
                      ),
                    ),
                    items: ['Retail', 'Wholesale', 'Processing', 'Other']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => setState(() => _coreBusiness = val),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Establishment Photo',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE06C1E)),
                  ),
                  const SizedBox(height: 12),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() => _isPhotoUploaded = true);
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black45,
                              width: 1.5,
                            ),
                          ),
                          child: Center(child: Icon(Icons.camera_alt, color: Colors.orange.shade700)),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: ScaleTransition(
                          scale: _editAnimationController,
                          child: const CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('Take photo of the shop with good quality'),
                  const SizedBox(height: 12),
                  const Text(
                    '(Note: A verification team will be arriving within 3 working days at the given address to verify your business. Make sure you are available at that time.)',
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isFormFilled ? _goToInProcessScreen : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE06C1E),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Next', style: TextStyle(fontSize: 16)),
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
