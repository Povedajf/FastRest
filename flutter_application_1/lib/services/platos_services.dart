import 'package:flutter_application_1/models/proto_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlatosService {
  PlatosService();
  final String _rootUrl = "https://fastrest-api.web.app/api/menu";

  Future<List<FieldsProto>> getResponse() async {
    List<FieldsProto> resultContent=[];
    try {
      var url = Uri.parse(_rootUrl);
      final response = await http.get(url);
      List<dynamic> listaPlatos = json.decode(response.body);
        for (var item in listaPlatos){
            final platos = FieldsProto.fromJson(item);
            resultContent.add(platos);
        }
      return resultContent;
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
    }
    return resultContent;
  }
}
