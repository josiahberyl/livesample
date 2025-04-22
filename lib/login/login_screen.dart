import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp_screen.dart'; // Make sure this file exists

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String _completePhoneNumber = '';
  bool _acceptedTerms = false;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Login/Register',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE06C1E),
                  ),
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'OTP (One Time Password) will be sent to this number',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 16),

                // Phone number input with country code picker
                IntlPhoneField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Enter mobile number',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    setState(() {
                      _completePhoneNumber = phone.completeNumber;
                    });
                  },
                ),

                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.verified_user, color: Colors.orange, size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Don’t worry your details are safe with us.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.orange,
                      value: _acceptedTerms,
                      onChanged: (val) {
                        setState(() {
                          _acceptedTerms = val ?? false;
                        });
                      },
                    ),
                    const Text('I accept the '),
                    GestureDetector(
                      onTap: () {
                        // TODO: Navigate to Terms page
                      },
                      child: const Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Colors.orange,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text(' of Aura.'),
                  ],
                ),
                const Spacer(),
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
                    onPressed: _acceptedTerms && _completePhoneNumber.isNotEmpty
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(
                                  phoneNumber: _completePhoneNumber,
                                ),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      'Send OTP',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
