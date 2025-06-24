class CategoryService {
  final List<String> categoriasGames = [
    'Jogos',
    'Consoles',
    'Acessórios',
    'Colecionáveis',
    'Gift Cards',
  ];

  Future<List<String>> fetchCategories() async {
    return categoriasGames;
  }
}
