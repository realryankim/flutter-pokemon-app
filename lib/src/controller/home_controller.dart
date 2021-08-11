import 'package:flutter_pokemon_app/src/models/pokemon.dart';
import 'package:flutter_pokemon_app/src/repository/pokemon_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<Pokemon> pokemon = Pokemon(pokemon: []).obs;

  @override
  void onInit() {
    _pokemonLoad();
    super.onInit();
  }

  void _pokemonLoad() async {
    Pokemon? pokemonResult = await PokemonRepository.to.loadPokemons();

    if (pokemonResult != null &&
        pokemonResult.pokemon != null &&
        pokemonResult.pokemon.length > 0) {
      pokemon(pokemonResult);
    }
  }
}
