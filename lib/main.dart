import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import './widgets/widgets.dart';
import './views/views.dart';
import 'bindings/initial_binding.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    // Só usa FFI no desktop
    databaseFactory = databaseFactoryFfi;
  }
  await Hive.initFlutter();
  await GetStorage.init(); // Inicializa o GetStorage
  // Inicializa locale para pt_BR
  await initializeDateFormatting('pt_BR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DARK Games', // Nome atualizado
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: const Color(0xFF181A20),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF23272F),
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00FFEA),
            fontFamily: 'Orbitron',
          ),
          iconTheme: IconThemeData(color: Color(0xFF00FFEA)),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF00FFEA),
          foregroundColor: Colors.black,
          elevation: 6,
          shape: StadiumBorder(),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF23272F),
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Orbitron'),
          bodyMedium: TextStyle(color: Colors.white70, fontFamily: 'Orbitron'),
          titleLarge: TextStyle(
            color: Color(0xFF00FFEA),
            fontWeight: FontWeight.bold,
            fontFamily: 'Orbitron',
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF23272F),
          labelStyle: TextStyle(color: Color(0xFF00FFEA)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color(0xFF00FFEA)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color(0xFF00FFEA)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color(0xFF00FFEA), width: 2),
          ),
        ),
      ),
      initialBinding: InitialBinding(),
      initialRoute: '/home',
      getPages: AppPages.pages,
    );
  }
}
