// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:nutricao/BD/database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: true,
        title: 'Naturel',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const ComidasPage());
  }
}

class ComidasPage extends StatefulWidget {
  const ComidasPage({Key? key}) : super(key: key);

  @override
  State<ComidasPage> createState() => _HomePageState();
}

class _HomePageState extends State<ComidasPage> {
  final imagePicker = ImagePicker();
  File? imageFile;
  pick(ImageSource source) async {
    final PickedFile = await imagePicker.pickImage(source: source);

    if (PickedFile != null) {
      setState(() {
        imageFile = File(PickedFile.path);
      });
    }
  }

  // Retorna todos os registros da tabela
  List<Map<String, dynamic>> _registros = [];

  // Aparece enquanto os dados não são carregados
  bool _isLoading = true;

  //Essa função retorna todos os registros da tabela
  void _exibeTodosRegistrosIten() async {
    final data = await Database.exibeTodosRegistrosIten();
    setState(() {
      _registros = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    //Atualiza a lista de registros quando o aplicativo é iniciado
    _exibeTodosRegistrosIten();
  }

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();

  // Esta função será acionada quando o botão for pressionado
  // Também será acionado quando um item for inserido, atualizado ou removido
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> Criando um novo item
      // id != null -> Atualizando um item existente
      final registroExistente =
          _registros.firstWhere((element) => element['id'] == id);
      _nomeController.text = registroExistente['nome'];
      _categoriaController.text = registroExistente['categoria'];
      _tipoController.text = registroExistente['tipo'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // Isso impedirá que o teclado programável cubra os campos de texto
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            imageFile != null ? FileImage(imageFile!) : null,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          pick(ImageSource.gallery);
                        },
                        icon: Icon(Icons.add_photo_alternate_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'ALIMENTO',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF435334),
                        fontWeight: FontWeight.bold,
                        height: 2),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nomeController,
                    decoration: InputDecoration(
                      hintText: "Nome",
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(171, 67, 83, 52),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 50),
                      filled: true,
                      fillColor: const Color(0xFFCEDEBD),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'CATEGORIA',
                    style: TextStyle(
                        fontSize: 18,
                        height: 2,
                        color: Color(0xFF435334),
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _categoriaController,
                    decoration: InputDecoration(
                      hintText: "Café, almoço, janta",
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(171, 67, 83, 52),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 50),
                      filled: true,
                      fillColor: const Color(0xFFCEDEBD),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'TIPO',
                    style: TextStyle(
                        fontSize: 18,
                        height: 2,
                        color: Color(0xFF435334),
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _tipoController,
                    decoration: InputDecoration(
                      hintText: "bebida, proteína, carboidrato, fruta, grão",
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(171, 67, 83, 52),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 50),
                      filled: true,
                      fillColor: const Color(0xFFCEDEBD),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Salva o registro
                      if (id == null) {
                        await _insereItens();
                      }

                      if (id != null) {
                        await _atualizaRegistroItens(id);
                      }

                      // Limpa os campos
                      _nomeController.text = '';
                      _categoriaController.text = '';
                      _tipoController.text = '';

                      // Fecha o modal de inserção/alteração
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Novo item' : 'Atualizar'),
                  )
                ],
              ),
            ));
  }

  // Insere um novo registro
  Future<void> _insereItens() async {
    await Database.insereItens(
        _nomeController.text, _categoriaController.text, _tipoController.text);
    _exibeTodosRegistrosIten();
  }

  // Atualiza um registro
  Future<void> _atualizaRegistroItens(int id) async {
    await Database.atualizaRegistroItens(id, _nomeController.text,
        _categoriaController.text, _tipoController.text);
    _exibeTodosRegistrosIten();
  }

  // Remove um registro
  void _removeRegistroIten(int id) async {
    await Database.removeRegistroIten(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Registro removido com sucesso!'),
    ));
    _exibeTodosRegistrosIten();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Item'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _registros.length,
              itemBuilder: (context, index) => Card(
                color: Color.fromARGB(255, 237, 250, 211),
                margin: const EdgeInsets.all(15),
                child: ListTile(
                    title: Text(_registros[index]['nome']),
                    subtitle: Text(_registros[index]['categoria']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showForm(_registros[index]['id']),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                _removeRegistroIten(_registros[index]['id']),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
