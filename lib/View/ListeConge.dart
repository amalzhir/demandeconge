import 'package:flutter/material.dart';
import 'package:demandeconge/ViewModel/api_service.dart';
import 'package:demandeconge/Model/conge_model.dart';
import 'detail_conge.dart';
import 'vide.dart';

class ListeConge extends StatefulWidget {
  const ListeConge({super.key});

  @override
  State<ListeConge> createState() => _ListeCongeState();
}

class _ListeCongeState extends State<ListeConge> {
  int? _value;
  bool isCongeAnnuelSelected = false;
  bool isCongeExceptionnelSelected = false;
  bool isLoading = true;
  late List<CongeModel>? _congeModel = [];


  void initState(){
    super.initState();
    _getData();
  }



  void _getData() async {
    _congeModel = await ApiService().getConge();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        isLoading = false; // Mettre à jour l'état lorsque le chargement est terminé
      });
    });
  }

  Color _getCongeAnnuelBackgroundColor(bool isSelected) {
    return isSelected ? Color(0xFFF16E00) : Colors.grey;
  }

  Color _getCongeAnnuelTextColor(bool isSelected) {
    return isSelected ? Color(0xFFF16E00) : Colors.black;
  }

  void _handleCongeAnnuelTap(bool isSelectedA, bool isSelectedE) {
    setState(() {
      isSelectedA = true;
      isSelectedE = false;
    });
  }

  Color _getCongeExceptionnelBackgroundColor(bool isSelected) {
    return isSelected ? Color(0xFFF16E00) : Colors.grey;
  }

  Color _getCongeExceptionnelTextColor(bool isSelected) {
    return isSelected ? Color(0xFFF16E00) : Colors.black;
  }

  void _handleCongeExceptionnelTap(bool isSelectedA, bool isSelectedE) {
    setState(() {
      isSelectedA = false;
      isSelectedE = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) // Afficher l'ActivityIndicator si les données sont en cours de chargement
          Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
        for (int k = 0; k < _congeModel!.length; k++)
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              height: 200,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            _congeModel![k].title,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            _congeModel![k].status,
                            style: TextStyle(
                              fontSize: 14,
                              color: _congeModel![k].status == 'Annuler'
                                  ? Color(0xffb20000)
                                  : _congeModel![k].status == 'En cours'
                                  ? Color(0xFFFFB4E6)
                                  : Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Image.asset('assets/images/Shape-2.png'),
                              SizedBox(width: 6),
                              Text(_congeModel![k].dateStart),
                              SizedBox(width: 6),
                              Text(
                                '\u2022',
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.55,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(_congeModel![k].dateEnd),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Relancer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF16E00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Ajoutez le radius ici
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailConge(
                                  dateDebut: _congeModel![k].dateStart,
                                  dateFin: _congeModel![k].dateEnd,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Voir détails",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              width: 1,
                              color: Colors.black,
                              style: BorderStyle.solid,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
