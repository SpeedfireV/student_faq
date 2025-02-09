

import 'package:flutter/cupertino.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class SessionQrScanPage extends StatefulWidget {
  const SessionQrScanPage({super.key});

  @override
  State<SessionQrScanPage> createState() => _SessionQrScanPageState();
}

class _SessionQrScanPageState extends State<SessionQrScanPage> {
  final MobileScannerController controller = MobileScannerController(
    // required options for the scanner
  );
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
