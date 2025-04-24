import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp_screen.dart'; // Make sure this file exists

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String _countryCode = '+91';
  String _mobileNumber = '';
  bool _acceptedTerms = false;

  String get _completePhoneNumber => '$_countryCode$_mobileNumber';

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

                // Row with IntlPhoneField and phone number
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                      child: IntlPhoneField(
                        showDropdownIcon: true,
                        showCountryFlag: true,
                        showCursor: false,
                        disableLengthCheck: true,
                        dropdownTextStyle: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          counterText: "", // removes 0/10
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          setState(() {
                            _countryCode = phone.countryCode;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter mobile number',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _mobileNumber = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Safe info with icon on same line
                Row(
                  children: const [
                    Text(
                      'Don’t worry your details are safe with us.',
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.verified_user, color: Colors.orange, size: 18),
                  ],
                ),

                const SizedBox(height: 16),

                // Terms and conditions
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

                // Send OTP button
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
                    onPressed: _acceptedTerms &&
                            _mobileNumber.isNotEmpty &&
                            _countryCode.isNotEmpty
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
