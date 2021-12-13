import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/src/controller/home_controller.dart';
import 'package:flutter_pokemon_app/src/pokomon_detail.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            "Pokemon App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(),
        body: controller.pokemon.value.pokemon == null
            ? Center(child: CircularProgressIndicator())
            : GridView.count(
                controller: controller.scrollController,
                crossAxisCount: 2,
                children: controller.pokemon.value.pokemon
                    .map(
                      (poke) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              () => PokemonDetail(
                                pokemon: poke,
                              ),
                            );
                          },
                          child: Hero(
                            tag: poke.img,
                            child: Card(
                              elevation: 3.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(poke.img),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    poke.name,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
        floatingActionButton: controller.showBackToTopButton.value == false
            ? null
            : FloatingActionButton(
                onPressed: () {
                  controller.scrollToTop();
                },
                child: Icon(Icons.arrow_upward),
              ),
      ),
    );
  }
}
