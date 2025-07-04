import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'kyc_second_screen.dart';
import 'dart:io';

// Replace this import with your actual second screen import later
// import 'package:your_app/kyc_second_screen.dart';

class KycVerificationScreen extends StatefulWidget {
  const KycVerificationScreen({Key? key}) : super(key: key);

  @override
  State<KycVerificationScreen> createState() => _KycVerificationScreenState();
}

class _KycVerificationScreenState extends State<KycVerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mailIdController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _gstinController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _businessContactController = TextEditingController();
  String? _coreBusiness;

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

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
      });
    }
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
                  Image.asset(
                    'assets/images/kyc1.gif',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '"Safe, Secure, And Hassle-Free KYC."',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '"Submit Your Details And Unlock Access To All KISANGRO B2B Products"',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
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
                  _buildGSTField(),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_aadhaarController, "Aadhaar Number (Owner)"),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_panController, "Business PAN Number (Optional)"),
                  const SizedBox(height: 12),
                  _buildDropdownField(),
                  const SizedBox(height: 12),
                  _buildAnimatedTextField(_businessContactController, "Business Contact Number"),
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
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _isFormValid
                          ? () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => KycSecondScreen()));
                            }
                          : null,
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
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAnimatedTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFF3C9A8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  Widget _buildGSTField() {
    return TextFormField(
      controller: _gstinController,
      decoration: InputDecoration(
        labelText: 'GSTIN',
        filled: true,
        fillColor: const Color(0xFFF3C9A8),
        suffixIcon: ElevatedButton(
         onPressed: () {
  if (_formKey.currentState!.validate()) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KycVerificationScreen2(
          formData: {
            'fullName': _fullNameController.text,
            'mailId': _mailIdController.text,
            'whatsapp': _whatsappController.text,
            'businessName': _businessNameController.text,
            'gstin': _gstinController.text,
            'aadhaar': _aadhaarController.text,
            'pan': _panController.text,
            'businessContact': _businessContactController.text,
            'coreBusiness': _coreBusiness ?? '',
          },
        ),
      ),
    );
  }
}
,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Verify',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
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
                  border: Border.all(color: Colors.grey, style: BorderStyle.solid),
                  shape: BoxShape.circle,
                ),
                child: _pickedImage == null
                    ? const Icon(Icons.camera_alt, size: 40, color: Colors.orange)
                    : ClipOval(
                        child: Image.file(
                          File(_pickedImage!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.edit, size: 16, color: Colors.white),
                ),
              )
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
