import 'dart:convert';
import 'package:aeapp/models/channels.dart';
import 'package:http/http.dart' as http;



Future<List<Chan>> getChannels(String key) async{
  final Uri url;
  try {
     url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&type=channel&maxResults=1000&q=${key}&key=AIzaSyBHe8sBlQcgucf6kEYVf90qBWVwkxyQS8g');
  }catch(e){
    throw Exception(e.toString());
  }
  final response = await http.get(url);
  if(response.statusCode == 200){
    var tab = json.decode(response.body)['items'];
    print(tab);
    return [...tab.map((e)=>Chan.fromJson(e))];
  }else{
    throw Exception('Erreur');
  }
}