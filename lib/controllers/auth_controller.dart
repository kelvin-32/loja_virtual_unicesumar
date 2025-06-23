import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/models.dart'; // Certifique-se de importar onde mockUsers está definido
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  var logado = false.obs;
  var carregando = false.obs;
  var erro = ''.obs;
  final box = GetStorage();

  Future<bool> login(LoginRequestModel request) async {
    carregando.value = true;
    erro.value = '';
    await Future.delayed(const Duration(milliseconds: 500)); // Simula delay

    final Map<String, dynamic> user = mockUsers.firstWhere(
      (u) =>
          u['username'] == request.username &&
          u['password'] == request.password,
      orElse: () => <String, dynamic>{},
    );

    if (user.isEmpty) {
      erro.value = 'Usuário ou senha inválidos';
      carregando.value = false;
      return false;
    }

    logado.value = true;
    erro.value = '';
    carregando.value = false;
    // Salva o usuário como JSON
    box.write('usuario', jsonEncode(user));
    return true;
  }

  void logout() {
    logado.value = false;
    box.remove('usuario');
    Get.snackbar(
      'Logout',
      'Você saiu da sua conta com sucesso.',
      colorText: Colors.white,
      backgroundColor: Colors.black87,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.logout, color: Colors.white),
      duration: const Duration(seconds: 3),
    );
    Get.offAllNamed('/');
  }
}
