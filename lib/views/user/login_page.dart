import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../../controllers/controllers.dart';
import './../../widgets/widgets.dart';
import './../../models/models.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController usernameController =
      TextEditingController(text: 'kelvin_rosa');
  final TextEditingController passwordController =
      TextEditingController(text: '123456789');

  Future<void> _login() async {
    final request = LoginRequestModel(
      username: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );

    await authController.login(request);

    if (authController.logado.value) {
      // Sucesso → redireciona para MainNavigationPage (Home)
      Get.offAllNamed('/');
    } else {
      // Falha → mostra erro
      Get.snackbar(
        'Erro de login',
        authController.erro.value.isNotEmpty
            ? authController.erro.value
            : 'Falha ao fazer login.',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        duration: const Duration(seconds: 4),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              )
            : null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Branding
              const Icon(Icons.shopping_bag,
                  size: 80, color: Colors.deepPurple),
              const SizedBox(height: 16),
              const Text(
                'Minha Loja Online',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Acesse sua conta para continuar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 32),

              // Username
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Botão de login
              Obx(() => LoadingButton(
                    width: double.infinity,
                    height: 50,
                    text: 'Entrar',
                    icon: Icons.login,
                    isLoading: authController.carregando.value,
                    onPressed: () async {
                      final success = await authController.login(
                        LoginRequestModel(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                      if (success) {
                        Get.offAllNamed('/home');
                      } else {
                        Get.snackbar('Erro', authController.erro.value);
                      }
                    },
                  )),

              const SizedBox(height: 16),

              // Link para cadastro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não tem uma conta? '),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/signup');
                    },
                    child: const Text('Cadastre-se'),
                  ),
                ],
              ),

              // Botão "Continuar Comprando"
              PrimaryButton(
                text: 'Continuar comprando',
                icon: Icons.shopping_cart_outlined,
                onPressed: () {
                  Get.offAllNamed('/');
                },
              ),

              const SizedBox(height: 24),

              // Botões de usuário pré-definidos
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      usernameController.text = 'kelvin_rosa';
                      passwordController.text = '123456789';
                    },
                    child: const Text('Kelvin'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      usernameController.text = 'eric_vinicius';
                      passwordController.text = '987654321';
                    },
                    child: const Text('Eric'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      usernameController.text = 'pedro_tadra';
                      passwordController.text = '456987123';
                    },
                    child: const Text('Pedro'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
