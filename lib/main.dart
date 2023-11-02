import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/main.dart';
import 'screens/search.dart';
import 'screens/cadastro_cardapio.dart';
import 'screens/profile.dart';
import 'screens/comidas.dart';
import 'screens/info.dart';

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
      home: const LoginPage(),
      routes: {
        '/main': (context) => const MainPage(),
        '/search': (context) => const SearchScreen(),
        '/home': (context) => const LoginPage(),
        '/cadastro': (context) => const CadastroCardapio(),
        '/profile': (context) => const ProfilePage(),
        '/comidas' : (context) => const ComidasPage(),
        '/info' : (context) => const InfoPage(),
      },
    );
  }
}
