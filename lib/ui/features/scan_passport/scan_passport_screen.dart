import 'package:e_election/ui/features/scan_passport/widgets/scan_password_body.dart';
import 'package:flutter/cupertino.dart';

class ScanPassportScreen extends StatelessWidget {
  static const routeName = '/scanPassportScreen';
  const ScanPassportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScanPasswordBody();
  }
}
