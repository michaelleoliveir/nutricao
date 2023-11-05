//main.dart
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:nutricao/BD/database_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
//import 'database_helper.dart';

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
        scaffoldBackgroundColor: const Color(0xFFFAF1E4),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _HomePageState();
}

class _HomePageState extends State<ProfilePage> {
  final imagePicker = ImagePicker();
  File? imageFile;
  pick(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  // Retorna todos os registros da tabela
  List<Map<String, dynamic>> _registros = [];

  // Aparece enquanto os dados não são carregados
  bool _isLoading = true;

  //Essa função retorna todos os registros da tabela
  void _exibeTodosRegistrosUsu() async {
    final data = await Database.exibeTodosRegistrosUsu();
    setState(() {
      _registros = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    //Atualiza a lista de registros quando o aplicativo é iniciado
    _exibeTodosRegistrosUsu();
  }

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _datanasciController = TextEditingController();

  // Esta função será acionada quando o botão for pressionado
  // Também será acionado quando um item for inserido, atualizado ou removido
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> Criando um novo item
      // id != null -> Atualizando um item existente
      final registroExistente =
          _registros.firstWhere((element) => element['id'] == id);
      _nomeController.text = registroExistente['nome'];
      _emailController.text = registroExistente['email'];
      _senhaController.text = registroExistente['senha'];
      _datanasciController.text = registroExistente['datanasci'];
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
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
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
                        icon: const Icon(Icons.add_photo_alternate_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _senhaController,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                  ),
                  TextField(
                    controller: _datanasciController,
                    decoration:
                        const InputDecoration(labelText: 'Data Nascimento'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text(
                          "CANCELAR",
                          style: TextStyle(
                              //fontSize: 15,
                              letterSpacing: 1,
                              color: Color(0xFF435334)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Salva o registro
                          if (id == null) {
                            await _insereUsuario();
                          }

                          if (id != null) {
                            await _atualizaRegistroUsu(id);
                          }

                          // Limpa os campos
                          _nomeController.text = '';
                          _emailController.text = '';
                          _senhaController.text = '';
                          _datanasciController.text = '';

                          // Fecha o modal de inserção/alteração
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, '/main');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 152, 177, 128),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Text(id == null ? 'Novo registro' : 'Atualizar'),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }

  // Insere um novo registro
  Future<void> _insereUsuario() async {
    await Database.insereUsuario(_nomeController.text, _emailController.text,
        _senhaController.text, _datanasciController.text);
    _exibeTodosRegistrosUsu();
  }

  // Atualiza um registro
  Future<void> _atualizaRegistroUsu(int id) async {
    await Database.atualizaRegistroUsu(
        id,
        _nomeController.text,
        _emailController.text,
        _senhaController.text,
        _datanasciController.text);
    _exibeTodosRegistrosUsu();
  }

  // Remove um registro
  void _removeRegistroUsu(int id) async {
    await Database.removeRegistroUsu(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Registro removido com sucesso!'),
    ));
    _exibeTodosRegistrosUsu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: _isLoading
          ? const Center(
              //child: CircularProgressIndicator(),
              )
          : ListView.builder(
              itemCount: _registros.length,
              itemBuilder: (context, index) => Card(
                color: const Color.fromARGB(255, 237, 250, 211),
                margin: const EdgeInsets.all(15),
                child: ListTile(
                    //faz sumir as listagens
                    title: Text(_registros[index]['nome']),
                    subtitle: Text(_registros[index]['email']),
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
                                _removeRegistroUsu(_registros[index]['id']),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const //Text("Cadastro"),
            Icon(Icons.person_add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
