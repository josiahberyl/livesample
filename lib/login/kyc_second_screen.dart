import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'KycInProcessScreen.dart';


class KycVerificationScreen2 extends StatefulWidget {
  final Map<String, String> formData;

  const KycVerificationScreen2({Key? key, required this.formData}) : super(key: key);

  @override
  State<KycVerificationScreen2> createState() => _KycVerificationScreen2State();
}

class _KycVerificationScreen2State extends State<KycVerificationScreen2> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;

  late TextEditingController _fullNameController;
  late TextEditingController _mailIdController;
  late TextEditingController _whatsappController;
  late TextEditingController _businessNameController;
  late TextEditingController _gstinController;
  late TextEditingController _aadhaarController;
  late TextEditingController _panController;
  late TextEditingController _businessContactController;

  String? _coreBusiness;
  late AnimationController _animationController;
  late Animation<double> _bounceAnimation;

  bool get _isFormValid {
    return _fullNameController.text.isNotEmpty &&
        _mailIdController.text.isNotEmpty &&
        _whatsappController.text.isNotEmpty &&
        _businessNameController.text.isNotEmpty &&
        _gstinController.text.isNotEmpty &&
        _aadhaarController.text.isNotEmpty &&
        _businessContactController.text.isNotEmpty &&
        _coreBusiness != null;
  }

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.formData['fullName'] ?? '');
    _mailIdController = TextEditingController(text: widget.formData['mailId'] ?? '');
    _whatsappController = TextEditingController(text: widget.formData['whatsapp'] ?? '');
    _businessNameController = TextEditingController(text: widget.formData['businessName'] ?? '');
    _gstinController = TextEditingController(text: widget.formData['gstin'] ?? '');
    _aadhaarController = TextEditingController(text: widget.formData['aadhaar'] ?? '');
    _panController = TextEditingController(text: widget.formData['pan'] ?? '');
    _businessContactController = TextEditingController(text: widget.formData['businessContact'] ?? '');
    _coreBusiness = widget.formData['coreBusiness'];

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _bounceAnimation = Tween<double>(begin: 1.0, end: 1.2)
        .chain(CurveTween(curve: Curves.elasticOut))
        .animate(_animationController);
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
      });
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
              onChanged: () => setState(() {}),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Image.asset('assets/images/kyc1.gif', width: 120, height: 120),
                  const SizedBox(height: 20),
                  const Text('"Safe, Secure, And Hassle-Free KYC."',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  const Divider(thickness: 1),
                  const SizedBox(height: 16),
                  _buildSectionTitle("Primary Details"),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_fullNameController, "Full Name"),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_mailIdController, "Mail Id"),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_whatsappController, "WhatsApp Number"),
                  const SizedBox(height: 20),
                  _buildSectionTitle("Business Details"),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_businessNameController, "Business Name"),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_gstinController, "GSTIN"),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_aadhaarController, "Aadhaar Number (Owner)"),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_panController, "Business PAN Number (Optional)"),
                  const SizedBox(height: 12),
                  _buildDropdownField(),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_businessContactController, "Business Contact Number"),
                  const SizedBox(height: 20),
                  
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Business Details from GSTIN:\nMadhuram Enterprises,\n68, Vellalar St, Ayyappakkam,\nChennai, Tamil Nadu 600077",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),

                  const SizedBox(height: 24),
                  _buildSectionTitle("Establishment Photo"),
                  const SizedBox(height: 16),
                  _buildPhotoUploader(),
                  const SizedBox(height: 20),
                  const Text(
                    '(Note: A verification team will be arriving within 3 working days at the given address to verify your business. Make sure you are available at that time.)',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange.withOpacity(_isFormValid ? 1.0 : 0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _isFormValid ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const KycInProcessScreen()),
                        );
                      } : null,
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: const TextStyle(
              fontSize: 16, color: Colors.deepOrange, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildAnimatedTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        filled: true,
        fillColor: const Color(0xFFF3C9A8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3C9A8),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(border: InputBorder.none),
        hint: const Text('Nature Of Core Business'),
        value: _coreBusiness,
        onChanged: (value) {
          setState(() {
            _coreBusiness = value;
          });
        },
        items: ['Retail', 'Wholesale', 'Manufacturing']
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
      ),
    );
  }

  Widget _buildPhotoUploader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: _pickedImage == null
                      ? const Icon(Icons.camera_alt, size: 40, color: Colors.orange)
                      : Image.file(File(_pickedImage!.path), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ScaleTransition(
                  scale: _bounceAnimation,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Take photo of the shop with good quality',
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }
}
