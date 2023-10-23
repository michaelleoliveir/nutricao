import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFCEDEBD)),
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
          DecoratedBox(
            position: DecorationPosition.background,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                opacity: 0.20,
              ),
            ),
            child: Container(),
          ),
          Positioned(
            top: 120, // Ajuste a posição vertical
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
                  height: 270,
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
                        ),
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
                        ),
                        contentPadding: const EdgeInsets.all(13),
                        filled: true,
                        fillColor: const Color(0xFF9EB384),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 232,
            child: Text(
              'Esqueci minha senha',
              style: TextStyle(height: 65, color: Color(0xFF435334)),
            ),
          ),
          const Positioned(
              bottom: 229,
              left: 135,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF9EB384)),
                  minimumSize: MaterialStatePropertyAll(Size(130, 50)),
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18, color: Color(0xFF435334)),
                ),
              )),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 610),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.facebook),
                      style: ButtonStyle(
                          iconSize: MaterialStatePropertyAll(40),
                          iconColor:
                              MaterialStatePropertyAll(Color(0xFF435334)),
                          alignment: Alignment.center),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                      style: ButtonStyle(
                          iconSize: MaterialStatePropertyAll(40),
                          iconColor:
                              MaterialStatePropertyAll(Color(0xFF435334)),
                          alignment: Alignment.center),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: FaIcon(FontAwesomeIcons.google),
                      style: ButtonStyle(
                          iconSize: MaterialStatePropertyAll(30),
                          iconColor:
                              MaterialStatePropertyAll(Color(0xFF435334)),
                          alignment: Alignment.center),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 250,
                height: 1,
                color: const Color(0xFF818877),
              ),
              const Text(
                'Cadastre-se',
                style: TextStyle(
                    height: 3, color: Color(0xFF818877), fontSize: 15),
              )
            ],
          ),
        ],
      ),
    );
  }
}
