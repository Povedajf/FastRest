import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/comida_widget.dart';
import 'package:flutter_application_1/widgets/principal_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false,
      home: PrincipalWidget(),
    );
  }
}
