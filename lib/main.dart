import 'package:flutter/material.dart';
import 'utils/service_locator.dart' as di;
import 'presentation/pages/login_page.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
