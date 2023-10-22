import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrição',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                  opacity: 0.30),
            ),
          ),
          Positioned(
            top: 225, // Ajuste a posição vertical
            left: 122, // Ajuste a posição horizontal
            child: Image.asset(
              'assets/user.png',
              width: 147, // Ajuste a largura
              height: 147, // Ajuste a altura
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 375,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF435334),
                            fontFamily: 'Inter'),
                        contentPadding: const EdgeInsets.all(13),
                        filled: true,
                        fillColor: const Color(0xFF9EB384),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Senha",
                        hintStyle: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF435334),
                            fontFamily: 'Inter'),
                        contentPadding: const EdgeInsets.all(13),
                        filled: true,
                        fillColor: const Color(0xFF9EB384),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  ),
                ),
                const Stack(
                  children: [
                    Positioned(
                      right: 30,
                      left: 30,

                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 102, 102),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
