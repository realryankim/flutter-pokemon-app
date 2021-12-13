import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/src/models/pokemon.dart';
import 'package:flutter_pokemon_app/src/repository/pokemon_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<Pokemon> pokemon = Pokemon(pokemon: []).obs;
  ScrollController scrollController = ScrollController();
  RxBool showBackToTopButton = false.obs;

  @override
  void onInit() {
    pokemonLoad();
    _scrollEvent();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _scrollEvent() {
    scrollController.addListener(() {
      if (scrollController.offset >= 400) {
        showBackToTopButton(true);
      } else {
        showBackToTopButton(false);
      }
    });
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: Duration(seconds: 2), curve: Curves.linear);
  }

  void pokemonLoad() async {
    Pokemon? pokemonResult = await PokemonRepository.to.loadPokemons();

    if (pokemonResult != null &&
        pokemonResult.pokemon != null &&
        pokemonResult.pokemon.length > 0) {
      pokemon(pokemonResult);
    }
  }
}
