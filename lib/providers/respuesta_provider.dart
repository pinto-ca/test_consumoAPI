import 'package:flutter/material.dart';
import 'package:tarea_consumo_api/domain/entities/respuesta.dart';
import 'package:tarea_consumo_api/helper/get_gif_answer.dart';

class respuestaGif extends ChangeNotifier {
  final _getResponse = GetGifAnswer();

  Respuesta mensaje = Respuesta(
      answer: 'Gif',
      forced: false,
      image: 'https://i.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.webp');

  Future<void> loadRespuesta() async {
    Future.delayed(const Duration(milliseconds: 5000));
    mensaje = await _getResponse.getGif();
    notifyListeners();
  }
}
