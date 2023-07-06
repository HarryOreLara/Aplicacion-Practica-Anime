import 'package:flutter/material.dart';
import 'package:onepice_list_2/src/animations/fade_animation.dart';
import 'package:onepice_list_2/src/widgets/blur_container.dart';
import 'package:onepice_list_2/src/widgets/infotitle_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.color,
      required this.imagen,
      required this.nombre});

  final int color;
  final String imagen;
  final String nombre;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double alturaPantalla = 0;

  @override
  Widget build(BuildContext context) {
    alturaPantalla = MediaQuery.of(context)
        .size
        .height; //para capturar la pantalla y la imagen no desborde
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                //Begin y end son para decirle de donde empezara el degradado de la pantalla
                //Colors esta recibiendo un parametro cuando se llama a su contrsuctor, por eso el degrade es el color que sale en main
                colors: [Color(widget.color), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    height: alturaPantalla * 0.6,
                    child: Hero(
                        tag: widget.color, child: Image.asset(widget.imagen)),
                  ),
                ),
                Positioned(
                    //Para suporponer sobre la imagen
                    bottom: 10,
                    left: 10,
                    child: FadeAnimation(
                      intervalEnd: 0.8,
                      child: BlurContainer(
                          child: Container(
                        width: 160,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.1)),
                        child: Text(
                          widget.nombre,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      )),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FadeAnimation(
                intervalStart: 0.3,
                child: Text(
                  "${widget.nombre} #Personaje",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: FadeAnimation(
                intervalStart: 0.35,
                child: Text(
                  "One Pice",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FadeAnimation(
                intervalStart: 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InfoTitle(title: "One Pice", subtitle: "Eiichirō Oda"),
                    InfoTitle(title: "Japon", subtitle: "Pais")
                  ],
                ),
              ),
            ),
            const Spacer(), //para tomar el espacio sobrante es el Spacer
            FadeAnimation(
              intervalStart: 0.5,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(widget.color)),
                  child: const Text(
                    "Volver",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
