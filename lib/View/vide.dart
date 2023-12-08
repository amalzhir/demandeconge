import 'package:flutter/material.dart';

class Vide extends StatefulWidget {
  const Vide({super.key});

  @override
  State<Vide> createState() => _VideState();
}

class _VideState extends State<Vide> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(30)),
          Image.asset("assets/images/Calendar.png"),
          SizedBox(height: 20,),
          Text("Vous n’avez aucune demande",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xffCCCCCC),
            ),
          ),
          SizedBox(height: 20,),
          Text("Votre liste de demandes de congés \n est actuellement vide",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
