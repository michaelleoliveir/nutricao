import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutricao/items/checkbox_state.dart';
import 'package:nutricao/BD/database_helper.dart';

class CadastroCardapio extends StatefulWidget {
  const CadastroCardapio({super.key});

  @override
  State<CadastroCardapio> createState() => _CadastroCardapioState();
}

class _CadastroCardapioState extends State<CadastroCardapio> {
  Map<String, List<CheckBoxState>> categorias = {
    'Café': [],
    'Almoço': [],
    'Janta': [],
  };

  @override
  void initState() {
    super.initState();
    _carregarItensDoBanco();
  }

  Future<void> _carregarItensDoBanco() async {
    final itens = await Database.exibeTodosRegistrosIten();

    for (var item in itens) {
      final checkBoxState = CheckBoxState(title: item['nome']);
      final categoria = item['categoria'];
      if (categorias.containsKey(categoria)) {
        categorias[categoria]!.add(checkBoxState);
      }
    }

    setState(() {});
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
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Insira o nome do cardápio:',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 111, 133, 90),
                      fontSize: 18,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 77),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              padding: const EdgeInsets.only(top: 8, right: 18),
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                color: const Color(0xffcedebd),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text(
                      'Opções de Café',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff435334),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  _buildOpcoesRefeicao('Café', categorias['Café']!),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              padding: const EdgeInsets.only(top: 8, right: 18),
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                color: const Color(0xffcedebd),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text(
                      'Opções de Almoço',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff435334),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  _buildOpcoesRefeicao('Almoço', categorias['Almoço']!),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              padding: const EdgeInsets.only(top: 8, right: 18),
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                color: const Color(0xffcedebd),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text(
                      'Opções de Janta',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff435334),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  _buildOpcoesRefeicao('Janta', categorias['Janta']!),
                ],
              ),
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
                padding: const EdgeInsets.only(left: 145),
                child: const Row(
                  children: [
                    Icon(CupertinoIcons.info, color: Color(0xFF435334)),
                    Text(
                      ' Sobre o app',
                      style: TextStyle(color: Color(0xFF435334)),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpcoesRefeicao(String categoria, List<CheckBoxState> items) {
    return Column(
      children: items.map(buildSingleCheckBox).toList(),
    );
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
      activeColor: const Color(0xFF435334),
      controlAffinity: ListTileControlAffinity.leading,
      value: checkbox.value,
      title: Text(
        checkbox.title,
        style: const TextStyle(color: Color(0xFF435334), fontSize: 14),
      ),
      onChanged: (value) => setState(() => checkbox.value = value!));
}
