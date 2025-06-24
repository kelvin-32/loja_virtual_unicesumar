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
              const Icon(Icons.sports_esports,
                  size: 90, color: Color(0xFF00FFEA)),
              const SizedBox(height: 16),
              const Text(
                'DARK Games',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00FFEA),
                  fontFamily: 'Orbitron',
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Entre no universo gamer',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontFamily: 'Orbitron',
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
                  Get.offAllNamed('/home');
                },
              ),

              const SizedBox(height: 24),

              // Botão de usuário pré-definido
              ElevatedButton(
                onPressed: () {
                  usernameController.text = 'kelvin_rosa';
                  passwordController.text = '123456789';
                },
                child: const Text('Usar credenciais padrão'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
