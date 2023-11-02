import 'package:flutter/material.dart';

class ComidasPage extends StatefulWidget {
  const ComidasPage({super.key});

  @override
  State<ComidasPage> createState() => _ComidasPage();
}

class _ComidasPage extends State<ComidasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF1E4),
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 9,
        shadowColor: const Color.fromARGB(255, 230, 221, 209),
        automaticallyImplyLeading: true,
        title: const Text(
          'Naturel',
          style: TextStyle(color: Color(0xFF435334)),
        ),
        backgroundColor: const Color(0xFFFAF1E4),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.exit_to_app,
                color: Color(0xFF435334),
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
