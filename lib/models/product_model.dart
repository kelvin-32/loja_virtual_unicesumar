import 'rating_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final String category;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'price': price,
        'category': category,
        'rating': rating.toJson(),
      };
}

// Exemplo de lista de produtos mockados
final List<ProductModel> mockGames = [
  // Jogos
  ProductModel(
    id: 1,
    title: 'The Last of Us Part II',
    description: 'Jogo de ação e aventura exclusivo para PlayStation 4 e 5.',
    image: 'https://m.media-amazon.com/images/I/81r8JazHqzL._AC_SL1500_.jpg',
    price: 199.90,
    category: 'Jogos',
    rating: RatingModel(rate: 4.9, count: 1200),
  ),
  ProductModel(
    id: 2,
    title: 'Halo Infinite',
    description: 'O mais novo capítulo da lendária franquia Halo.',
    image: 'https://m.media-amazon.com/images/I/81p6yQK4pGL._AC_SL1500_.jpg',
    price: 249.90,
    category: 'Jogos',
    rating: RatingModel(rate: 4.7, count: 800),
  ),
  ProductModel(
    id: 3,
    title: 'FIFA 24',
    description: 'O simulador de futebol mais jogado do mundo.',
    image: 'https://m.media-amazon.com/images/I/81QwQlmQ6-L._AC_SL1500_.jpg',
    price: 299.90,
    category: 'Jogos',
    rating: RatingModel(rate: 4.8, count: 950),
  ),
  ProductModel(
    id: 4,
    title: 'The Legend of Zelda: Tears of the Kingdom',
    description: 'Novo jogo da franquia Zelda para Nintendo Switch.',
    image: 'https://m.media-amazon.com/images/I/81p+Ek7t6-L._AC_SL1500_.jpg',
    price: 349.90,
    category: 'Jogos',
    rating: RatingModel(rate: 5.0, count: 2000),
  ),
  // Consoles
  ProductModel(
    id: 5,
    title: 'PlayStation 5',
    description: 'Console de última geração da Sony, com SSD ultrarrápido.',
    image: 'https://m.media-amazon.com/images/I/61v6b5PpQTL._AC_SL1500_.jpg',
    price: 4499.99,
    category: 'Consoles',
    rating: RatingModel(rate: 4.9, count: 1200),
  ),
  ProductModel(
    id: 6,
    title: 'Xbox Series X',
    description: 'Console poderoso da Microsoft, com gráficos em 4K.',
    image: 'https://m.media-amazon.com/images/I/61JGKhqxHxL._AC_SL1500_.jpg',
    price: 4299.99,
    category: 'Consoles',
    rating: RatingModel(rate: 4.8, count: 950),
  ),
  ProductModel(
    id: 7,
    title: 'Nintendo Switch OLED',
    description: 'Console híbrido da Nintendo com tela OLED vibrante.',
    image: 'https://m.media-amazon.com/images/I/71Q1Iu4suSL._AC_SL1500_.jpg',
    price: 2499.99,
    category: 'Consoles',
    rating: RatingModel(rate: 4.7, count: 800),
  ),
  // Acessórios
  ProductModel(
    id: 9,
    title: 'Controle DualSense PS5',
    description: 'Controle sem fio para PlayStation 5 com feedback háptico.',
    image: 'https://m.media-amazon.com/images/I/61OaU4Qh-GL._AC_SL1500_.jpg',
    price: 499.90,
    category: 'Acessórios',
    rating: RatingModel(rate: 4.8, count: 900),
  ),
  ProductModel(
    id: 10,
    title: 'Controle Xbox Series',
    description: 'Controle sem fio para Xbox Series X|S.',
    image: 'https://m.media-amazon.com/images/I/61nPiOO2w-L._AC_SL1500_.jpg',
    price: 449.90,
    category: 'Acessórios',
    rating: RatingModel(rate: 4.8, count: 900),
  ),
  ProductModel(
    id: 11,
    title: 'Base Carregadora DualSense',
    description: 'Carregue dois controles PS5 simultaneamente.',
    image: 'https://m.media-amazon.com/images/I/61ZbA7ZQ-GL._AC_SL1500_.jpg',
    price: 249.90,
    category: 'Acessórios',
    rating: RatingModel(rate: 4.6, count: 500),
  ),
  // Colecionáveis
  ProductModel(
    id: 15,
    title: 'Funko Pop! Master Chief',
    description: 'Funko Pop do personagem Master Chief de Halo.',
    image: 'https://m.media-amazon.com/images/I/61QwQlmQ6-L._AC_SL1500_.jpg',
    price: 79.90,
    category: 'Colecionáveis',
    rating: RatingModel(rate: 4.9, count: 300),
  ),
];
