import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepice_list_2/src/pages/detail_pages.dart';

class ListaPersonajes extends StatefulWidget {
  const ListaPersonajes({super.key});

  @override
  State<ListaPersonajes> createState() => _ListaPersonajesState();
}

class _ListaPersonajesState extends State<ListaPersonajes> {
  double widthPantalla = 0;

  final titulosStyleText = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    widthPantalla = MediaQuery.of(context).size.width -
        50; //Para sacar el tamaño actual en tiempo real de la pantalla
    return Expanded(
      //Propiedad expanded es para que se genere el scroll para que la Listview funcione bien
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text("Portada", style: titulosStyleText),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              bloquesPortadas("p1.jpg", "Titulo: ", "2018"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloquesPortadas("p2.jpg", "Titulo: ", "2022"),
              SizedBox(
                width: widthPantalla * 0.03,
              ),
              bloquesPortadas("p3.jpg", "Titulo: ", "2023"),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
          const SizedBox(
            height: 20,
          ),
          bloquePersonajes("Brook", 0xff4913c4, "o1"),
          bloquePersonajes("Luffy", 0xfff82a2d, "o2"),
          bloquePersonajes("Portgas D. Ace", 0xffffcb28, "o3"),
          bloquePersonajes("Boa Hancock", 0xfffe4649, "o4"),
          bloquePersonajes("Boa Hancock", 0xffdf1c6a, "o5"),
          bloquePersonajes("Roronoa Zoro", 0xff21e295, "o6"),
        ],
      ),
    );
  }

  Widget bloquePersonajes(String nombre, int color, String imagen) {
    return GestureDetector(
      //para detectar los gestos
      onTap: () {
        //al dar click reconoce el click
        Navigator.of(context).push(CupertinoPageRoute(
            //efecto iOS
            builder: (context) => DetailPage(
                color: color,
                imagen: "assets/$imagen.png",
                nombre: nombre))); //para navegar
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(66, 43, 43, 43)),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(color),
                        blurRadius: 20,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.normal,
                        offset: const Offset(0, 5))
                  ], borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(8),
                  child: Hero(
                      tag: color, child: Image.asset("assets/$imagen.png")),
                ),
                const SizedBox(
                  width: 14.0,
                ),
                Text(
                  nombre,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget bloquesPortadas(String image, String titulo, String subTitulo) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            "assets/$image",
            width: widthPantalla * 0.31,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
            //Para trabajar con multiples textos en uno solo y dar estilo diferente a cada uno
            text: TextSpan(
                text: titulo,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                children: [
              TextSpan(
                  text: subTitulo,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 12))
            ]))
      ],
    );
  }
}
