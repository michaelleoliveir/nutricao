import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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