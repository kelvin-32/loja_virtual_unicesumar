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
    image:
        'https://cdn.awsli.com.br/600x450/51/51695/produto/42713594/3cfc3dfa30.jpg',
    price: 199.90,
    category: 'Jogos',
    rating: RatingModel(rate: 4.9, count: 1200),
  ),
  ProductModel(
    id: 2,
    title: 'Halo Infinite',
    description: 'O mais novo capítulo da lendária franquia Halo.',
    image:
        'https://www.adrenaline.com.br/wp-content/uploads/2022/12/halo-infinite-steelbook3-3.jpg',
    price: 249.90,
    category: 'Jogos',
    rating: RatingModel(rate: 4.7, count: 800),
  ),
  ProductModel(
    id: 3,
    title: 'FIFA 24',
    description: 'O simulador de futebol mais jogado do mundo.',
    image:
        'https://cdn.awsli.com.br/300x300/2395/2395453/produto/306748564/4979f11b66c4bdae90ff68636840e122-9u02t2d6s7.jpg',
    price: 299.90,
    category: 'Jogos',
    rating: RatingModel(rate: 4.8, count: 950),
  ),
  ProductModel(
    id: 4,
    title: 'The Legend of Zelda: Tears of the Kingdom',
    description: 'Novo jogo da franquia Zelda para Nintendo Switch.',
    image:
        'https://wafuu.com/cdn/shop/products/nintendo-switch-the-legend-of-zelda-tears-of-the-kingdom-950413.jpg?v=1706144130',
    price: 349.90,
    category: 'Jogos',
    rating: RatingModel(rate: 5.0, count: 2000),
  ),
  // Consoles
  ProductModel(
    id: 5,
    title: 'PlayStation 5',
    description: 'Console de última geração da Sony, com SSD ultrarrápido.',
    image: 'https://imgs.casasbahia.com.br/1569668001/4xg.jpg?imwidth=500',
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
    image:
        'https://assets.nintendo.com/image/upload/f_auto/q_auto/dpr_1.5/c_scale,w_500/ncom/en_US/switch/videos/heg001-07060600/posters/oled-model',
    price: 2499.99,
    category: 'Consoles',
    rating: RatingModel(rate: 4.7, count: 800),
  ),
  // Acessórios
  ProductModel(
    id: 9,
    title: 'Controle DualSense PS5',
    description: 'Controle sem fio para PlayStation 5 com feedback háptico.',
    image:
        'https://images.kabum.com.br/produtos/fotos/161471/controle-sem-fio-dualsense-midnight-black-ps5-pre-venda_1621439693_gg.jpg',
    price: 499.90,
    category: 'Acessórios',
    rating: RatingModel(rate: 4.8, count: 900),
  ),
  ProductModel(
    id: 10,
    title: 'Controle Xbox Series X',
    description: 'Controle sem fio para Xbox Series X|S.',
    image:
        'https://cms-assets.xboxservices.com/assets/95/e6/95e6e439-4c92-498b-b2af-19508d313b1b.jpg?n=Xbox-Wireless-Controller_Gallery-0_957848-3_1350x759.jpg',
    price: 449.90,
    category: 'Acessórios',
    rating: RatingModel(rate: 4.8, count: 900),
  ),
  ProductModel(
    id: 11,
    title: 'Base Carregadora DualSense',
    description: 'Carregue dois controles PS5 simultaneamente.',
    image: 'https://m.media-amazon.com/images/I/619wcJ0sEeL.jpg',
    price: 249.90,
    category: 'Acessórios',
    rating: RatingModel(rate: 4.6, count: 500),
  ),
  ProductModel(
    id: 12,
    title: 'Headset Gamer HyperX Cloud Alpha',
    description: 'Headset gamer com som surround 7.1 e microfone destacável.',
    image: 'https://m.media-amazon.com/images/I/51x1IyPFVQL.jpg',
    price: 599.90,
    category: 'Acessórios',
    rating: RatingModel(rate: 4.9, count: 750),
  ),
  ProductModel(
    id: 13,
    title: 'Mouse Gamer Logitech G Pro X Superlight',
    description: 'Mouse sem fio ultraleve para jogos profissionais.',
    image:
        'https://resource.logitechg.com/w_692,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/pro-x-superlight/pro-x-superlight-black-gallery-1.png',
    price: 799.90,
    category: 'Acessórios',
    rating: RatingModel(rate: 4.8, count: 620),
  ),
  ProductModel(
    id: 14,
    title: 'Teclado Mecânico Razer BlackWidow V3',
    description: 'Teclado mecânico com switches Razer Green e iluminação RGB.',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdlV8LfUg7-a0B4z4aDXXOpruzb5MvTYZ-FQ&s',
    price: 899.90,
    category: 'Acessórios',
    rating: RatingModel(rate: 4.7, count: 580),
  ),
  // Colecionáveis
  ProductModel(
    id: 15,
    title: 'Funko Pop! Master Chief',
    description: 'Funko Pop do personagem Master Chief de Halo.',
    image:
        'https://cdn.awsli.com.br/600x700/84/84034/produto/159747451/funko-pop--games-halo-master-chief-25-exclusivo-c-800-dkginq9zka.jpg',
    price: 79.90,
    category: 'Colecionáveis',
    rating: RatingModel(rate: 4.9, count: 300),
  ),
  ProductModel(
    id: 21,
    title: 'Action Figure Kratos God of War',
    description: 'Action Figure premium do Kratos de God of War Ragnarok.',
    image:
        'https://a-static.mlcdn.com.br/800x560/action-figure-kratos-ghost-of-sparta-ultimate-god-of-war-neca/toys9variedade/556667778899000/20ca05bd416a9cff1fd934dc9441fc09.jpeg',
    price: 899.90,
    category: 'Colecionáveis',
    rating: RatingModel(rate: 4.9, count: 120),
  ),
  ProductModel(
    id: 22,
    title: 'Estátua Link The Legend of Zelda',
    description:
        'Estátua colecionável do Link de The Legend of Zelda: Breath of the Wild.',
    image:
        'https://acdn-us.mitiendanube.com/stores/001/003/911/products/084000_11-fbc41459461c1c1fb716908942354543-1024-1024.jpg',
    price: 1299.90,
    category: 'Colecionáveis',
    rating: RatingModel(rate: 5.0, count: 85),
  ),
  ProductModel(
    id: 23,
    title: 'Réplica Espada Master Sword',
    description:
        'Réplica em tamanho real da Master Sword de The Legend of Zelda.',
    image:
        'https://cdn.awsli.com.br/2500x2500/2515/2515067/produto/1834048829944d8f6e5.jpg',
    price: 499.90,
    category: 'Colecionáveis',
    rating: RatingModel(rate: 4.8, count: 210),
  ),
  ProductModel(
    id: 24,
    title: 'Funko Pop! Ellie The Last of Us',
    description: 'Funko Pop da personagem Ellie de The Last of Us Part II.',
    image:
        'https://cdn.awsli.com.br/600x700/84/84034/produto/113075931/funko-pop--ellie-yo937u3f1f.jpg',
    price: 89.90,
    category: 'Colecionáveis',
    rating: RatingModel(rate: 4.7, count: 180),
  ),
  // Gift Cards
  ProductModel(
    id: 16,
    title: 'Gift Card PlayStation R\$ 50',
    description: 'Cartão presente para PlayStation Store no valor de R\$ 50.',
    image:
        'https://maurospbrgames.com.br/wp-content/uploads/2021/11/Cartao-PSN-BR-50-reais.jpg',
    price: 48.00,
    category: 'Gift Cards',
    rating: RatingModel(rate: 5.0, count: 150),
  ),
  ProductModel(
    id: 17,
    title: 'Gift Card Xbox R\$ 100',
    description: 'Cartão presente para Xbox Live no valor de R\$ 100.',
    image:
        'https://images.kabum.com.br/produtos/fotos/266928/gift-card-xbox-100-reais-codigo-digital_1732543969_gg.jpg',
    price: 95.00,
    category: 'Gift Cards',
    rating: RatingModel(rate: 5.0, count: 200),
  ),
  ProductModel(
    id: 18,
    title: 'Gift Card Nintendo eShop R\$ 100',
    description: 'Cartão presente para Nintendo eShop no valor de R\$ 100.',
    image:
        'https://www.zero3games.com.br/loja/assets/nintendo_switch_eshop_100_reais_l.jpg',
    price: 95.00,
    category: 'Gift Cards',
    rating: RatingModel(rate: 5.0, count: 180),
  ),
  ProductModel(
    id: 19,
    title: 'Gift Card Steam R\$ 200',
    description: 'Cartão presente para Steam no valor de R\$ 200.',
    image: 'https://www.zero3games.com.br/loja/assets/0111_l.jpg',
    price: 190.00,
    category: 'Gift Cards',
    rating: RatingModel(rate: 5.0, count: 300),
  ),
  ProductModel(
    id: 20,
    title: 'Gift Card Google Play R\$ 25',
    description: 'Cartão presente para Google Play Store no valor de R\$ 25.',
    image:
        'https://i5.walmartimages.com/seo/Google-Play-25_4c093929-080e-4d8f-9afd-9c195b51b4a5.d3d597018e932f757c4e0a7d1df4d868.jpeg',
    price: 24.00,
    category: 'Gift Cards',
    rating: RatingModel(rate: 4.9, count: 120),
  ),
];
