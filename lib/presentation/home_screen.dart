import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_consumo_api/providers/respuesta_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController questionController = TextEditingController();

  void showResponse(respuestaGif respuestaGif) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (respuestaGif.mensaje.answer.isNotEmpty)
                Text(respuestaGif.mensaje.answer),
              if (respuestaGif.mensaje.image.isNotEmpty)
                Image.network(respuestaGif.mensaje.image),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final respuestaProvider = context.watch<respuestaGif>();

    return Scaffold(
      appBar: AppBar(title: Text('Trending Gifs')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await respuestaProvider.loadRespuesta();
                showResponse(respuestaProvider);
              },
              child: Text('Obtener Trending Gif'),
            ),
          ],
        ),
      ),
    );
  }
}
