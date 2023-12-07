import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_consumo_api/presentation/home_screen.dart';
import 'package:tarea_consumo_api/providers/respuesta_provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => respuestaGif())],
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: Home()),
    );
  }
}
