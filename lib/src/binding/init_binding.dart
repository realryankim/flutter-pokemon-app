import 'package:flutter_pokemon_app/src/controller/home_controller.dart';
import 'package:flutter_pokemon_app/src/repository/pokemon_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PokemonRepository(), permanent: true);
    Get.put(HomeController());
  }
}
