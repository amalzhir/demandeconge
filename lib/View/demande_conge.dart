import 'package:demandeconge/View/calendar.dart';
import 'package:flutter/material.dart';
import 'calendar_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'dart:io';


class DemandeConge extends StatefulWidget {
  const DemandeConge({
    Key? key,
    required this.typeConge,
    required this.typeExcp,
  }) : super(key: key);

  final String typeConge;
  final String typeExcp;

  @override
  State<DemandeConge> createState() => _DemandeCongeState();
}

class _DemandeCongeState extends State<DemandeConge> {

  DateTimeRange? selectedDateRange;
  String? selectedImagePath;
  XFile? pickedFile;
  DateTime dateTime = DateTime.now();
  TextEditingController _dateTaskController = TextEditingController();


  void _onDateChanged(String isoDateString) {
    // Votre implémentation ici
  }
  void initState() {
    super.initState();
    _dateTaskController.addListener(() {
      // Gérez les modifications ici
      // _onDateChanged(_dateTaskController.text);
    });
  }

  void updateSelectedRange(DateTimeRange? range) {
    setState(() {
      selectedDateRange = range;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(  elevation: 0,
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 6),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text("Demander un " + widget.typeConge,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
                Text("Solde associé: 24 jours",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Image.asset(
                  'assets/images/cal2.png',
                ),
                SizedBox(width: 12,),
                Text(widget.typeExcp,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 6),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30,),
            Text("Période *",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(0, 0, 0, 6)
            ),
            ),
            InkWell(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: dateTime,
                  initialDatePickerMode: DatePickerMode.day,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                  locale: Locale('fr', 'FR'),
                  helpText: 'Sélectionner une date',
                  cancelText: 'Annuler',
                  confirmText: 'OK',
                  fieldLabelText: 'Date',
                  errorFormatText: 'Format de date incorrect',
                  errorInvalidText: 'Date invalide',
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: Color(0xFFF16E00), // Couleur principale pour OK
                        colorScheme: ColorScheme.light(
                          primary: Color(0xFFF16E00), // Couleur principale pour OK
                          onPrimary: Colors.white, // Couleur du texte pour la couleur principale
                          surface: Colors.white, // Couleur de l'arrière-plan
                          onSurface: Colors.black, // Couleur du texte pour la couleur de l'arrière-plan
                        ),
                        textTheme: TextTheme(
                          bodyText1: TextStyle(color: Colors.white), // Couleur du texte principal
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (picked != null) {
                  dateTime = picked;
                  _dateTaskController.text = DateFormat.yMd().format(dateTime).toString();
                  _onDateChanged(picked.toIso8601String());
                }
              },



              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFEEEEEE),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Image.asset('assets/images/Shape-2.png',
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Date début",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF666666),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Image.asset('assets/images/Shape-2.png',
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Date Fin",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF666666),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Commentaire",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 6),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Décrivez le sujet de votre congé ici..",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xFFEEEEEE), width: 1)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pièce jointe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 6),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    XFile? localPickedFile;

                    try {
                      localPickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

                      if (localPickedFile != null) {
                        // Handle the selected image, e.g., save the image path or display it
                        print("Selected Image: ${localPickedFile.path}");

                        // Set the selected image path in the state
                        setState(() {
                          selectedImagePath = localPickedFile!.path;
                        });
                      } else {
                        // User canceled image selection
                        print("No image selected");
                      }
                      setState(() {
                        pickedFile = localPickedFile;
                      });
                    } catch (e) {
                      // Print any exception that occurs
                      print("Error picking image: $e");
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFEEEEEE), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          selectedImagePath != null
                              ? "${pickedFile?.name ?? 'Image Importée'}"
                              : "Pièce jointe",
                          style: TextStyle(
                            color: selectedImagePath != null ? Color(0xFFF16E00) : Colors.black, // Change colors accordingly
                          ),
                        ),
                        Spacer(),
                        // Use a Container to control the size of the image
                        Container(
                          width: 50, // Set the desired width
                          height: 50, // Set the desired height
                          child: Image.asset("assets/images/Shape.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (selectedImagePath != null)
                    Image.file(File(selectedImagePath!)),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Soumettre",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF16E00),
                      fixedSize: Size.fromHeight(42),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
                // Autres widgets si nécessaire
              ],
            ),



          ],
    ),
    ),
    );
  }
}

