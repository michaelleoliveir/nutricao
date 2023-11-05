import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Color(0xFFFAF1E4), BlendMode.dstATop),
                  opacity: 0.30)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              const Positioned(
                top: 70, // Ajuste a posição vertical
                left: 89, // Ajuste a posição horizontal
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  height: 230,
                  width: 230,
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
                      child: TextFormField(
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
                                borderSide: const BorderSide(
                                    color: Colors.transparent))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: TextFormField(
                        obscureText: true,
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
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
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
              Container(
                height: 550,
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main');
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF9EB384)),
                    minimumSize: MaterialStatePropertyAll(Size(130, 50)),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 18, color: Color(0xFF435334)),
                  ),
                ),
              ),
/*              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 600),
                    child: IconButton(
                      onPressed: null,
                      icon: FaIcon(FontAwesomeIcons.userPlus),
                      style: ButtonStyle(
                          iconSize: MaterialStatePropertyAll(30),
                          iconColor:
                              MaterialStatePropertyAll(Color(0xFF435334)),
                          alignment: Alignment.center),
                    ),
                  ),
                ],
              ),*/
              Positioned(
                top: 579,
                left: 71,
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 1,
                  color: const Color.fromARGB(212, 129, 136, 119),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 600, left: 149),
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(
                      height: 2,
                      color: Color(0xFF435334),
                      fontSize: 18,
                      //backgroundColor: Color.fromARGB(230, 175, 211, 182),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
