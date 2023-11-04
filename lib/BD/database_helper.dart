import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class Database {
  // id: Chave primária do registro
  // title, description: nome e descrição do registro
  // created_at: Data e hora da criação do registro. Isso é retornado pelo banco de dados
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE usuario(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        email TEXT,
        senha TEXT,
        datanasci TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
    await database.execute("""CREATE TABLE itens(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        categoria TEXT,
        tipo TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
    await database.execute("""CREATE TABLE cardapio(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        categoria TEXT,
        tipo TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> database() async {
    return sql.openDatabase(
      'banco1_teste.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Insere um novo registro
  static Future<int> insereUsuario(
      String nome, String email, String senha, String datanasci) async {
    final database = await Database.database();

    final data = {
      'nome': nome,
      'email': email,
      'senha': senha,
      'datanasci': datanasci
    };

    final id = await database.insert('usuario', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Insere um novo registro
  static Future<int> insereItens(
      String nome, String categoria, String tipo) async {
    final database = await Database.database();

    final data = {'nome': nome, 'categoria': categoria, 'tipo': tipo};

    final id = await database.insert('itens', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Insere um novo registro
  static Future<int> insereCardapio(
      String nome, String categoria, String tipo) async {
    final database = await Database.database();

    final data = {'nome': nome, 'categoria': categoria, 'tipo': tipo};

    final id = await database.insert('cardapio', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Retorna todos os registros da tabela
  static Future<List<Map<String, dynamic>>> exibeTodosRegistrosUsu() async {
    final database = await Database.database();
    return database.query('usuario', orderBy: "id");
  }

  // Retorna todos os registros da tabela
  static Future<List<Map<String, dynamic>>> exibeTodosRegistrosIten() async {
    final database = await Database.database();
    return database.query('itens', orderBy: "id");
  }

  // Retorna todos os registros da tabela
  static Future<List<Map<String, dynamic>>> exibeTodosRegistrosCard() async {
    final database = await Database.database();
    return database.query('cardapio', orderBy: "id");
  }

  // Retorna um único registro através de um ID

  // Retorna um único registro através de um ID
  static Future<List<Map<String, dynamic>>> retornaRegistroUsu(int id) async {
    final database = await Database.database();
    return database.query('usuario',
        where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Retorna um único registro através de um ID
  static Future<List<Map<String, dynamic>>> retornaRegistroIten(int id) async {
    final database = await Database.database();
    return database.query('itens', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Retorna um único registro através de um ID
  static Future<List<Map<String, dynamic>>> retornaRegistroCard(int id) async {
    final database = await Database.database();
    return database.query('carddapio',
        where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Atualiza um registro
  static Future<int> atualizaRegistroUsu(
      int id, String nome, String email, String senha, String datanasci) async {
    final database = await Database.database();

    final data = {
      'nome': nome,
      'email': email,
      'senha': senha,
      'datanasci': datanasci,
      'createdAt': DateTime.now().toString()
    };

    final result = await database
        .update('usuario', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Atualiza um registro
  static Future<int> atualizaRegistroItens(
      int id, String nome, String categoria, String tipo) async {
    final database = await Database.database();

    final data = {
      'nome': nome,
      'categoria': categoria,
      'tipo': tipo,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await database.update('itens', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Atualiza um registro
  static Future<int> atualizaRegistroCard(
      int id, String nome, String categoria, String tipo) async {
    final database = await Database.database();

    final data = {
      'nome': nome,
      'categoria': categoria,
      'tipo': tipo,
      'createdAt': DateTime.now().toString()
    };

    final result = await database
        .update('cardapio', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Remove um registro
  static Future<void> removeRegistroUsu(int id) async {
    final database = await Database.database();
    try {
      await database.delete("usuario", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Ocorreu algum erro ao remover o registro: $err");
    }
  }

// Remove um registro
  static Future<void> removeRegistroIten(int id) async {
    final database = await Database.database();
    try {
      await database.delete("itens", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Ocorreu algum erro ao remover o registro: $err");
    }
  }

// Remove um registro
  static Future<void> removeRegistroCard(int id) async {
    final database = await Database.database();
    try {
      await database.delete("cardapio", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Ocorreu algum erro ao remover o registro: $err");
    }
  }
}
