import 'package:demandeconge/View/demande_conge.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  var arr = [
    'Mariage du travailleur',
    'Mariage d’un de ses enfants',
    'Naissance d’un enfant',
    'Déménagement',
    'Mariage d’un de ses enfants',
    'Maladie',
    'Autre'
  ];

  bool isCongeAnnuelSelectedB = false;
  bool isCongeExceptionnelSelectedB = false;
  int? _selectedValue;
  String typeConge = "";
  String typeExcp = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.maximize_sharp,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Type de congé",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _handleCongeAnnuelTap();
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _getCongeAnnuelBackgroundColor(),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/cal1.png',
                              color: _getCongeAnnuelTextColor(),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Congé annuels",
                              style: TextStyle(
                                color: _getCongeAnnuelTextColor(),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _handleCongeExceptionnelTap();
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _getCongeExceptionnelBackgroundColor(),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/cal2.png',
                              color: _getCongeExceptionnelTextColor(),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Congé exceptionnels",
                              style: TextStyle(
                                color: _getCongeExceptionnelTextColor(),
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
              if (isCongeExceptionnelSelectedB && !isCongeAnnuelSelectedB) Divider(),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.separated(
                  itemCount: arr.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) => ListTile(
                    leading: Radio(
                      value: index + 1,
                      groupValue: _selectedValue,
                      activeColor: Color(0xFFF16E00),
                      onChanged: (int? value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                    ),
                    title: Text(
                      arr[index],
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: index == arr.length ? Colors.black38 : Colors.black,
                      ),
                    ),
                    onTap: () => {},
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Annuler",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF2F2F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the "Suivant" button press
                        // Add your logic here
                        print("Selected value: $_selectedValue");
                        typeExcp = _selectedValue != null ? arr[(_selectedValue ?? 0) - 1] : "";
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) => DemandeConge(
                                  typeConge: typeConge, typeExcp: typeExcp,))); // Ferme le BottomSheet après la validation
                      },
                      child: Text("Suivant",
                        style: TextStyle(color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                      ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF16E00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
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
    );
  }

  Color _getCongeAnnuelBackgroundColor() {
    return isCongeAnnuelSelectedB ? Color(0xFFF16E00) : Colors.grey;
  }

  Color _getCongeAnnuelTextColor() {
    return isCongeAnnuelSelectedB ? Color(0xFFF16E00) : Colors.black;
  }

  Color _getCongeExceptionnelBackgroundColor() {
    return isCongeExceptionnelSelectedB ? Color(0xFFF16E00) : Colors.grey;
  }

  Color _getCongeExceptionnelTextColor() {
    return isCongeExceptionnelSelectedB ? Color(0xFFF16E00) : Colors.black;
  }

  void _handleCongeAnnuelTap() {
    setState(() {
      typeConge = "congé annuel";
      isCongeAnnuelSelectedB = true;
      isCongeExceptionnelSelectedB = false;
    });
  }

  void _handleCongeExceptionnelTap() {
    setState(() {
      typeConge = "congé exceptionnel";
      isCongeAnnuelSelectedB = false;
      isCongeExceptionnelSelectedB = true;
    });
  }
}
