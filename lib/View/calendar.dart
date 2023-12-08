import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  final void Function(DateTimeRange?) onDateRangeChanged;

  const CalendarPage({Key? key, required this.onDateRangeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call showDateRangePicker in the build method to show the calendar directly
    showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((pickedDateRange) {
      onDateRangeChanged(pickedDateRange);
    });

    // Return an empty container, as the UI for this page is displayed via showDateRangePicker
    return Container();
  }
}
