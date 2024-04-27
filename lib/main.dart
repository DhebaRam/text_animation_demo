import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:table_calendar/table_calendar.dart';

void main() {
  return runApp(MyApp());
}

/// My app class to display the date range picker
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

/// State for MyApp
class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CalenderScreenUI());
  }
}

class CalenderScreenUI extends StatefulWidget {
  const CalenderScreenUI({super.key});

  @override
  State<CalenderScreenUI> createState() => _CalenderScreenUIState();
}

class _CalenderScreenUIState extends State<CalenderScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    // barrierColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CustomDialog();
                    },
                  );
                },
                child: Text('Click Here')),
          ],
        ));
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalendarFormat _calendarFormat = CalendarFormat.month;
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;
    final kFirstDay = DateTime(
        DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
    final kLastDay = DateTime(
        DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          color: Colors.transparent,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50)),
                child: CustomPaint(
                  painter: MyShape(),
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    // margin: const EdgeInsets.only(top: 10),
                    alignment: AlignmentDirectional.center,
                    height: 402,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(30)),
                    child: TableCalendar(
                      firstDay: kFirstDay,
                      lastDay: kLastDay,
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      weekNumbersVisible: true,
                      pageAnimationEnabled: false,
                      pageJumpingEnabled: false,
                      daysOfWeekHeight: 14,
                      headerStyle: HeaderStyle(
                          titleCentered: true,
                          // titleTextFormatter: (date, locale) => DateFormat.yMMM(locale).format(date),
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      selectedDayPredicate: (day) {
                        // Use `selectedDayPredicate` to determine which day is currently selected.
                        // If this returns true, then `day` will be marked as selected.

                        // Using `isSameDay` is recommended to disregard
                        // the time-part of compared DateTime objects.
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          // Call `setState()` when updating the selected day
                          // setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          // });
                        }
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          // Call `setState()` when updating calendar format
                          // setState(() {
                          _calendarFormat = format;
                          // });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        // No need to call `setState()` here
                        _focusedDay = focusedDay;
                      },
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class MyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint();
    final path = Path();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 0;
    paint.color = Colors.white;
    path.moveTo(0.00, size.height * 0.92);

    path.quadraticBezierTo(
      size.width * 0.00,
      size.height * 0.006,
      size.width * 0.006,
      size.height * 0.06,
    );
    path.quadraticBezierTo(
      size.width * 0.03,
      size.height * 0.006,
      size.width * 0.09,
      size.height * 0.006,
    );

    path.quadraticBezierTo(
      size.width * 0.02,
      size.height * 0.005,
      size.width * 0.428,
      size.height * 0.00,
    );
    path.quadraticBezierTo(
      size.width * 0.44,
      size.height * 0.058,
      size.width * 0.5,
      size.height * 0.06,
    );
    path.quadraticBezierTo(
      size.width * 0.52,
      size.height * 0.058,
      size.width * 0.53,
      size.height * 0.055,
    );
    // path.quadraticBezierTo(
    //   size.width * 0.55,
    //   size.height * 0.054,
    //   size.width * 0.549,
    //   size.height * 0.052,
    // );
    path.quadraticBezierTo(
      size.width * 0.57,
      size.height * 0.035,
      size.width * 0.57,
      size.height * 0.00,
    );

    path.quadraticBezierTo(
      size.width * 0.852,
      size.height * 0.001,
      size.width * 0.9,
      size.height * 0.001,
    );
    path.quadraticBezierTo(
      size.width * 0.982,
      size.height * 0.0,
      size.width * 0.9999,
      size.height * 0.065,
    );
    path.quadraticBezierTo(
      size.width * 0.9999,
      size.height * 0.96,
      size.width * 0.9999,
      size.height * 0.92,
    );
    path.quadraticBezierTo(
      size.width * 0.99,
      size.height * 0.99,
      size.width * 0.9,
      size.height * 1,
    );
    path.quadraticBezierTo(
      size.width * 0,
      size.height * 1,
      size.width * 0.9,
      size.height * 1,
    );
    // path.lineTo(size.width * 0.06, size.height * 1);
    path.quadraticBezierTo(
      size.width * 0.0,
      size.height * 1,
      size.width * 0.1,
      size.height * 1,
    );
    path.quadraticBezierTo(
      size.width * 0.03,
      size.height * 1,
      size.width * 0.005,
      size.height * 0.95,
    );
    path.quadraticBezierTo(
      size.width * 0.00,
      size.height * 0.94,
      size.width * 0.001,
      size.height * 0.915,
    );
    // path.lineTo(size.width * 0.0, size.height * 0.95);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // path.lineTo(0, size.height * 0.8);
    canvas.drawPath(path, paint);
    final paint1 = Paint();
    paint1.style = PaintingStyle.fill;
    paint1.color = Colors.white;
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// import 'examples/adapter_view.dart';
// import 'examples/everything_view.dart';
// import 'examples/info_view.dart';
// import 'examples/playground_view.dart';
// import 'examples/visual_view.dart';
//
// void main() {
//   runApp(const MyApp());
//   _loadShader(); // this is a touch hacky, but works for now.
// }
//
// Future<void> _loadShader() async {
//   return FragmentProgram.fromAsset('assets/shaders/shader.frag').then(
//           (FragmentProgram prgm) {
//         EverythingView.shader = prgm.fragmentShader();
//       }, onError: (Object error, StackTrace stackTrace) {
//     FlutterError.reportError(
//         FlutterErrorDetails(exception: error, stack: stackTrace));
//   });
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Animate Demo',
//       debugShowCheckedModeBanner: false,
//       home: FlutterAnimateExample(),
//     );
//   }
// }
//
// // this is a very quick and dirty example.
// class FlutterAnimateExample extends StatefulWidget {
//   const FlutterAnimateExample({Key? key}) : super(key: key);
//
//   static final List<TabInfo> tabs = [
//     TabInfo(Icons.info_outline, (_) => InfoView(key: UniqueKey()), 'Info',
//         'Simple example of Widget & List animations.'),
//     TabInfo(Icons.palette_outlined, (_) => VisualView(key: UniqueKey()),
//         'Visual', 'Visual effects like saturation, tint, & blur.'),
//     TabInfo(Icons.format_list_bulleted, (_) => const AdapterView(), 'Adapters',
//         'Animations driven by scrolling & user input.'),
//     TabInfo(Icons.grid_on_outlined, (_) => const EverythingView(),
//         'Kitchen Sink', 'Grid view of effects with default settings.'),
//     TabInfo(Icons.science_outlined, (_) => PlaygroundView(key: UniqueKey()),
//         'Playground', 'A blank canvas for experimenting.'),
//   ];
//
//   @override
//   State<FlutterAnimateExample> createState() => _FlutterAnimateExampleState();
// }
//
// class _FlutterAnimateExampleState extends State<FlutterAnimateExample> {
//   int _viewIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF404349),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _viewIndex,
//         selectedFontSize: 12,
//         unselectedFontSize: 12,
//         selectedItemColor: const Color(0xFF80DDFF),
//         unselectedItemColor: const Color(0x998898A0),
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: const Color(0xFF2A2B2F),
//         elevation: 0,
//         onTap: (index) => setState(() => _viewIndex = index),
//         items: [
//           for (final tab in FlutterAnimateExample.tabs)
//             BottomNavigationBarItem(
//               icon: Icon(tab.icon),
//               label: tab.label,
//             )
//         ],
//       ),
//       body: DefaultTextStyle(
//         style: const TextStyle(
//           color: Color(0xFFCCCDCF),
//           fontSize: 14,
//           height: 1.5,
//         ),
//         child: SafeArea(
//           bottom: false,
//           child: FlutterAnimateExample.tabs[_viewIndex].builder(context),
//         ),
//       ),
//     );
//   }
// }
//
// class TabInfo {
//   const TabInfo(this.icon, this.builder, this.label, this.description);
//
//   final IconData icon;
//   final WidgetBuilder builder;
//   final String label;
//   final String description;
// }
