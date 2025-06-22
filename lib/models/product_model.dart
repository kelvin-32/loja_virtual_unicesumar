import 'rating_model.dart';

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}

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

// Exemplo de lista de jogos mockados
final List<ProductModel> mockGames = [
  ProductModel(
    id: 1,
    title: 'The Witcher 3: Wild Hunt',
    description:
        'RPG de ação em mundo aberto, premiado e aclamado pela crítica.',
    image: 'https://upload.wikimedia.org/wikipedia/pt/0/0c/Witcher_3_capa.png',
    price: 99.90,
    category: 'RPG',
    rating: RatingModel(rate: 4.9, count: 1200),
  ),
  ProductModel(
    id: 2,
    title: 'FIFA 24',
    description:
        'O maior simulador de futebol do mundo, com times e jogadores reais.',
    image: 'https://upload.wikimedia.org/wikipedia/pt/7/7e/FIFA_24_capa.jpg',
    price: 249.90,
    category: 'Esportes',
    rating: RatingModel(rate: 4.7, count: 800),
  ),
  ProductModel(
    id: 3,
    title: 'Forza Horizon 5',
    description:
        'O melhor jogo de corrida em mundo aberto, com gráficos incríveis.',
    image:
        'https://upload.wikimedia.org/wikipedia/pt/1/1e/Forza_Horizon_5_capa.jpg',
    price: 199.90,
    category: 'Corrida',
    rating: RatingModel(rate: 4.8, count: 950),
  ),
  ProductModel(
    id: 4,
    title: 'Stardew Valley',
    description:
        'Simulação de fazenda e vida no campo, com visual retrô e muito charme.',
    image:
        'https://upload.wikimedia.org/wikipedia/pt/3/3e/Stardew_Valley_capa.png',
    price: 39.90,
    category: 'Indie',
    rating: RatingModel(rate: 4.9, count: 2000),
  ),
];
