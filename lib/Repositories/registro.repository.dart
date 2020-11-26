import 'dart:convert';
import 'package:app_web_papi/Models/registro.model.dart';
import 'package:http/http.dart' as http;

class RegistroRepository{

  var url = 'http://pedrofasi-001-site1.btempurl.com/api/clientes';

  Future<List<Registro>> getAll() async{

    final response = await http.get(url);

    if(response.statusCode == 200){

      List<Registro> data = (json.decode(response.body) as List)
          .map((i) => Registro.fromJson(i)).toList();

      return data;
    }else{
      throw Exception("Erro de conexão com o servidor!");
    }
  }

  Future<bool> create(Registro pessoa) async{

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:  jsonEncode(pessoa.toJson()),
    );

    if(response.statusCode == 201){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> edit(Registro professor) async{

    final response = await http.put(
      url + "/${professor.id}",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(professor.toJson()),
    );

    if(response.statusCode == 204){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> delete(int id) async{

    final response = await http.delete( url + "/${id}");

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

}