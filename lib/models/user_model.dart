import './../models/models.dart';

class UserModel {
  final int id;
  final String email;
  final String username;
  final String password;
  final NameModel name;
  final AddressModel address;
  final String phone;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: NameModel.fromJson(json['name']),
      address: AddressModel.fromJson(json['address']),
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name.toJson(),
      'address': address.toJson(),
      'phone': phone,
    };
  }

  // Adiciona aqui:
  UserModel copyWith({
    int? id,
    String? email,
    String? username,
    String? password,
    NameModel? name,
    AddressModel? address,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }
}

final List<Map<String, dynamic>> mockUsers = [
  {
    'id': 1,
    'username': 'kelvin_rosa',
    'password': '123456789',
    'email': 'kelvin@teste.com',
    'name': {'firstname': 'Kelvin', 'lastname': 'Rosa'},
    'address': {
      'city': 'Maringá',
      'street': 'Rua das Flores',
      'number': 101,
      'zipcode': '87000-000',
      'geolocation': {'lat': '-23.420999', 'long': '-51.933056'}
    },
    'phone': '44999990001',
  },
  {
    'id': 2,
    'username': 'eric_vinicius',
    'password': '987654321',
    'email': 'eric@teste.com',
    'name': {'firstname': 'Eric', 'lastname': 'Vinicius'},
    'address': {
      'city': 'Londrina',
      'street': 'Av. Brasil',
      'number': 202,
      'zipcode': '86000-000',
      'geolocation': {'lat': '-23.304452', 'long': '-51.169582'}
    },
    'phone': '43999990002',
  },
  {
    'id': 3,
    'username': 'pedro_tadra',
    'password': '456987123',
    'email': 'pedro@teste.com',
    'name': {'firstname': 'Pedro', 'lastname': 'Tadra'},
    'address': {
      'city': 'Curitiba',
      'street': 'Rua XV de Novembro',
      'number': 303,
      'zipcode': '80020-310',
      'geolocation': {'lat': '-25.428954', 'long': '-49.267137'}
    },
    'phone': '41999990003',
  },
];
