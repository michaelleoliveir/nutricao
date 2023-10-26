import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF1E4),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'Nutrição',
          style: TextStyle(color: Color(0xFF435334)),
        ),
        backgroundColor: const Color(0xFFFAF1E4),
        actions: const <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.exit_to_app,
              color: Color(0xFF435334),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
