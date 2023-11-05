import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';

class CardapioPage extends StatefulWidget {
  const CardapioPage({super.key});

  compartilhamentoMenu() {
    SocialShare.shareOptions("Confira o meu menu na Naturel agora");
  }

  @override
  State<CardapioPage> createState() => _CardapioPage();
}

class _CardapioPage extends State<CardapioPage> {
  compartilharMenu() {
    widget.compartilhamentoMenu();
  }

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
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: compartilharMenu,
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

            const Text(
              'Meus cardápios:',
              style: TextStyle(
                fontSize: 17,
                color: Color(0xff435334),
                height: 3,
              ),
            ),

            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 0, 7),
                padding: const EdgeInsets.fromLTRB(10, 10, 13, 5),
                child: const Card(
                  color: Color(0xffcedebd),
                  elevation: 0,
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.symmetric(vertical: 10),
                    iconColor: Color(0xFF435334),
                    collapsedIconColor: Color(0xFF435334),
                    title: Text(
                      'Cardápio Naturel',
                      style: TextStyle(
                        color: Color(0xFF435334),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                    children: [
                      Text(
                        'Opções de Café:',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF435334),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        'Café',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Fruta',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Suco',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Pão Integral',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Opções de Almoço:',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF435334),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        'Carne Vermelha',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Arroz',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Salada',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Opções de Janta:',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF435334),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        'Carne Branca',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Feijão',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Salada',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 0, 7),
                padding: const EdgeInsets.fromLTRB(10, 5, 13, 5),
                child: const Card(
                  color: Color(0xffcedebd),
                  elevation: 0,
                  child: ExpansionTile(
                    childrenPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    iconColor: Color(0xFF435334),
                    collapsedIconColor: Color(0xFF435334),
                    title: Text(
                      'Cardápio Carboidrato',
                      style: TextStyle(
                        color: Color(0xFF435334),
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                    children: [
                      Text(
                        'Opções de Café:',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF435334),
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Pão',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Panettone',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Rosca',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Leite',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Opções de Almoço:',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF435334),
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Macarrão',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Arroz',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Purê',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Opções de Janta:',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF435334),
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Pastel',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Pizza',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Esfiha',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 0, 7),
                padding: const EdgeInsets.fromLTRB(10, 5, 13, 5),
                child: const Card(
                  color: Color(0xffcedebd),
                  elevation: 0,
                  child: ExpansionTile(
                    childrenPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    iconColor: Color(0xFF435334),
                    collapsedIconColor: Color(0xFF435334),
                    title: Text(
                      'Cardápio Italiano',
                      style: TextStyle(
                        color: Color(0xFF435334),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                    children: [
                      Text(
                        'Opções de Café:',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF435334),
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Salada',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Panettone',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Pão',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Opções de Almoço:',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF435334),
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Macarrão',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Salada',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Vinho',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Opções de Janta:',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF435334),
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Refrigerante',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                      Text(
                        'Pizza',
                        style:
                            TextStyle(color: Color(0xFF435334), fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
