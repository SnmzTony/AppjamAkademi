import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Takvim Uygulamasi',
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormatter = DateFormat('MMMM yyyy');

  final List<String> _weekDays = [
    'Pzt',
    'Sal',
    'Çar',
    'Per',
    'Cum',
    'Cmt',
    'Paz'
  ];

  final List<int> daysInMonth = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_dateFormatter.format(_selectedDate)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              7,
              (index) => Text(
                _weekDays[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              final int dayOfMonth = index -
                  DateTime(_selectedDate.year, _selectedDate.month, 1).weekday +
                  2;
              if (index <
                      DateTime(_selectedDate.year, _selectedDate.month, 1)
                              .weekday -
                          1 ||
                  dayOfMonth > daysInMonth[_selectedDate.month - 1]) {
                return Container(
                  color: Colors.grey[200],
                );
              } else {
                return GestureDetector(
                  onTap: () => _selectDate(DateTime(
                      _selectedDate.year, _selectedDate.month, dayOfMonth)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: DateTime(_selectedDate.year, _selectedDate.month,
                                  dayOfMonth) ==
                              DateTime.now()
                          ? Colors.blue
                          : null,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        '$dayOfMonth',
                        style: TextStyle(
                          color: DateTime(_selectedDate.year,
                                      _selectedDate.month, dayOfMonth) ==
                                  DateTime.now()
                              ? Colors.white
                              : null,
                          fontWeight: DateTime(_selectedDate.year,
                                      _selectedDate.month, dayOfMonth) ==
                                  DateTime.now()
                              ? FontWeight.bold
                              : null,
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  List<List<int>> getDaysInMonth(int month, int year) {
    List<List<int>> days = [];

    int daysInMonth = this.daysInMonth[month];
    if (month == 1 && year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
      daysInMonth = 29;
    }

    int dayOfWeek = DateTime(year, month, 1).weekday;

    int currentDay = 1;
    for (int i = 0; i < 6; i++) {
      List<int> week = [];
      if (i == 0) {
        for (int j = 0; j < dayOfWeek - 1; j++) {
          week.add(-1);
        }
        for (int j = dayOfWeek - 1; j < 7; j++) {
          week.add(currentDay++);
        }
      } else {
        for (int j = 0; j < 7; j++) {
          if (currentDay > daysInMonth) {
            week.add(-1);
          } else {
            week.add(currentDay++);
          }
        }
      }
      days.add(week);
      if (currentDay > daysInMonth) {
        break;
      }
    }
    return days;
  }
}
