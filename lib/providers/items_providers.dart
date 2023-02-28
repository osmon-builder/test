import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;



import 'package:flutter/cupertino.dart';

import '../models/people.dart';


class ItemProvider extends ChangeNotifier {

// final Uri _baseURL = Uri.parse('gateway.marvel.com/v1/public/characters?ts=1&');


List<Result> onDisplayCharacter = [];

final StreamController<List<Result>>_suggestionStreamController = StreamController.broadcast();
Stream<List<Result>> get suggestionStream => _suggestionStreamController.stream;

ItemProvider(){
  print('Movies inicializado');
  getOnDiplayCharacter();

}

Future <String> _getData ()async{
  final url = Uri.parse('https://randomuser.me/api/?results=10');

  final response = await http.get(url);
  return response.body;
}

getOnDiplayCharacter()async{
  final jsonData = await _getData();
  final decodeData = json.decode(jsonData);
  final scanModel = ScanModel.fromJson(decodeData);

  
 
  
 
  onDisplayCharacter = scanModel.results;


 notifyListeners();
 
}
}