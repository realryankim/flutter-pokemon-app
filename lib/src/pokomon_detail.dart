import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/src/models/pokemon.dart';
import 'package:get/get.dart';

class PokemonDetail extends StatelessWidget {
  PokemonDetail({Key? key, required this.pokemon}) : super(key: key);
  final PokemonElement pokemon;
  late double height;
  late double width;

  Widget getBody() {
    height = Get.height;
    width = Get.width;
    return Stack(
      children: [
        Positioned(
          height: height / 1.4,
          width: width - 20,
          left: 10.0,
          top: height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 70),
                Text(
                  pokemon.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Height: ${pokemon.height}'),
                Text('Weight: ${pokemon.weight}'),
                Text(
                  'Types',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((t) => FilterChip(
                            backgroundColor: Colors.amber,
                            label: Text(
                              t.toString().substring(5, t.toString().length),
                            ),
                            onSelected: (bool) {},
                          ))
                      .toList(),
                ),
                Text(
                  'Weakness',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses
                      .map((t) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(
                              t.toString().substring(5, t.toString().length),
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (bool) {},
                          ))
                      .toList(),
                ),
                Text(
                  'Next Evolution',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution == null
                      ? [Text('Last evolution in the 1st generation')]
                      : pokemon.nextEvolution!
                          .map((next) => FilterChip(
                                backgroundColor: Colors.green,
                                label: Text(
                                  next.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onSelected: (bool) {},
                              ))
                          .toList(),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              height: 200,
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(pokemon.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(pokemon.name),
      ),
      body: getBody(),
    );
  }
}
