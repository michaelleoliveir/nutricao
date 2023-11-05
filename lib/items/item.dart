class Item {
  final String nome;
  final String categoria;
  final String tipo;

  Item({required this.nome, required this.categoria, required this.tipo});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'categoria': categoria,
      'tipo': tipo,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      nome: map['nome'],
      categoria: map['categoria'],
      tipo: map['tipo'],
    );
  }
}
