import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarHelper {
  static void openCalendar(
      BuildContext context,
      void Function(List<DateTimeRange>) onDateRangesSelected,
      void Function(DateTimeRange) updateSelectedRange,
      ) {
    DateTime now = DateTime.now();
    DateTime _focusedDay = now;
    DateTime _selectedDay = now;
    CalendarFormat _calendarFormat = CalendarFormat.month;
    List<DateTimeRange> selectedDateRanges = [];
    DateTime? _rangeStart;
    DateTime? _rangeEnd;

    void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
      if (!isSameDay(_selectedDay , selectedDay)){
       /* setState((){

        });*/
      }
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select a date range',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 01, 01),
                        lastDay: DateTime.utc(2050, 05, 15),
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                        calendarFormat: _calendarFormat,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                       onDaySelected: _onDaySelected,
                       rangeStartDay: _rangeStart,
                        rangeEndDay: _rangeEnd,
                        calendarStyle: CalendarStyle(
                          outsideDaysVisible: false,
                        ),
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          setState(() {
                            _focusedDay = focusedDay;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (onDateRangesSelected != null) {
                        onDateRangesSelected(selectedDateRanges);
                      }
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
