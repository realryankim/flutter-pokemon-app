import 'package:flutter_pokemon_app/src/models/pokemon.dart';
import 'package:get/get.dart';
import 'dart:convert';

class PokemonRepository extends GetConnect {
  static PokemonRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://raw.githubusercontent.com';
    super.onInit();
  }

  Future<Pokemon?> loadPokemons() async {
    String url = '/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      var decodedJson = jsonDecode(response.body);
      if (decodedJson != null && decodedJson.length > 0) {
        return Pokemon.fromJson(decodedJson);
      }
      print(decodedJson.length);
    }
  }
}
