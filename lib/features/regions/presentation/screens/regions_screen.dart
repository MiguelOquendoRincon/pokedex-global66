import 'package:flutter/material.dart';

class RegionsScreen extends StatefulWidget {
  const RegionsScreen({super.key});

  @override
  State<RegionsScreen> createState() => _RegionsScreenState();
}

class _RegionsScreenState extends State<RegionsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Regions')));
  }
}
