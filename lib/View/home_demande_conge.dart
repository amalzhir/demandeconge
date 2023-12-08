import 'package:flutter/material.dart';
import 'package:demandeconge/View/vide.dart';
import 'package:demandeconge/ViewModel/api_service.dart';
import 'package:demandeconge/View/detail_conge.dart';
import 'package:flutter/material.dart';
import 'package:demandeconge/ViewModel/api_service.dart';
import 'package:demandeconge/Model/conge_model.dart';
import 'CustomBottomSheet.dart';
import 'ListeConge.dart';

class HomeDemandeConge extends StatefulWidget {
  const HomeDemandeConge({Key? key}) : super(key: key);

  @override
  _HomeDemandeCongeState createState() => _HomeDemandeCongeState();
}

class _HomeDemandeCongeState extends State<HomeDemandeConge> {
  int? _value;
  int nbCongeAnnuel = 0;
  bool isCongeAnnuelSelected = false;
  bool isCongeExceptionnelSelected = false;
  bool isCongeAnnuelSelectedB = false;
  bool isCongeExceptionnelSelectedB = false;
  bool? hasCongeAnnuel;
  late List<CongeModel>? _congeModel = [];


  void initState(){
    super.initState();
    _getData();
  }



  void _getData() async{
    _congeModel = await(ApiService().getConge())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {} ));
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

  int _testConge(int isConge) {
    return (isConge == 0) ? 1 : 0;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFF16E00),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 1),
            Text(
              "Retour",
              style: TextStyle(
                color: Color(0xFFF16E00),
              ),
            ),
          ],
        ),
      ),
      body: _congeModel == null || _congeModel!.isEmpty?
             const Center(
                child: CircularProgressIndicator(),
             )
    : SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 6),
            ),
            Text(
              "Votre solde de congés",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
            Text(
              "45 jours",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffEEEEEE),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffEEEEEE),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  height: 180,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Vous n'avez pas de congé en cours",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                            ),
                            builder: (BuildContext context) {
                              return CustomBottomSheet();
                            },
                          );
                        },
                        child: Text("Demander un congé",
                        style: TextStyle(color: Colors.white,
                        fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF16E00),
                          fixedSize: Size.fromHeight(42)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mes congés",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "Catégorie de congés",
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 18,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isCongeAnnuelSelected) {
                          isCongeAnnuelSelected = false;
                          isCongeExceptionnelSelected = false;
                        } else {
                          isCongeAnnuelSelected = true;
                          isCongeExceptionnelSelected = false;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _getCongeAnnuelBackgroundColor(isCongeAnnuelSelected),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/cal1.png',
                            color: _getCongeAnnuelTextColor(isCongeAnnuelSelected),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Congé annuels",
                            style: TextStyle(
                              color: _getCongeAnnuelTextColor(isCongeAnnuelSelected),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isCongeAnnuelSelected = false;
                        isCongeExceptionnelSelected = !isCongeExceptionnelSelected;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _getCongeExceptionnelBackgroundColor(isCongeExceptionnelSelected),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/cal2.png',
                            color: _getCongeExceptionnelTextColor(isCongeExceptionnelSelected),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Congé exceptionnels",
                            style: TextStyle(
                              color: _getCongeExceptionnelTextColor(isCongeExceptionnelSelected),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),



            SizedBox(height: 20),
            if (_congeModel!.isEmpty == false || _congeModel!.length > 0)
              if (!isCongeAnnuelSelected && !isCongeExceptionnelSelected)
                ListeConge(),
            if (isCongeAnnuelSelected)
              Column(
                children: [
                  for (int k = 0; k < _congeModel!.length; k++)
                    if (_congeModel![k].title == "CongÃ© annuel")
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
                                      child: Text("Relancer"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFFF16E00),
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
              ),
          ],
        ),
      ),
    );
  }

}



