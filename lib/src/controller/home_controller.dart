import 'package:flutter_pokemon_app/src/repository/pokemon_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  @override
  void onInit() {
    _pokemonLoad();
    super.onInit();
  }

  void _pokemonLoad() {
    PokemonRepository.to.loadPokemons();
  }
}
