import 'package:flutter/material.dart';
import 'calendar_helper.dart';

class DetailConge extends StatefulWidget {
  const DetailConge({
    Key? key,
    required this.dateDebut,
    required this.dateFin,
  }) : super(key: key);

  final String dateDebut;
  final String dateFin;

  @override
  State<DetailConge> createState() => _DetailCongeState();
}

class _DetailCongeState extends State<DetailConge> {
  DateTimeRange? selectedRange;



  void updateSelectedRange(DateTimeRange range) {
    setState(() {
      selectedRange = range;
    });
  }
  void _openCalendar(BuildContext context) {
    CalendarHelper.openCalendar(
      context,
          (List<DateTimeRange> selectedDateRanges) {
        for (var dateRange in selectedDateRanges) {
          print('Start Date: ${dateRange.start}, End Date: ${dateRange.end}');
        }
      },
          (DateTimeRange selectedRange) {
        // Handle the update of the selected range
        // For example, you can use it to update the UI
        setState(() {
          // Update your UI with the selectedRange
        });
      },
    );
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Détails congé",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Retirer",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFEEEEEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "Congé annuel",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
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
                      children: [
                        Text(
                          "Durée: 2 Jours",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "en cours",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFB4E6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                _openCalendar(context);

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
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Image.asset('assets/images/Shape-2.png'),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.dateDebut,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '\u2022',
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1.55,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Image.asset('assets/images/Shape-2.png'),
                                  SizedBox(width: 6),
                                  Text(
                                    widget.dateFin,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*
            SizedBox(height: 16),
            if (selectedRange != null)
              Text(
                'Selected Range: ${selectedRange!.start} to ${selectedRange!.end}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),*/
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
            child: Text("Commentaire",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),),),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Enter a message here",
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
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text(
                      "Editer",
                      style: TextStyle(color: Colors.black,
                      fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        width: 1,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Relancer",
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF16E00),
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
    );
  }
}
