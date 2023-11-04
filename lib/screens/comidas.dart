import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nutricao/items/checkbox_state.dart';

class ComidasPage extends StatefulWidget {
  const ComidasPage({super.key});

  @override
  State<ComidasPage> createState() => _ComidasPage();
}

class _ComidasPage extends State<ComidasPage> {
  final urlImages = [
    'https://images.unsplash.com/photo-1607305387299-a3d9611cd469?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?auto=format&fit=crop&q=80&w=1965&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  final menus = [
    CheckBoxState(title: 'Menu Saudável'),
    CheckBoxState(title: 'Menu Naturel'),
    CheckBoxState(title: 'Menu Matutino'),
  ];

  final categoria = [
    CheckBoxState(title: 'Bebida'),
    CheckBoxState(title: 'Proteína'),
    CheckBoxState(title: 'Carboidrato'),
    CheckBoxState(title: 'Grão'),
    CheckBoxState(title: 'Fruta'),
  ];

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
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 1, 0),
                  padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff435334),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 90,
                      height: 90,
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 1, 0),
                    padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xffcedebd),
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xff435334),
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),

            const Text(
              'Meus Itens:',
              style: TextStyle(
                fontSize: 19,
                color: Color(0xff435334),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            CarouselSlider.builder(
              options: CarouselOptions(
                height: 350,
                reverse: true,
              ),
              itemCount: urlImages.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = urlImages[index];

                return buildImage(urlImage, index);
              },
            ),

            const SizedBox(
              height: 40,
            ),

            const Text(
              'Adicionar itens:',
              style: TextStyle(
                fontSize: 19,
                color: Color(0xff435334),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Center(
              child: Stack(
                children: [
                  Container(
                    width: 190,
                    height: 170,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: const Color(0xff435334),
                      ),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 20,
                            color: const Color(0xff9EB384).withOpacity(0.3))
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.add,
                      size: 30,
                      color: Color(0xff435334),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 4, color: const Color(0xFF435334)),
                          color: const Color(0xFFFAF1E4)),
                      child: const Icon(
                        CupertinoIcons.camera,
                        color: Color(0xFF435334),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Container(
              margin: const EdgeInsets.only(
                  right: 40, left: 40, bottom: 10, top: 20),
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Insira o nome",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(171, 67, 83, 52),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 120),
                    filled: true,
                    fillColor: const Color(0xFFCEDEBD),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Categoria",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(171, 67, 83, 52),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 150),
                    filled: true,
                    fillColor: const Color(0xFFCEDEBD),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            const Text(
              'MENU',
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF435334),
                  fontWeight: FontWeight.bold),
            ),

            Column(
              children: [...menus.map(buildSingleCheckBox).toList()],
            ),

            const SizedBox(
              height: 25,
            ),

            const Text(
              'CATEGORIA',
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF435334),
                  fontWeight: FontWeight.bold),
            ),

            Column(
              children: [...categoria.map(buildSingleCheckBox).toList()],
            ),

            Container(
              padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/main');
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      "CANCELAR",
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Color(0xFF435334)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/main');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF435334),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'SALVAR',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Color(0xFFFAF1E4),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 30,
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

  Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
      activeColor: const Color(0xFF435334),
      controlAffinity: ListTileControlAffinity.leading,
      value: checkbox.value,
      title: Text(
        checkbox.title,
        style: const TextStyle(color: Color(0xFF435334)),
      ),
      onChanged: (value) => setState(() => checkbox.value = value!));
}
