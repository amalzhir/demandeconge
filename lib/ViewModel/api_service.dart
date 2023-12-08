import 'dart:developer';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'package:demandeconge/Model/conge_model.dart';

class ApiService{
  Future<List<CongeModel>?> getConge() async{
    try{
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200){
        List<CongeModel>_model = congeModelFromJson(response.body);
        return _model;
      }
    }catch(e){
      log(e.toString());
    }
  }
}

