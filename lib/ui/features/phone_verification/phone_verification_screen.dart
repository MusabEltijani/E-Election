import 'package:e_election/ui/features/phone_verification/widgets/phone_verification_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneVerificationScreen extends StatelessWidget {
  static const String routeName = '/phoneVerificationScreen';
  final String passportNumber;

  const PhoneVerificationScreen({
    super.key,
    required this.passportNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhoneVerificationBody(passportNumber: passportNumber),
    );
  }
}
