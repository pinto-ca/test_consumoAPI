import 'package:dio/dio.dart';
import 'package:tarea_consumo_api/domain/entities/respuesta.dart';

class GetGifAnswer {
  final String url = "https://api.giphy.com/v1";
  final _dio = Dio();

  Future<Respuesta> getGif() async {
    final response = await _dio.get(url);
    final respuestaGif = respuestaFromJson(response.data);
    return respuestaGif;
  }
}
