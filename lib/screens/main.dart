import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final urlImages = [
    'https://images.unsplash.com/photo-1607305387299-a3d9611cd469?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?auto=format&fit=crop&q=80&w=1965&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF1E4),
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 9,
        shadowColor: const Color.fromARGB(255, 230, 221, 209),
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BARRA DE PESQUISA
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Container(
                margin: const EdgeInsets.only(
                    top: 25, bottom: 30, left: 10, right: 10),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffcedebd),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0.25, 50, 0.5),
                      width: 13.5,
                      height: 30,
                      child: const Icon(
                        Icons.search,
                        size: 30,
                        color: Color(0xFF435334),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                      child: const Text(
                        'Tente “Menu matutino”',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color(0xFF435334),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // IMAGEM DA MULHER
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: const Text(
                    'Olá!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      height: 2,
                      color: Color(0xff435334),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xff435334),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 110,
                      height: 110,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffd9d9d9),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/woman.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // CARROSEL DE ITENS
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Principais itens cadastrados',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff435334),
                    height: 3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/comidas');
                  },
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 350,
                      reverse: true,
                      enlargeCenterPage: true,
                    ),
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];

                      return buildImage(urlImage, index);
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Cardápios cadastrados',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff435334),
                    height: 3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cardapio');
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 7),
                    padding: const EdgeInsets.fromLTRB(16, 25, 25, 16),
                    width: 365,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xffcedebd),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 0, 3),
                          child: const Text(
                            'Cardápio Naturel',
                            style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w600,
                              height: 2.3,
                              color: Color(0xff435334),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cardapio');
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 7),
                    padding: const EdgeInsets.fromLTRB(16, 25, 25, 16),
                    width: 365,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xffcedebd),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 0, 3),
                          child: const Text(
                            'Cardápio Carboidrato',
                            style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w600,
                              height: 2.3,
                              color: Color(0xff435334),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cardapio');
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 7),
                    padding: const EdgeInsets.fromLTRB(16, 25, 25, 16),
                    width: 365,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xffcedebd),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 0, 3),
                          child: const Text(
                            'Cardápio Italiano',
                            style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w600,
                              height: 2.3,
                              color: Color(0xff435334),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 7),
                    padding: const EdgeInsets.fromLTRB(16, 8, 18, 16),
                    width: 150,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xffcedebd),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFF435334),
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/info');
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 127),
                    child: const Row(
                      children: [
                        Icon(
                          CupertinoIcons.info,
                          color: Color(0xFF435334),
                        ),
                        Text(
                          ' Sobre o aplicativo',
                          style: TextStyle(color: Color(0xFF435334)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), // Define o raio da borda
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}
